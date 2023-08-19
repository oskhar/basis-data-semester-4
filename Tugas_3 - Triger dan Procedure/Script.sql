-- Buat database
CREATE DATABASE belajar_basisdata;

USE belajar_basisdata;

-- START TABLE PEGAWAI

-- Buat table
CREATE TABLE pegawai (
    id_pegawai INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    nama_pegawai NVARCHAR(255) NULL,
    tempat_lahir NVARCHAR(255) NULL,
    tanggal_lahir DATE NULL,
    jenis_kelamin NVARCHAR(255) NULL CHECK (jenis_kelamin IN ('pria', 'wanita')),
    alamat NVARCHAR(255) NULL,
    no_telp NVARCHAR(255) NULL,
    jabatan NVARCHAR(255) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data NVARCHAR(255) NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
);

-- Isi data pada table
INSERT INTO pegawai (username, password, nama_pegawai, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_telp, jabatan, created_at)
VALUES 
    ('oskhar', 'testing', 'muh oskhar', 'jakarta', '2003-04-09', 'pria', 'jakarta barat', '0987634567', 'mahasiswa', CURRENT_TIMESTAMP),
    ('faiz', 'testing', 'muh oskhar', 'jakarta', '2003-04-09', 'pria', 'jakarta barat', '0987634567', 'mahasiswa', CURRENT_TIMESTAMP),
    ('vallendra', 'testing', 'muh oskhar', 'jakarta', '2003-04-09', 'pria', 'jakarta barat', '0987634567', 'mahasiswa', CURRENT_TIMESTAMP);

-- Hapus semua data dalam tabel
TRUNCATE TABLE pegawai;

-- Tampilkan data
SELECT * FROM pegawai;
-- END TABLE PEGAWAI

-- START TABLE PENYEWA

-- Buat tabel
CREATE TABLE penyewa (
    nik NVARCHAR(255) NOT NULL PRIMARY KEY,
    nama NVARCHAR(255) NOT NULL,
    tempat_lahir NVARCHAR(255) NOT NULL,
    tanggal_lahir DATE NOT NULL,
    jenis_kelamin NVARCHAR(255) NOT NULL,
    alamat NVARCHAR(255) NOT NULL,
    agama NVARCHAR(255) NOT NULL,
    status_pernikahan NVARCHAR(255) NOT NULL CHECK (status_pernikahan IN ('menikah', 'belum menikah')),
    pekerjaan NVARCHAR(255) NOT NULL,
    kewarganegaraan NVARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data NVARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
);

-- Isi data pada tabel
INSERT INTO penyewa(nik, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, agama, status_pernikahan, pekerjaan, kewarganegaraan)
VALUES 
    ('11220910000042', 'oskhar', 'Jakarta', '2003-04-09', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software engineer', 'Indonesia'),
    ('11220910000043', 'faiz', 'Jakarta', '2003-04-09', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software engineer', 'Indonesia'),
    ('11220910000044', 'vallen', 'Jakarta', '2003-04-09', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software engineer', 'Indonesia');

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
    jenis_mobil NVARCHAR(255) NOT NULL,
    keterangan_harga NVARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data NVARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
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
    aktivitas NVARCHAR(255),
    keterangan NVARCHAR(255) NOT NULL CHECK (keterangan IN ('berhasil', 'tidak')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data NVARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
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
    nama_mobil NVARCHAR(255),
    plat_nomor NVARCHAR(255),
    nomor_mesin NVARCHAR(255) UNIQUE,
    nomor_rangka NVARCHAR(255) UNIQUE,
    isi_silinder DECIMAL(10, 2),
    tahun_produksi NVARCHAR(255),
    jenis_mobil NVARCHAR(255),
    status_mobil NVARCHAR(255) NOT NULL DEFAULT 'Tersedia' CHECK (status_mobil IN ('Tersedia', 'Tidak')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data NVARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
    FOREIGN KEY (id_harga) REFERENCES harga(id_harga) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Isi data pada tabel
INSERT INTO mobil (id_harga, nama_mobil, plat_nomor, nomor_mesin, nomor_rangka, isi_silinder, tahun_produksi, jenis_mobil, status_mobil, created_at)
VALUES
    (1, 'Toyota Camry', 'B 1234 AB', 'XY123456', 'R123456', 2.4, '2022', 'Sedan', 'Tersedia', CURRENT_TIMESTAMP),
    (2, 'Honda CR-V', 'B 5678 CD', 'YZ789012', 'R789012', 2.0, '2023', 'SUV', 'Tersedia', CURRENT_TIMESTAMP),
    (3, 'Mitsubishi Xpander', 'B 9012 EF', 'AB345678', 'R345678', 1.5, '2022', 'MPV', 'Tersedia', CURRENT_TIMESTAMP);

-- Hapus semua data dalam tabel
DELETE FROM mobil;

-- Tampilkan data
SELECT * FROM mobil;
-- END TABEL MOBIL

-- START TABEL PEMINJAMAN

-- Buat tabel
CREATE TABLE peminjaman (
    id_peminjaman INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_mobil INT NOT NULL,
    id_pegawai INT NOT NULL,
    nik NVARCHAR(20) NOT NULL,
    lama_hari_peminjaman INT NOT NULL,
    tanggal_pinjam DATE NOT NULL,
    tanggal_kembali DATE NULL,
    total_harga DECIMAL(10, 2) NULL,
    uang_muka DECIMAL(10, 2) NOT NULL,
    sisa_pembayaran DECIMAL(10, 2) NULL,
    status_peminjaman NVARCHAR(255) NOT NULL CHECK (status_peminjaman IN ('aktif', 'tidak')),
    keterangan NVARCHAR(255) NOT NULL CHECK (keterangan IN ('denda', 'tidak')),
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
    status_data NVARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Isi data pada tabel
INSERT INTO peminjaman (id_mobil, id_pegawai, nik, lama_hari_peminjaman, tanggal_pinjam, tanggal_kembali, total_harga, uang_muka, sisa_pembayaran, status_peminjaman, keterangan, created_at)
VALUES
    (1, 1, '11220910000042', 5, '2023-08-01', '2023-08-06', 750000, 250000, 500000, 'aktif', 'tidak', CURRENT_TIMESTAMP),
    (2, 2, '11220910000043', 3, '2023-08-02', '2023-08-05', 600000, 200000, 400000, 'aktif', 'tidak', CURRENT_TIMESTAMP),
    (3, 3, '11220910000044', 4, '2023-08-03', '2023-08-07', 720000, 240000, 480000, 'aktif', 'tidak', CURRENT_TIMESTAMP);

-- Hapus semua data dalam tabel
DELETE FROM peminjaman;

-- Tampilkan data
SELECT * FROM peminjaman;
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
    status_data NVARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
    FOREIGN KEY (id_peminjaman) REFERENCES peminjaman(id_peminjaman) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Isi data pada tabel denda
INSERT INTO denda (id_peminjaman, tanggal_pembayaran, jumlah, created_at, status_data)
VALUES
    (1, '2023-08-07', 500000, CURRENT_TIMESTAMP, 'aktif'),
    (2, '2023-08-06', 300000, CURRENT_TIMESTAMP, 'aktif'),
    (3, '2023-08-08', 600000, CURRENT_TIMESTAMP, 'aktif');

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
    DECLARE v_username_pegawai NVARCHAR(100);
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
    DECLARE v_username_pegawai NVARCHAR(100);
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
    v_nik NVARCHAR(20)
)
BEGIN
    DECLARE v_mobil_id INT;
    DECLARE v_pegawai_id INT;
    DECLARE v_penyewa_nik NVARCHAR(20);
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
    DECLARE v_nik NVARCHAR(20);
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
