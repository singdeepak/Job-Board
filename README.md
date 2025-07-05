
# Laravel Job Portal

A Laravel-based job portal with admin panel and public job listings.

---

## ✅ Features

### 1. User Authentication

- Implemented using **Laravel Breeze**.
- Seeded Admin user:
  - **Email:** `admin@admin.com`
  - **Password:** `password`

### 2. Job Management (Admin Only)

- Admin can **Create, Read, Update, Delete** jobs.
- Fields in jobs table:
  - `title` (required)
  - `company_name` (required)
  - `location` (required)
  - `job_type` (enum: Full-time, Part-time, Contract)
  - `description` (text)
  - `apply_link` (optional)
  - `logo` (optional image, min: 100x100)
- Logos stored in: `storage/app/public`
- Display logos in job listings

### 3. Public Job Listings Page

- Accessible without login
- Features:
  - **Paginated list** (10 per page)
  - **Search** by `title`, `company name`, `location`
  - **Filter** by `job_type` using a dropdown

### 4. Validation

- Used **FormRequest** classes for validation
- Custom error messages for:
  - `title` field
  - `logo` field

### 5. Artisan Command

- Custom command:
  ```bash
  php artisan report:jobs
