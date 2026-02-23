# Website Sekolah - PHP Native + MySQL

## Struktur Folder

```
sekolah/
├── 📄 index.php              ← Halaman Home
├── 📄 guru.php               ← Halaman Daftar Guru
├── 📄 informasi.php          ← Halaman Informasi & Berita
├── 📄 siswa.php              ← Halaman Data Siswa
├── 📄 lokasi.php             ← Halaman Lokasi (Google Maps)
├── 📄 login.php              ← Halaman Login
├── 📄 koneksi.php            ← Konfigurasi & Koneksi Database
├── 📄 database.sql           ← Script SQL (buat DB & tabel)
├── 📄 generate_hash.php      ← Update password hash (hapus setelah pakai)
│
├── 📁 includes/
│   ├── header.php            ← Header & Navbar publik
│   └── footer.php            ← Footer publik
│
├── 📁 assets/
│   └── css/
│       └── style.css         ← Custom CSS (Kuning, Biru, Putih)
│
├── 📁 uploads/
│   └── guru/                 ← Foto guru
│
└── 📁 admin/
    ├── dashboard.php         ← Dashboard Admin
    ├── pengaturan.php        ← Pengaturan Sistem (Super Admin only)
    ├── logout.php
    │
    ├── includes/
    │   ├── admin_header.php  ← Header panel admin
    │   └── admin_footer.php  ← Footer panel admin
    │
    ├── guru/
    │   ├── index.php         ← Daftar guru
    │   ├── tambah.php        ← Tambah guru
    │   ├── edit.php          ← Edit guru
    │   └── hapus.php         ← Hapus guru
    │
    ├── siswa/
    │   ├── index.php         ← Daftar siswa
    │   ├── tambah.php        ← Tambah siswa
    │   ├── edit.php          ← Edit siswa
    │   └── hapus.php         ← Hapus siswa
    │
    ├── informasi/
    │   ├── index.php         ← Daftar informasi
    │   ├── tambah.php        ← Tambah informasi
    │   ├── edit.php          ← Edit informasi
    │   └── hapus.php         ← Hapus informasi
    │
    └── users/                ← HANYA Super Admin
        ├── index.php         ← Daftar admin
        ├── tambah.php        ← Tambah admin
        ├── edit.php          ← Edit admin
        └── hapus.php         ← Hapus admin
```

---

## Cara Instalasi

### 1. Persiapan Server
- PHP 7.4 atau lebih baru
- MySQL 5.7 / MariaDB 10.x
- Web server: Apache/Nginx (atau XAMPP/LARAGON/WAMP)

### 2. Setup Database
```sql
-- Buka phpMyAdmin atau MySQL CLI, lalu jalankan:
SOURCE /path/to/sekolah/database.sql;
```

### 3. Konfigurasi Koneksi
Edit file `koneksi.php`:
```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');       // sesuaikan
define('DB_PASS', '');           // sesuaikan
define('DB_NAME', 'db_sekolah');
```

Sesuaikan juga `BASE_URL`:
```php
define('BASE_URL', '/sekolah/');  // sesuaikan dengan path server Anda
```

### 4. Setup Password
Buka browser: `http://localhost/sekolah/generate_hash.php`

Ini akan memperbarui password hash untuk akun default.

**⚠️ Hapus file `generate_hash.php` setelah selesai!**

### 5. Akses Website
- **Website:** `http://localhost/sekolah/`
- **Login Admin:** `http://localhost/sekolah/login.php`

---

## Akun Default

| Username | Password | Role |
|----------|----------|------|
| `superadmin` | `password` | Super Admin |
| `admin` | `password` | Admin |

**⚠️ Segera ganti password setelah pertama login!**

---

## Fitur

### Halaman Publik
| Halaman | Deskripsi |
|---------|-----------|
| **Home** | Sambutan, statistik, visualisasi kelas (Chart.js), informasi terbaru |
| **Guru** | Kartu guru dengan foto, nama, mata pelajaran, NIP, email |
| **Informasi** | Berita & pengumuman, filter kategori, detail artikel |
| **Siswa** | Tabel per kelas, filter kelas, pagination, pencarian |
| **Lokasi** | Google Maps embed, alamat, kontak, tombol navigasi |

### Panel Admin
| Fitur | Admin | Super Admin |
|-------|-------|-------------|
| CRUD Guru | ✅ | ✅ |
| CRUD Siswa | ✅ | ✅ |
| CRUD Informasi | ✅ | ✅ |
| Kelola Akun Admin | ❌ | ✅ |
| Pengaturan Sistem | ❌ | ✅ |

---

## Skema Warna
- 🟡 **Kuning:** `#FFD700` — Aksen, tombol utama, border
- 🔵 **Biru Muda:** `#87CEEB` — Navbar, header, highlight
- ⚪ **Putih:** `#FFFFFF` — Background utama, kartu

---

## Teknologi
- **Backend:** PHP 8.x Native (no framework)
- **Database:** MySQL + MySQLi (Prosedural)
- **Frontend:** Bootstrap 5.3 + Custom CSS
- **Icons:** Font Awesome 6.5
- **Charts:** Chart.js 4.4
- **Maps:** Google Maps Embed API

---

## Keamanan
- Semua input di-escape dengan `mysqli_real_escape_string()`
- Password di-hash dengan `password_hash()` (bcrypt)
- Halaman admin dilindungi `session_start()` + cek role
- Super Admin page extra check `cekSuperAdmin()`
- File upload dengan validasi ekstensi dan ukuran
