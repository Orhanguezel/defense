import cv2
import numpy as np
import math
import subprocess
import os

def hex_to_bgr(hex_str):
    hex_str = hex_str.lstrip('#')
    rgb = tuple(int(hex_str[i:i+2], 16) for i in (0, 2, 4))
    return (rgb[2], rgb[1], rgb[0]) # BGR for OpenCV

def main():
    img_path = '/home/orhan/Documents/Projeler/sultandefense.com/docs/product-images/_extra/SAVRONIK_pdf_page_997_image_1_xref_9680_premium.jpg'
    img = cv2.imread(img_path)
    if img is None:
        print("Error: Could not load image")
        return

    # Image dimensions (1024x1024)
    img_h, img_w, _ = img.shape
    print(f"Source image loaded: {img_w}x{img_h}")

    # Convert to HSV to shift cyan to gold
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    h, s, v = cv2.split(hsv)

    # Cyan is around Hue 75-115 in OpenCV
    lower_cyan = np.array([75, 40, 40])
    upper_cyan = np.array([115, 255, 255])
    mask = cv2.inRange(hsv, lower_cyan, upper_cyan)

    # Convert target colors
    # Mat Ottoman Gold: #C5A880 -> BGR (128, 168, 197)
    gold_bgr = hex_to_bgr('#C5A880')
    gold_hsv = cv2.cvtColor(np.uint8([[gold_bgr]]), cv2.COLOR_BGR2HSV)[0][0]

    # Shift Hue by -72 (cyan ~90 -> gold ~18)
    shifted_h = h.copy()
    shifted_s = s.copy()
    shifted_v = v.copy()

    shifted_h[mask > 0] = (shifted_h[mask > 0].astype(int) - 72) % 180
    # Saturation adjustments for a more premium metallic gold look
    shifted_s[mask > 0] = np.clip(shifted_s[mask > 0].astype(float) * 0.85, 0, 255).astype(np.uint8)
    
    # We can also add some Deep Bordo (#7A1B22) accents to the very high intensity parts
    # Let's find very bright cyan pixels and make them Bordo or warm reddish gold
    bordo_bgr = hex_to_bgr('#7A1B22')
    
    # Reconstruct the gold-shifted base image
    gold_base = cv2.cvtColor(cv2.merge([shifted_h, shifted_s, shifted_v]), cv2.COLOR_HSV2BGR)

    # Parameters for the video
    fps = 30
    duration_sec = 10
    total_frames = fps * duration_sec
    width, height = 1920, 1080

    # Crop parameters
    crop_w, crop_h = 800, 450  # 16:9 aspect ratio
    
    # Setup video writer pipe to FFmpeg for high-quality H264 compression
    video_dir = '/home/orhan/Documents/Projeler/sultandefense.com/scratch'
    os.makedirs(video_dir, exist_ok=True)
    temp_avi_path = os.path.join(video_dir, 'temp_output.avi')
    final_mp4_path = '/home/orhan/Documents/Projeler/sultandefense.com/frontend/public/media/hero.mp4'
    
    # Ensure frontend media directory exists
    os.makedirs(os.path.dirname(final_mp4_path), exist_ok=True)

    # Create directory for backend video upload as well
    backend_video_dir = '/home/orhan/Documents/Projeler/sultandefense.com/backend/uploads/video'
    os.makedirs(backend_video_dir, exist_ok=True)
    backend_mp4_path = os.path.join(backend_video_dir, 'hero.mp4')

    fourcc = cv2.VideoWriter_fourcc(*'XVID')
    out = cv2.VideoWriter(temp_avi_path, fourcc, fps, (width, height))

    print("Generating frames...")
    for t in range(total_frames):
        # Progress indicator
        if t % 30 == 0:
            print(f"Frame {t}/{total_frames}")

        # 1. Seamless loop coordinates (panning in a figure-8 / Lissajous curve)
        # Using 2*pi*t/total_frames ensures starting and ending positions are identical.
        angle = 2 * math.pi * t / total_frames
        
        # Center of the crop moves smoothly
        x_c = int(512 + 80 * math.sin(angle))
        y_c = int(512 + 120 * math.cos(angle))

        # Dynamic zoom: crop size fluctuates slightly to simulate camera zoom
        # Zoom factor goes between 0.80 and 0.90 of the max size
        zoom_factor = 0.85 + 0.05 * math.sin(angle * 2)
        frame_crop_w = int(crop_w * zoom_factor)
        frame_crop_h = int(crop_h * zoom_factor)

        # Crop boundaries
        x1 = max(0, x_c - frame_crop_w // 2)
        y1 = max(0, y_c - frame_crop_h // 2)
        x2 = min(img_w, x1 + frame_crop_w)
        y2 = min(img_h, y1 + frame_crop_h)

        # Crop and resize to 1920x1080
        cropped = gold_base[y1:y2, x1:x2]
        frame = cv2.resize(cropped, (width, height), interpolation=cv2.INTER_CUBIC)

        # 2. Dynamic Gold Pulse Effect
        # Shift intensity of gold elements slightly to make them "breath" or glow dynamically
        pulse_factor = 1.0 + 0.08 * math.sin(angle * 4) # 4 cycles over 10 seconds
        
        # We can apply the pulse to pixels that are gold-colored
        # Let's detect gold-colored pixels in the current frame
        frame_hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
        # Gold Hue is around 18
        gold_mask = cv2.inRange(frame_hsv, np.array([12, 40, 40]), np.array([24, 255, 255]))
        
        # Apply brightness pulse
        h_f, s_f, v_f = cv2.split(frame_hsv)
        v_f_pulsed = v_f.astype(float)
        v_f_pulsed[gold_mask > 0] *= pulse_factor
        v_f_pulsed = np.clip(v_f_pulsed, 0, 255).astype(np.uint8)
        frame = cv2.cvtColor(cv2.merge([h_f, s_f, v_f_pulsed]), cv2.COLOR_HSV2BGR)

        # 3. Add Premium HUD / Tactical Overlays
        # A. Subtle Grid Overlay
        # Draw thin dark grid lines with low opacity
        grid_overlay = frame.copy()
        grid_spacing_x = 120
        grid_spacing_y = 120
        grid_color = (60, 50, 40) # Subtle golden dark brown
        for x in range(0, width, grid_spacing_x):
            cv2.line(grid_overlay, (x, 0), (x, height), grid_color, 1)
        for y in range(0, height, grid_spacing_y):
            cv2.line(grid_overlay, (0, y), (width, y), grid_color, 1)
        cv2.addWeighted(grid_overlay, 0.15, frame, 0.85, 0, frame)

        # B. Scanning Radar line
        # Moves from top to bottom (perfect loop)
        scan_y = int((t / total_frames) * height)
        # Draw a glowing line
        # Main core line: bright gold
        cv2.line(frame, (0, scan_y), (width, scan_y), (128, 168, 197), 1) # BGR for gold
        # Glow around it (opacity fade)
        glow_height = 20
        glow_overlay = frame.copy()
        for offset in range(1, glow_height):
            opacity = 0.15 * (1.0 - (offset / glow_height))
            # upper glow
            if scan_y - offset >= 0:
                cv2.line(glow_overlay, (0, scan_y - offset), (width, scan_y - offset), (128, 168, 197), 1)
            # lower glow
            if scan_y + offset < height:
                cv2.line(glow_overlay, (0, scan_y + offset), (width, scan_y + offset), (128, 168, 197), 1)
            cv2.addWeighted(glow_overlay, opacity, frame, 1.0 - opacity, 0, frame)

        # C. Corner Brackets (Target Lock / Viewfinder HUD)
        bracket_color = (128, 168, 197) # Gold
        bracket_len = 30
        bracket_thick = 2
        pad = 40
        # Top-Left
        cv2.line(frame, (pad, pad), (pad + bracket_len, pad), bracket_color, bracket_thick)
        cv2.line(frame, (pad, pad), (pad, pad + bracket_len), bracket_color, bracket_thick)
        # Top-Right
        cv2.line(frame, (width - pad, pad), (width - pad - bracket_len, pad), bracket_color, bracket_thick)
        cv2.line(frame, (width - pad, pad), (width - pad, pad + bracket_len), bracket_color, bracket_thick)
        # Bottom-Left
        cv2.line(frame, (pad, height - pad), (pad + bracket_len, height - pad), bracket_color, bracket_thick)
        cv2.line(frame, (pad, height - pad), (pad, height - pad - bracket_len), bracket_color, bracket_thick)
        # Bottom-Right
        cv2.line(frame, (width - pad, height - pad), (width - pad - bracket_len, height - pad), bracket_color, bracket_thick)
        cv2.line(frame, (width - pad, height - pad), (width - pad, height - pad - bracket_len), bracket_color, bracket_thick)

        # D. Center Reticle (very subtle)
        cx, cy = width // 2, height // 2
        cv2.line(frame, (cx - 15, cy), (cx - 5, cy), bracket_color, 1)
        cv2.line(frame, (cx + 5, cy), (cx + 15, cy), bracket_color, 1)
        cv2.line(frame, (cx, cy - 15), (cx, cy - 5), bracket_color, 1)
        cv2.line(frame, (cx, cy + 5), (cx, cy + 15), bracket_color, 1)
        cv2.circle(frame, (cx, cy), 3, bracket_color, -1)

        # E. Add "SYSTEM ACTIVE" text and telemetry watermarks
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, "SULTAN DEFENSE TACTICAL LINK", (pad + 10, pad + bracket_len + 20), font, 0.5, bracket_color, 1, cv2.LINE_AA)
        cv2.putText(frame, f"SYS.STATUS: SECURE // LOOP_T+{t*0.33:.1f}s", (pad + 10, pad + bracket_len + 45), font, 0.4, bracket_color, 1, cv2.LINE_AA)
        
        # Bottom right coordinate telemetry
        lat_val = 39.9207 + 0.0001 * math.sin(angle)
        lon_val = 32.8541 + 0.0001 * math.cos(angle)
        cv2.putText(frame, f"LOC: {lat_val:.5f}N / {lon_val:.5f}E", (width - pad - 240, height - pad - 10), font, 0.4, bracket_color, 1, cv2.LINE_AA)

        # Write frame
        out.write(frame)

    out.release()
    print("Temporary video written. Transcoding with ffmpeg to H.264 MP4 for web compliance...")

    # Transcode to H264 web compatible MP4 using ffmpeg
    # We write to both the frontend public media and backend uploads folders.
    for path_to_save in [final_mp4_path, backend_mp4_path]:
        print(f"Encoding to {path_to_save}...")
        ffmpeg_cmd = [
            'ffmpeg', '-y',
            '-i', temp_avi_path,
            '-c:v', 'libx264',
            '-pix_fmt', 'yuv420p',
            '-preset', 'slow',
            '-crf', '22', # Good quality/size trade-off
            path_to_save
        ]
        
        try:
            subprocess.run(ffmpeg_cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            print(f"Successfully created: {path_to_save}")
        except subprocess.CalledProcessError as e:
            print(f"Error transcoding to {path_to_save}: {e.stderr.decode()}")
            return

    # Clean up temp file
    if os.path.exists(temp_avi_path):
        os.remove(temp_avi_path)
        print("Cleaned up temporary AVI file.")

if __name__ == '__main__':
    main()
