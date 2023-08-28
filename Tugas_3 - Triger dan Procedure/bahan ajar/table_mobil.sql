CREATE DATABASE belajar_basisdata

USE belajar_basisdata

-- START TABLE PEGAWAI
    -- Hapus table
    DROP TABLE pegawai; -- Sebaiknya tidak memakai drop tapi pakai ALTER terlebih dahulu untuk menghindari kehilangan data yang fatal

    -- Buat table
    CREATE TABLE pegawai (
        id_pegawai INT(11) NOT NULL AUTO_INCREMENT,
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
        status_data VARCHAR(255) NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
        PRIMARY KEY (id_pegawai)
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

    -- Isi data pada table
    INSERT INTO pegawai (id_pegawai, username, password, nama_pegawai, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_telp, jabatan, created_at, updated_at, deleted_at, status_data) 
        VALUES 
            (1 , 'oskhar', 'testing', 'muh oskhar', 'jakarta', '2003-04-9', 'pria', 'jakarta barat', '0987634567', 'pegawai', NOW(), NULL, NULL, 'aktif'),
            (2 , 'faiz', 'testing', 'muh oskhar', 'jakarta', '2003-04-9', 'pria', 'jakarta barat', '0987634567', 'pegawai', NOW(), NULL, NULL, 'aktif'),
            (3 , 'vallendra', 'testing', 'muh oskhar', 'jakarta', '2003-04-9', 'pria', 'jakarta barat', '0987634567', 'pegawai', NOW(), NULL, NULL, 'aktif'),
            (4 , 'william afton', 'testing', 'muh oskhar', 'jakarta', '2003-04-9', 'pria', 'jakarta barat', '0987634567', 'pemilik', NOW(), NULL, NULL, 'aktif');

    -- Hapus semua data dalam tabel
    TRUNCATE TABLE pegawai; 

    -- Tampilkan data
    SELECT * FROM pegawai;
-- END TABLE PEGAWAI

-- START TABLE PENYEWA
    -- Hapus tabel
    DROP TABLE penyewa;

    -- Buat tabel
    CREATE TABLE penyewa (
        nik VARCHAR(255) PRIMARY KEY NOT NULL,
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
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

    -- Isi data pada tabel
    INSERT INTO penyewa(nik, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, agama, status_pernikahan, pekerjaan, kewarganegaraan)
    VALUES 
        ('11220910000042', 'oskhar', 'Jakarta', '2003-04-9', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software enginer', 'Indonesia'),
        ('11220910000043', 'faiz', 'Jakarta', '2003-04-9', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software enginer', 'Indonesia'),
        ('11220910000044', 'vallen', 'Jakarta', '2003-04-9', 'pria', 'Jakarta Barat', 'Islam', 'belum menikah', 'software enginer', 'Indonesia');

    -- Hapus semua data dalam tabel
    TRUNCATE TABLE penyewa;

    -- Tampilkan data
    SELECT * FROM penyewa;
-- END TABLE PENYEWA

-- START TABEL HARGA
    -- Hapus tabel
    DROP TABLE harga;

    -- Buat tabel
    CREATE TABLE harga (
        id_harga INT(11) NOT NULL AUTO_INCREMENT,
        harga_perhari DECIMAL(10, 2) NOT NULL,
        jenis_mobil VARCHAR(255) NOT NULL,
        keterangan_harga VARCHAR(255) NOT NULL,
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME NULL,
        deleted_at DATETIME NULL,
        status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif'))
    );

    -- Hapus semua data dalam tabel
    TRUNCATE TABLE harga;

    -- Tampilkan data
    SELECT * FROM harga;
-- END TABEL HARGA

-- START TABEL HARGA
    -- Hapus tabel
    DROP TABLE log_data;

    -- Buat tabel
    CREATE TABLE log_data (
        id_log_data INT(11) NOT NULL AUTO_INCREMENT,
        id_pegawai INT(11) NOT NULL,
        aktivitas VARCHAR(255),
        keterangan VARCHAR(255) NOT NULL CHECK (keterangan IN ('berhasil', 'tidak')),
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME NULL,
        deleted_at DATETIME NULL,
        status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
        FOREIGN KEY (id_pegawai) REFERENCES tbl_pegawai(id_pegawai) ON DELETE CASCADE ON UPDATE CASCADE
    );

    -- Hapus semua data dalam tabel
    TRUNCATE TABLE log_data;

    -- Tampilkan data
    SELECT * FROM log_data;
-- END TABEL HARGA

-- START TABEL HARGA
    -- Hapus tabel
    DROP TABLE mobil;

    -- Buat tabel
    CREATE TABLE mobil (
        id_mobil INT(11) NOT NULL AUTO_INCREMENT,
        id_harga INT(11) NOT NULL,
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
        FOREIGN KEY (id_harga) REFERENCES tbl_harga(id_harga) ON DELETE CASCADE ON UPDATE CASCADE
    );

    -- Hapus semua data dalam tabel
    TRUNCATE TABLE mobil;

    -- Tampilkan data
    SELECT * FROM mobil;
-- END TABEL HARGA

-- START TABEL HARGA
    -- Hapus tabel
    DROP TABLE peminjaman;

    -- Buat tabel
    CREATE TABLE peminjaman (
        id_peminjaman INT(11) NOT NULL AUTO_INCREMENT,
        id_mobil INT(11) NOT NULL,
        id_pegawai INT(11) NOT NULL,
        nik INT(11) NOT NULL,
        lama_peminjaman INT,
        tgl_pinjam DATE,
        tgl_kembali DATE,
        total_harga DECIMAL(10, 2),
        uang_muka DECIMAL(10, 2),
        sisa_pembayaran DECIMAL(10, 2),
        status_peminjaman VARCHAR(255) NOT NULL CHECK (status_peminjaman IN ('Aktif', 'Tidak')),
        keterangan VARCHAR(255) NOT NULL CHECK (keterangan IN ('Denda', 'Tidak')),
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME NULL,
        deleted_at DATETIME NULL,
        status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
        FOREIGN KEY (id_pegawai) REFERENCES tbl_pegawai(id_pegawai) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (id_mobil) REFERENCES tbl_mobil(id_mobil) ON DELETE CASCADE ON UPDATE CASCADE
    );

    -- Hapus semua data dalam tabel
    TRUNCATE TABLE peminjaman;

    -- Tampilkan data
    SELECT * FROM peminjaman;
-- END TABEL HARGA

-- START TABEL DENDA
    -- Hapus tabel
    DROP TABLE denda;

    -- Buat tabel
    CREATE TABLE denda (
        id_denda INT(11) NOT NULL AUTO_INCREMENT,
        id_peminjaman INT(11) NOT NULL,
        tanggal_pembayaran DATE,
        jumlah DECIMAL(10, 2),
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME NULL,
        deleted_at DATETIME NULL,
        status_data VARCHAR(255) NOT NULL DEFAULT 'aktif' CHECK (status_data IN ('aktif', 'tidak aktif')),
        FOREIGN KEY (id_peminjaman) REFERENCES tbl_peminjaman(id_peminjaman) ON DELETE CASCADE ON UPDATE CASCADE
    );

    -- Hapus semua data dalam tabel
    TRUNCATE TABLE denda;

    -- Tampilkan data
    SELECT * FROM denda;
-- END TABEL DENDA