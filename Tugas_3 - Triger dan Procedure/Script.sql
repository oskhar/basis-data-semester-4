-- Buat database
CREATE DATABASE belajar_basisdata;

USE belajar_basisdata;

-- START TABLE PEGAWAI

-- Buat table
CREATE TABLE pegawai (
    id_pegawai INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nama_pegawai VARCHAR(255) NULL,
    tempat_lahir VARCHAR(255) NULL,
    tanggal_lahir DATE NULL,
    jenis_kelamin VARCHAR(255) NULL CHECK (jenis_kelamin IN ('pria', 'wanita')),
    alamat VARCHAR(255) NULL,
    no_telp VARCHAR(255) NULL,
    jabatan VARCHAR(255) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data VARCHAR(255) NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
);

-- Isi data pada table
INSERT INTO pegawai (username, password, nama_pegawai, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_telp, jabatan, created_at)
VALUES 
    ('oskhar', 'testing', 'muh oskhar', 'jakarta', '2003-04-09', 'pria', 'jakarta barat', '0987634567', 'pegawai', CURRENT_TIMESTAMP),
    ('faiz', 'testing', 'muh oskhar', 'jakarta', '2003-04-09', 'pria', 'jakarta barat', '0987634567', 'pegawai', CURRENT_TIMESTAMP),
    ('vallendra', 'testing', 'muh oskhar', 'jakarta', '2003-04-09', 'pria', 'jakarta barat', '0987634567', 'pegawai', CURRENT_TIMESTAMP),
    ('william afton', 'testing', 'muh oskhar', 'jakarta', '2003-04-09', 'pria', 'jakarta barat', '0987634567', 'pemilik', CURRENT_TIMESTAMP);

-- Hapus semua data dalam tabel
TRUNCATE TABLE pegawai;

-- Tampilkan data
SELECT * FROM pegawai;
-- END TABLE PEGAWAI

-- START TABLE PENYEWA

-- Buat tabel
CREATE TABLE penyewa (
    nik VARCHAR(255) NOT NULL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    tempat_lahir VARCHAR(255) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    jenis_kelamin VARCHAR(255) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    agama VARCHAR(255) NOT NULL,
    status_pernikahan VARCHAR(255) NOT NULL CHECK (status_pernikahan IN ('menikah', 'belum menikah')),
    pekerjaan VARCHAR(255) NOT NULL,
    kewarganegaraan VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
);

-- Isi data pada tabel
-- Insert data ke tabel penyewa
INSERT INTO penyewa (nik, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, agama, status_pernikahan, pekerjaan, kewarganegaraan)
    VALUES
        ('12345678901234', 'John Doe', 'Jakarta', '1990-01-15', 'Laki-laki', 'Jl. Jalan No. 123', 'Islam', 'belum menikah', 'Pegawai', 'Indonesia'),
        ('98765432109876', 'Jane Smith', 'Bandung', '1995-03-25', 'Perempuan', 'Jl. Raya No. 456', 'Kristen', 'belum menikah', 'Mahasiswa', 'Indonesia'),
        ('45678901234567', 'Michael Johnson', 'Surabaya', '1988-09-10', 'Laki-laki', 'Jl. Utama No. 789', 'Kristen', 'menikah', 'Pengusaha', 'Indonesia'),
        ('23456789012345', 'Jessica Lee', 'Medan', '1992-05-07', 'Perempuan', 'Jl. Maju No. 567', 'Buddha', 'belum menikah', 'Dokter', 'Indonesia'),
        ('67890123456789', 'David Brown', 'Yogyakarta', '1987-11-20', 'Laki-laki', 'Jl. Baru No. 890', 'Hindu', 'menikah', 'Guru', 'Indonesia'),
        ('34567890123456', 'Emily Davis', 'Semarang', '1993-12-03', 'Perempuan', 'Jl. Lama No. 123', 'Islam', 'belum menikah', 'Wirausaha', 'Indonesia'),
        ('89012345678901', 'Robert Wilson', 'Solo', '1985-07-18', 'Laki-laki', 'Jl. Barat No. 456', 'Kristen', 'menikah', 'Pegawai Negeri', 'Indonesia'),
        ('56789012345678', 'Sophia Miller', 'Malang', '1997-02-28', 'Perempuan', 'Jl. Timur No. 789', 'Katolik', 'belum menikah', 'Mahasiswa', 'Indonesia'),
        ('01234567890123', 'William Taylor', 'Bali', '1989-10-09', 'Laki-laki', 'Jl. Pantai No. 123', 'Hindu', 'menikah', 'Pengusaha', 'Indonesia'),
        ('78901234567890', 'Olivia Martinez', 'Samarinda', '1994-06-12', 'Perempuan', 'Jl. Sungai No. 456', 'Islam', 'belum menikah', 'Dokter', 'Indonesia'),
        ('23456789012312', 'James Anderson', 'Pontianak', '1986-04-30', 'Laki-laki', 'Jl. Gunung No. 567', 'Kristen', 'menikah', 'Guru', 'Indonesia'),
        ('90123456789012', 'Isabella White', 'Manado', '1991-08-24', 'Perempuan', 'Jl. Laut No. 890', 'Kristen', 'belum menikah', 'Wirausaha', 'Indonesia'),
        ('45678901234511', 'Daniel Garcia', 'Makassar', '1996-11-06', 'Laki-laki', 'Jl. Udara No. 123', 'Islam', 'belum menikah', 'Pegawai Swasta', 'Indonesia'),
        ('12345678901211', 'Ava Brown', 'Padang', '1988-12-15', 'Perempuan', 'Jl. Rantau No. 456', 'Buddha', 'menikah', 'Mahasiswa', 'Indonesia'),
        ('98765432109811', 'Ethan Wilson', 'Palembang', '1993-05-28', 'Laki-laki', 'Jl. Bukit No. 789', 'Hindu', 'belum menikah', 'Pengusaha', 'Indonesia'),
        ('23456789012311', 'Mia Davis', 'Balikpapan', '1987-09-10', 'Perempuan', 'Jl. Pesisir No. 123', 'Kristen', 'menikah', 'Dokter', 'Indonesia'),
        ('67890123456711', 'Alexander Johnson', 'Makassar', '1992-03-23', 'Laki-laki', 'Jl. Pelabuhan No. 456', 'Islam', 'belum menikah', 'Guru', 'Indonesia'),
        ('34567890123411', 'Sofia Martinez', 'Jayapura', '1998-01-17', 'Perempuan', 'Jl. Malam No. 789', 'Kristen', 'belum menikah', 'Mahasiswa', 'Indonesia'),
        ('89012345678911', 'Jackson Taylor', 'Banjarmasin', '1989-07-04', 'Laki-laki', 'Jl. Perkampungan No. 123', 'Islam', 'menikah', 'Wirausaha', 'Indonesia'),
        ('56789012345611', 'Scarlett Brown', 'Tangerang', '1994-04-27', 'Perempuan', 'Jl. Indah No. 456', 'Kristen', 'belum menikah', 'Pegawai Swasta', 'Indonesia'),
        ('01234567890111', 'Liam Wilson', 'Ambon', '1986-06-08', 'Laki-laki', 'Jl. Serasi No. 123', 'Kristen', 'menikah', 'Mahasiswa', 'Indonesia'),
        ('11220910000042', 'oskhar', 'Jakarta', '2003-04-09', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software engineer', 'Indonesia'),
        ('11220910000043', 'faiz', 'Jakarta', '2003-04-09', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software engineer', 'Indonesia'),
        ('11220910000044', 'vallen', 'Jakarta', '2003-04-09', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software engineer', 'Indonesia');

-- Dummy data sebanyak 500 data
INSERT INTO penyewa (nik, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, agama, status_pernikahan, pekerjaan, kewarganegaraan)
SELECT
    LPAD(FLOOR(RAND() * 1000000), 6, '0') AS nik,
    CONCAT('Nama ', FLOOR(RAND() * 500)) AS nama,
    CONCAT('Tempat Lahir ', FLOOR(RAND() * 500)) AS tempat_lahir,
    DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 50) YEAR) AS tanggal_lahir,
    CASE WHEN RAND() > 0.5 THEN 'Laki-laki' ELSE 'Perempuan' END AS jenis_kelamin,
    CONCAT('Alamat ', FLOOR(RAND() * 500)) AS alamat,
    CASE WHEN RAND() > 0.5 THEN 'Islam' ELSE 'Kristen' END AS agama,
    CASE WHEN RAND() > 0.5 THEN 'menikah' ELSE 'belum menikah' END AS status_pernikahan,
    CONCAT('Pekerjaan ', FLOOR(RAND() * 500)) AS pekerjaan,
    CASE WHEN RAND() > 0.5 THEN 'WNI' ELSE 'WNA' END AS kewarganegaraan
FROM information_schema.tables AS t1
JOIN information_schema.tables AS t2
JOIN information_schema.tables AS t3
LIMIT 500;

-- Hapus semua data dalam tabel
DELETE FROM penyewa;

-- Tampilkan data
SELECT * FROM penyewa;
-- END TABLE PENYEWA

-- START TABEL HARGA

-- Buat tabel
CREATE TABLE harga (
    id_harga INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    harga_perhari DECIMAL(10, 2) NOT NULL,
    jenis_mobil VARCHAR(255) NOT NULL,
    keterangan_harga VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
);

-- Isi data pada tabel
INSERT INTO harga (harga_perhari, jenis_mobil, keterangan_harga, created_at)
VALUES
    (150000, 'Sedan', 'Harga sewa per hari untuk mobil sedan', CURRENT_TIMESTAMP),
    (200000, 'SUV', 'Harga sewa per hari untuk mobil SUV', CURRENT_TIMESTAMP),
    (180000, 'MPV', 'Harga sewa per hari untuk mobil MPV', CURRENT_TIMESTAMP);

-- Hapus semua data dalam tabel
DELETE FROM harga;

-- Tampilkan data
SELECT * FROM harga;
-- END TABEL HARGA

-- START TABEL LOG_DATA

-- Buat tabel
CREATE TABLE log_data (
    id_log_data INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_pegawai INT NOT NULL,
    aktivitas VARCHAR(255),
    keterangan VARCHAR(255) NOT NULL CHECK (keterangan IN ('berhasil', 'tidak')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
);

-- Isi data pada tabel
INSERT INTO log_data (id_pegawai, aktivitas, keterangan, created_at)
VALUES
    (1, 'Login', 'berhasil', CURRENT_TIMESTAMP),
    (2, 'Logout', 'berhasil', CURRENT_TIMESTAMP),
    (3, 'Access Denied', 'tidak', CURRENT_TIMESTAMP);

-- Hapus semua data dalam tabel
DELETE FROM log_data;

-- Tampilkan data
SELECT * FROM log_data;
-- END TABEL LOG_DATA

-- START TABEL MOBIL

-- Buat tabel
CREATE TABLE mobil (
    id_mobil INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_harga INT NOT NULL,
    nama_mobil VARCHAR(255),
    plat_nomor VARCHAR(255),
    nomor_mesin VARCHAR(255) UNIQUE,
    nomor_rangka VARCHAR(255) UNIQUE,
    isi_silinder DECIMAL(10, 2),
    tahun_produksi VARCHAR(255),
    jenis_mobil VARCHAR(255),
    status_mobil VARCHAR(255) NOT NULL DEFAULT 'Tersedia' CHECK (status_mobil IN ('Tersedia', 'Tidak')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
    FOREIGN KEY (id_harga) REFERENCES harga(id_harga) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Isi data pada tabel
INSERT INTO mobil (id_harga, nama_mobil, plat_nomor, nomor_mesin, nomor_rangka, isi_silinder, tahun_produksi, jenis_mobil)
VALUES
    (1, 'Toyota Camry', 'B 1234 AB', 'XY12345', 'R12456', 2.4, '2022', 'mobil keluarga'),
    (2, 'Honda CR-V', 'B 5678 CD', 'YZ789012', 'R789012', 2.0, '2023', 'mobil sedan'),
    (3, 'Mitsubishi Xpander', 'B 9012 EF', 'AB345678', 'R345678', 1.5, '2022', 'mobil keluarga'),
    (2, 'Suzuki Ertiga', 'B 1234 CD', 'ABC123456', 'XYZ98654', 1.5, '2022', 'mobil keluarga'),
    (1, 'Nissan Serena', 'B 5678 EF', 'DEF123456', 'UVW987654', 2.0, '2022', 'mobil keluarga'),
    (1, 'Toyota Avanza', 'B 9012 GH', 'GHI123456', 'PQR987654', 1.3, '2022', 'mobil keluarga'),
    (1, 'Toyota AE 86', 'C 1234 AB', 'JKL123456', 'MNO987654', 2.0, '2022', 'mobil sedan'),
    (3, 'Toyota Vios', 'C 5678 CD', 'PQR123456', 'STU987654', 1.5, '2022', 'mobil sedan'),
    (3, 'Toyota Corolla Altis', 'C 9012 EF', 'VWX123456', 'YZA987654', 1.8, '2022', 'mobil sedan'),
    (1, 'Toyota Innova', 'B 3456 JK', 'XYZ123456', 'UVW567890', 2.5, '2022', 'mobil keluarga'),
    (1, 'Honda Civic', 'D 1234 AB', 'MNO123456', 'XYZ98754', 1.8, '2022', 'mobil sedan'),
    (1, 'Mitsubishi Xpander', 'B 7890 CD', 'ABC789012', 'PQR345678', 1.5, '2022', 'mobil keluarga'),
    (3, 'Mazda 3', 'D 5678 EF', 'DEF789012', 'STU345678', 2.0, '2022', 'mobil sedan'),
    (2, 'Kia Grand Carnival', 'B 2345 GH', 'GHI789012', 'UVW345678', 2.2, '2022', 'mobil keluarga');
   
-- Hapus semua data dalam tabel
DELETE FROM mobil;

-- Tampilkan data
SELECT * FROM mobil;
-- END TABEL MOBIL

-- START TABEL PEMINJAMAN
DROP TABLE peminjaman;
-- Buat tabel
CREATE TABLE peminjaman (
    id_peminjaman INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_mobil INT NOT NULL,
    id_pegawai INT NOT NULL,
    nik VARCHAR(20) NOT NULL,
    lama_hari_peminjaman INT NOT NULL,
    tanggal_pinjam DATE NOT NULL,
    tanggal_kembali DATE NULL,
    total_harga DECIMAL(10, 2) NULL,
    uang_muka DECIMAL(10, 2) NOT NULL,
    sisa_pembayaran DECIMAL(10, 2) NULL,
    status_peminjaman VARCHAR(255) NOT NULL CHECK (status_peminjaman IN ('aktif', 'tidak')),
    keterangan VARCHAR(255) NOT NULL CHECK (keterangan IN ('denda', 'tidak')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);

-- Isi data pada tabel
INSERT INTO peminjaman (id_mobil, id_pegawai, nik, lama_hari_peminjaman, tanggal_pinjam, tanggal_kembali, total_harga, uang_muka, sisa_pembayaran, status_peminjaman, keterangan)
VALUES
    (211, 1, '11220910000042', 5, '2023-08-01', '2023-08-06', 750000, 250000, 500000, 'aktif', 'tidak'),
    (212, 2, '11220910000043', 3, '2023-08-02', '2023-08-05', 600000, 200000, 400000, 'aktif', 'tidak'),
    (213, 3, '11220910000044', 4, '2023-08-03', '2023-08-07', 720000, 240000, 480000, 'aktif', 'tidak');

-- Hapus semua data dalam tabel
DELETE FROM peminjaman;

-- Tampilkan data
SELECT * FROM penyewa;
SELECT * FROM peminjaman;
SELECT * FROM mobil;
-- END TABEL PEMINJAMAN

-- START TABEL DENDA

-- Buat tabel
CREATE TABLE denda (
    id_denda INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_peminjaman INT NOT NULL,
    tanggal_pembayaran DATE,
    jumlah DECIMAL(10, 2),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
    FOREIGN KEY (id_peminjaman) REFERENCES peminjaman(id_peminjaman) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Isi data pada tabel denda
INSERT INTO denda (id_peminjaman, tanggal_pembayaran, jumlah, created_at, status_data)
VALUES
    (43, '2023-08-07', 500000, CURRENT_TIMESTAMP, 'aktif'),
    (44, '2023-08-06', 300000, CURRENT_TIMESTAMP, 'aktif'),
    (45, '2023-08-08', 600000, CURRENT_TIMESTAMP, 'aktif');

-- Hapus semua data dalam tabel
DELETE FROM denda;

-- Tampilkan data
SELECT * FROM denda;
-- END TABEL DENDA

-- HAPUS SEMUA DATA PADA TABEL

DELETE FROM pegawai;
DELETE FROM penyewa;
DELETE FROM harga;
DELETE FROM log_data;
DELETE FROM mobil;
DELETE FROM peminjaman;
DELETE FROM denda;
-- END HAPUS SEMUA DATA PADA TABEL

-- HAPUS TABEL
-- Hapus tabel denda
DROP TABLE IF EXISTS denda;
-- Hapus tabel peminjaman
DROP TABLE IF EXISTS peminjaman;
-- Hapus tabel mobil
DROP TABLE IF EXISTS mobil;
-- Hapus tabel log_data
DROP TABLE IF EXISTS log_data;
-- Hapus tabel harga
DROP TABLE IF EXISTS harga;
-- Hapus tabel penyewa
DROP TABLE IF EXISTS penyewa;
-- Hapus tabel pegawai
DROP TABLE IF EXISTS pegawai;
-- END HAPUS TABEL

-- TRIGGER log_data pada tabel penyewa
DELIMITER //
CREATE TRIGGER tr_log_data BEFORE INSERT ON penyewa
FOR EACH ROW
BEGIN
    DECLARE v_id_used INT;
    SELECT id_pegawai INTO v_id_used FROM pegawai WHERE username = 'pemilik1';

    INSERT INTO log_data (id_pegawai, aktivitas, keterangan, created_at, status_data)
    VALUES (v_id_used, 'INSERT table penyewa', 'Berhasil', NOW(), 'aktif');
END;
//
DELIMITER ;

-- TRIGGER rollback pegawai
DELIMITER //
CREATE TRIGGER tr_rollback_mobil BEFORE INSERT ON mobil
FOR EACH ROW
BEGIN
    DECLARE v_username_pegawai VARCHAR(100);
    SELECT username INTO v_username_pegawai FROM pegawai WHERE id_pegawai = 4;
    
    IF (v_username_pegawai != 'pemilik1') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Anda bukan pemilik';
    ELSE
        INSERT INTO mobil (id_harga, nama_mobil, plat_nomor, nomor_mesin, nomor_rangka, isi_silinder, tahun_produksi, jenis_mobil, status_mobil, created_at)
        SELECT NEW.id_harga, NEW.nama_mobil, NEW.plat_nomor, NEW.nomor_mesin, NEW.nomor_rangka, NEW.isi_silinder, NEW.tahun_produksi, NEW.jenis_mobil, NEW.status_mobil, NOW();
    END IF;
END;
//
DELIMITER ;

-- TRIGGER rollback table harga
DELIMITER //
CREATE TRIGGER tr_rollback_harga BEFORE INSERT ON harga
FOR EACH ROW
BEGIN
    DECLARE v_username_pegawai VARCHAR(100);
    SELECT username INTO v_username_pegawai FROM pegawai WHERE id_pegawai = 4;
    
    IF (v_username_pegawai != 'pemilik1') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Anda bukan pemilik';
    ELSE
        INSERT INTO harga (harga_perhari, jenis_mobil, keterangan_harga, created_at, status_data)
        SELECT NEW.harga_perhari, NEW.jenis_mobil, NEW.keterangan_harga, NOW(), 'aktif';
    END IF;
END;
//
DELIMITER ;

-- TRIGGER tanggal dibuat pada tabel penyewa
DELIMITER //
CREATE TRIGGER tr_WaktuDibuat AFTER INSERT ON penyewa
FOR EACH ROW
BEGIN
    UPDATE penyewa SET created_at = NOW() WHERE nik = NEW.nik;
END;
//
DELIMITER ;

-- TRIGGER tanggal dibuat pada tabel peminjaman
DELIMITER //
CREATE TRIGGER tr_WaktuDibuat1 AFTER INSERT ON peminjaman
FOR EACH ROW
BEGIN
    UPDATE peminjaman SET created_at = NOW() WHERE id_peminjaman = NEW.id_peminjaman;
END;
//
DELIMITER ;

-- Stored procedure untuk insert pada tabel peminjaman
DELIMITER //
CREATE PROCEDURE sp_tcl_peminjaman (
    v_id_mobil INT,
    v_id_pegawai INT,
    v_nik VARCHAR(20)
)
BEGIN
    DECLARE v_mobil_id INT;
    DECLARE v_pegawai_id INT;
    DECLARE v_penyewa_nik VARCHAR(20);
    DECLARE v_id_harga INT;
    DECLARE v_total_harga DECIMAL(10, 2);

    SELECT id_mobil INTO v_mobil_id FROM mobil WHERE id_mobil = v_id_mobil;
    SELECT id_pegawai INTO v_pegawai_id FROM pegawai WHERE id_pegawai = v_id_pegawai;
    SELECT nik INTO v_penyewa_nik FROM penyewa WHERE nik = v_nik;

    IF (v_mobil_id IS NULL OR v_pegawai_id IS NULL OR v_penyewa_nik IS NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data tidak valid';
    ELSE
        SELECT id_harga INTO v_id_harga FROM mobil WHERE id_mobil = v_id_mobil;
        SELECT harga_perhari INTO v_total_harga FROM harga WHERE id_harga = v_id_harga;

        INSERT INTO peminjaman (id_mobil, id_pegawai, nik, status_peminjaman, keterangan, created_at, status_data, total_harga, sisa_pembayaran)
        VALUES (v_id_mobil, v_id_pegawai, v_nik, 'aktif', 'tidak', NOW(), 'aktif', v_total_harga, v_total_harga);
    END IF;
END;
//
DELIMITER ;

-- TRIGGER tr_trig_pinjam pada tabel peminjaman
DELIMITER //
CREATE TRIGGER tr_trig_pinjam AFTER INSERT ON peminjaman
FOR EACH ROW
BEGIN
    DECLARE v_id_peminjaman INT;
    DECLARE v_id_mobil INT;
    DECLARE v_id_pegawai INT;
    DECLARE v_nik VARCHAR(20);
    DECLARE v_uang_muka DECIMAL(10, 2);
    DECLARE v_id_harga INT;
    DECLARE v_total_harga DECIMAL(10, 2);

    SELECT id_peminjaman, id_mobil, id_pegawai, nik, uang_muka INTO v_id_peminjaman, v_id_mobil, v_id_pegawai, v_nik, v_uang_muka FROM Inserted;

    SELECT id_harga INTO v_id_harga FROM mobil WHERE id_mobil = v_id_mobil;
    SELECT harga_perhari INTO v_total_harga FROM harga WHERE id_harga = v_id_harga;

    CALL sp_tcl_peminjaman(v_id_mobil, v_id_pegawai, v_nik);

    UPDATE peminjaman
    SET total_harga = v_total_harga, sisa_pembayaran = v_total_harga - v_uang_muka, tanggal_pinjam = NOW()
    WHERE id_peminjaman = v_id_peminjaman;
END;
//
DELIMITER ;

-- TRIGGER tr_trig_denda pada tabel peminjaman
DELIMITER //
CREATE TRIGGER tr_trig_denda AFTER UPDATE ON peminjaman
FOR EACH ROW
BEGIN
    DECLARE v_id_peminjaman INT;
    DECLARE v_tanggal_pinjam DATE;
    DECLARE v_tanggal_kembali DATE;
    DECLARE v_lama_pinjam INT;
    DECLARE v_target DATE;

    SELECT id_peminjaman, tanggal_pinjam, tanggal_kembali, lama_hari_peminjaman INTO v_id_peminjaman, v_tanggal_pinjam, v_tanggal_kembali, v_lama_pinjam FROM Inserted;

    SET v_target = DATE_ADD(v_tanggal_pinjam, INTERVAL v_lama_pinjam DAY);

    IF (v_target < v_tanggal_kembali) THEN
        INSERT INTO denda (id_peminjaman, tanggal_pembayaran, jumlah, created_at, status_data)
        VALUES (v_id_peminjaman, NOW(), 500000, NOW(), 'aktif');
    END IF;

    UPDATE peminjaman SET status_peminjaman = 'Dikembalikan' WHERE id_peminjaman = v_id_peminjaman;
END;
//
DELIMITER ;
