// =============================================================
// FILE: src/integrations/types/contacts.types.ts
// =============================================================

export type ContactStatus = 'new' | 'in_progress' | 'closed';

/**
 * Backend'in döndürdüğü model (ContactView / contact_messages row)
 */
export interface ContactDto {
  id: string;
  name: string;
  email: string;
  phone: string;
  subject: string;
  message: string;
  /** Genişletilmiş form ek alanları — JSON string */
  form_data?: string | null;

  status: ContactStatus;
  is_resolved: boolean;

  admin_note: string | null;

  ip: string | null;
  user_agent: string | null;
  website: string | null;

  created_at: string | Date;
  updated_at: string | Date;
}

/**
 * UI tarafında normalize ettiğimiz model
 */
export interface Contact {
  id: string;
  name: string;
  email: string;
  phone: string;
  subject: string;
  message: string;
  /** Genişletilmiş form ek alanları — parse edilmiş */
  form_data: Record<string, unknown> | null;

  status: ContactStatus;
  is_resolved: boolean;

  admin_note: string | null;

  ip: string | null;
  user_agent: string | null;
  website: string | null;

  created_at: string; // ISO
  updated_at: string; // ISO
}

function parseFormData(v: string | null | undefined): Record<string, unknown> | null {
  if (!v) return null;
  if (typeof v === 'object') return v as Record<string, unknown>;
  try {
    const o = JSON.parse(v);
    return o && typeof o === 'object' ? (o as Record<string, unknown>) : null;
  } catch {
    return null;
  }
}

export const normalizeContact = (dto: ContactDto): Contact => ({
  id: dto.id,
  name: dto.name,
  email: dto.email,
  phone: dto.phone,
  subject: dto.subject,
  message: dto.message,
  form_data: parseFormData(dto.form_data),

  status: dto.status,
  is_resolved: !!dto.is_resolved,

  admin_note: dto.admin_note ?? null,

  ip: dto.ip ?? null,
  user_agent: dto.user_agent ?? null,
  website: dto.website ?? null,

  created_at:
    typeof dto.created_at === 'string' ? dto.created_at : (dto.created_at?.toISOString?.() ?? ''),
  updated_at:
    typeof dto.updated_at === 'string' ? dto.updated_at : (dto.updated_at?.toISOString?.() ?? ''),
});

/**
 * LIST query params – ContactListParamsSchema ile uyumlu
 */
export interface ContactListQueryParams {
  search?: string;
  status?: ContactStatus;
  resolved?: boolean;
  limit?: number;
  offset?: number;
  orderBy?: 'created_at' | 'updated_at' | 'status' | 'name';
  order?: 'asc' | 'desc';
}

/**
 * PUBLIC create payload – ContactCreateSchema ile uyumlu
 */
export interface ContactCreatePayload {
  name: string;
  email: string;
  phone: string;
  subject: string;
  message: string;
  /**
   * Honeypot alan – genellikle boş bırakılır.
   * Bot doldurursa backend sessizce discard ediyor.
   */
  website?: string | null;
}

/**
 * ADMIN update payload – ContactUpdateSchema ile uyumlu
 */
export interface ContactUpdatePayload {
  status?: ContactStatus;
  is_resolved?: boolean;
  admin_note?: string | null;
}

// Type alias for compatibility
export type ContactView = ContactDto;
