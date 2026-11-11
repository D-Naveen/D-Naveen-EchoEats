/** Base URL for the Django backend API (configurable via VITE_API_URL for deployment). */
export const API_BASE_URL = (import.meta.env.VITE_API_URL || 'http://localhost:3000').replace(/\/+$/, '');

/** Public Razorpay key ID used by checkout. */
export const RAZORPAY_KEY_ID = import.meta.env.VITE_RAZORPAY_KEY_ID || '';
