const rawApiUrl = (import.meta.env.VITE_API_URL || 'http://localhost:3000').trim();
const normalizedApiUrl = /^https?:\/\//i.test(rawApiUrl) ? rawApiUrl : `https://${rawApiUrl}`;

/** Base URL for the Django backend API (configurable via VITE_API_URL for deployment). */
export const API_BASE_URL = normalizedApiUrl.replace(/\/+$/, '');

/** Public Razorpay key ID used by checkout. */
export const RAZORPAY_KEY_ID = import.meta.env.VITE_RAZORPAY_KEY_ID || '';
