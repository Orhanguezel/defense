import cv2
import numpy as np

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

    # Convert to HSV
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    h, s, v = cv2.split(hsv)

    # Let's find the cyan/blue pixels
    # Cyan is around Hue 80-105 (OpenCV range 0-180)
    # Let's create a mask for cyan colors
    lower_cyan = np.array([75, 40, 40])
    upper_cyan = np.array([115, 255, 255])
    mask = cv2.inRange(hsv, lower_cyan, upper_cyan)

    # We want to shift these cyan pixels to Mat Ottoman Gold (#C5A880) and Deep Bordo (#7A1B22)
    # Let's convert target gold to HSV
    gold_bgr = hex_to_bgr('#C5A880')
    gold_hsv = cv2.cvtColor(np.uint8([[gold_bgr]]), cv2.COLOR_BGR2HSV)[0][0]
    
    bordo_bgr = hex_to_bgr('#7A1B22')
    bordo_hsv = cv2.cvtColor(np.uint8([[bordo_bgr]]), cv2.COLOR_BGR2HSV)[0][0]

    # Let's apply a smooth hue shift or direct color mapping for the mask
    # For a high-quality glow, we can shift the Hue of the masked pixels to the gold hue
    # Gold Hue in OpenCV HSV is gold_hsv[0] (which is around 18)
    # Cyan Hue is around 90. So we shift hue of pixels in mask.
    shifted_h = h.copy()
    shifted_s = s.copy()
    shifted_v = v.copy()

    # Shift Hue: we want to map cyan hue (~90) to gold hue (~18)
    # The shift is -72.
    # To keep it smooth, we can interpolate or offset:
    # new_hue = (old_hue - 72) % 180
    shifted_h[mask > 0] = (shifted_h[mask > 0].astype(int) - 72) % 180
    
    # Let's also adjust saturation and value to fit the gold palette
    # Gold has lower saturation than intense cyan, let's scale it slightly
    # gold_hsv[1] is around 90, cyan saturation is often 200+
    # We can scale saturation slightly for masked pixels to make it feel like genuine gold
    shifted_s[mask > 0] = np.clip(shifted_s[mask > 0].astype(float) * (gold_hsv[1] / 200.0), 0, 255).astype(np.uint8)

    # Combine back
    hsv_gold = cv2.merge([shifted_h, shifted_s, shifted_v])
    img_gold = cv2.cvtColor(hsv_gold, cv2.COLOR_HSV2BGR)

    # Save output to check
    cv2.imwrite('/home/orhan/Documents/Projeler/sultandefense.com/scratch/gold_test.jpg', img_gold)
    print("Gold test image saved!")

if __name__ == '__main__':
    main()
