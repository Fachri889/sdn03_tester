-- ============================================
-- DATABASE WEBSITE SEKOLAH
-- ============================================

CREATE DATABASE IF NOT EXISTS db_sekolah_sdn03 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_sekolah_sdn03;

-- Tabel Users (Admin & Super Admin)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nama_lengkap VARCHAR(100) NOT NULL,
    role ENUM('admin', 'superadmin') NOT NULL DEFAULT 'admin',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel Guru
CREATE TABLE IF NOT EXISTS guru (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    mata_pelajaran VARCHAR(100) NOT NULL,
    foto VARCHAR(255) DEFAULT NULL,
    nip VARCHAR(30) DEFAULT NULL,
    email VARCHAR(100) DEFAULT NULL,
    telp VARCHAR(20) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel Siswa
CREATE TABLE IF NOT EXISTS siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    nis VARCHAR(20) NOT NULL UNIQUE,
    kelas VARCHAR(20) NOT NULL,
    jenis_kelamin ENUM('L', 'P') NOT NULL,
    alamat TEXT DEFAULT NULL,
    telp VARCHAR(20) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel Informasi (Berita & Pengumuman)
CREATE TABLE IF NOT EXISTS informasi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(200) NOT NULL,
    konten TEXT NOT NULL,
    kategori ENUM('berita', 'pengumuman') NOT NULL DEFAULT 'berita',
    gambar VARCHAR(255) DEFAULT NULL,
    penulis VARCHAR(100) DEFAULT NULL,
    status ENUM('aktif', 'nonaktif') NOT NULL DEFAULT 'aktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel Pengaturan Sistem
CREATE TABLE IF NOT EXISTS pengaturan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kunci VARCHAR(50) NOT NULL UNIQUE,
    nilai TEXT,
    keterangan VARCHAR(200)
);

-- ============================================
-- DATA AWAL (SEED)
-- ============================================

-- Super Admin default (password: superadmin123)
INSERT INTO users (username, password, nama_lengkap, role) VALUES
('superadmin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Super Administrator', 'superadmin'),
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrator', 'admin');
-- Default password untuk keduanya: "password"
-- Gunakan password_hash() di PHP untuk generate hash baru

-- Data Guru Contoh
INSERT INTO guru (nama, mata_pelajaran, nip, email) VALUES
('Budi Santoso, S.Pd', 'Matematika', '197501012005011001', 'budi@sekolah.sch.id'),
('Siti Rahayu, S.Pd', 'Bahasa Indonesia', '198002152006022002', 'siti@sekolah.sch.id'),
('Ahmad Fauzi, S.T', 'Fisika', '197803202007011003', 'ahmad@sekolah.sch.id'),
('Dewi Kusuma, S.Pd', 'Biologi', '198506102009022004', 'dewi@sekolah.sch.id'),
('Rudi Hartono, S.Pd', 'Sejarah', '197212052004011005', 'rudi@sekolah.sch.id'),
('Rina Wulandari, S.Pd', 'Bahasa Inggris', '198909152012022006', 'rina@sekolah.sch.id');

-- Data Siswa Contoh
INSERT INTO siswa (nama, nis, kelas, jenis_kelamin, alamat) VALUES
('Andi Pratama', '2024001', 'X-A', 'L', 'Jl. Merdeka No. 1'),
('Bela Safitri', '2024002', 'X-A', 'P', 'Jl. Sudirman No. 5'),
('Cahya Ramadhan', '2024003', 'X-B', 'L', 'Jl. Diponegoro No. 10'),
('Dinda Aulia', '2024004', 'X-B', 'P', 'Jl. Gatot Subroto No. 3'),
('Eko Setiawan', '2024005', 'XI-A', 'L', 'Jl. Imam Bonjol No. 7'),
('Fitri Handayani', '2024006', 'XI-A', 'P', 'Jl. Ahmad Yani No. 12'),
('Galih Prabowo', '2024007', 'XI-B', 'L', 'Jl. Veteran No. 8'),
('Hana Permata', '2024008', 'XI-B', 'P', 'Jl. Pahlawan No. 15'),
('Irfan Maulana', '2024009', 'XII-A', 'L', 'Jl. Kartini No. 4'),
('Jeni Astuti', '2024010', 'XII-A', 'P', 'Jl. Pattimura No. 6');

-- Data Informasi Contoh
INSERT INTO informasi (judul, konten, kategori, penulis, status) VALUES
('Selamat Tahun Ajaran Baru 2024/2025', 'Kami dengan bangga mengumumkan dimulainya tahun ajaran baru 2024/2025. Semoga seluruh siswa dapat meraih prestasi terbaik.', 'pengumuman', 'Admin', 'aktif'),
('Lomba Olimpiade Sains Tingkat Kabupaten', 'Sekolah kami berhasil meraih juara 1 pada Olimpiade Sains Tingkat Kabupaten tahun ini. Selamat kepada seluruh peserta!', 'berita', 'Admin', 'aktif'),
('Jadwal Ujian Tengah Semester', 'Ujian Tengah Semester akan dilaksanakan pada tanggal 15-20 Oktober 2024. Seluruh siswa diharapkan mempersiapkan diri dengan baik.', 'pengumuman', 'Admin', 'aktif');

-- Pengaturan Sistem
INSERT INTO pengaturan (kunci, nilai, keterangan) VALUES
('nama_sekolah', 'SMA Negeri 1 Contoh', 'Nama lengkap sekolah'),
('alamat', 'Jl. Pendidikan No. 1, Kota Contoh, Provinsi Contoh', 'Alamat sekolah'),
('telp', '(021) 1234567', 'Nomor telepon sekolah'),
('email', 'info@sma1contoh.sch.id', 'Email sekolah'),
('maps_embed', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.521260322485!2d106.8195613!3d-6.194741999999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f5390917b759%3A0x6b45e67356080477!2sMonumen%20Nasional!5e0!3m2!1sen!2sid!4v1234567890', 'Embed URL Google Maps'),
('visi', 'Menjadi sekolah unggulan yang menghasilkan lulusan berkarakter, berprestasi, dan berjiwa Pancasila.', 'Visi sekolah'),
('misi', 'Menyelenggarakan pendidikan berkualitas tinggi dengan lingkungan belajar yang kondusif dan inovatif.', 'Misi sekolah'),
('kepala_sekolah', 'Drs. H. Suparman, M.Pd', 'Nama kepala sekolah');
