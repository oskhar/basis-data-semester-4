-- =+=+= START DATABASE =+=+=
CREATE DATABASE db_musik;

-- Menggunakan database musuk
USE db_musik;

-- =+=+= DROP ALL TABLE =+=+=
DROP TABLE tb_rekaman;
DROP TABLE tb_artis;
DROP TABLE tb_detail_artis;
DROP TABLE tb_genre;
DROP TABLE tb_album;
DROP TABLE tb_lagu;

-- ===== START TABEL REKAMAN =====
DROP TABLE tb_rekaman;
-- Membuat tabel
CREATE TABLE tb_rekaman(
	id_rekaman INT(11) NOT NULL AUTO_INCREMENT,
	nama_rekaman VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
	status_data VARCHAR(255) NOT NULL DEFAULT "Aktif" CHECK (status_data IN ("Aktif", "Tidak Aktif")),
    PRIMARY KEY (id_rekaman)
);

-- Melihat isi data
SELECT * FROM tb_rekaman;
-- ===== END TABEL REKAMAN =====

-- ===== START TABEL ARTIS =====
DROP TABLE tb_artis;
-- Membuat tabel
CREATE TABLE tb_artis(
	id_artis INT(11) NOT NULL AUTO_INCREMENT,
	nama_artis VARCHAR(255) NOT NULL,
	keterangan VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
	status_data VARCHAR(255) NOT NULL DEFAULT "Aktif" CHECK (status_data IN ("Aktif", "Tidak Aktif")),
    PRIMARY KEY (id_artis)
);
-- Melihat isi data
SELECT * FROM tb_artis;
-- ===== END TABEL ARTIS =====

-- ===== START TABEL ARTIS =====
DROP TABLE tb_detail_artis;
-- Membuat tabel
CREATE TABLE tb_detail_artis(
	id_detail_artis INT(11) NOT NULL AUTO_INCREMENT,
	id_artis INT(11) NOT NULL,
	nama_asli VARCHAR(255) NOT NULL,
	tempat_lahir VARCHAR(255) NOT NULL,
	tanggal_lahir VARCHAR(255) NOT NULL,
	instrument VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
	status_data VARCHAR(255) NOT NULL DEFAULT "Aktif" CHECK (status_data IN ("Aktif", "Tidak Aktif")),
    PRIMARY KEY (id_detail_artis)
);
	

-- Melihat isi data
SELECT * FROM tb_detail_artis order by id_artis asc;
-- ===== END TABEL ARTIS =====

-- ===== START TABEL GENRE =====
DROP TABLE tb_genre;
-- Membuat tabel
CREATE TABLE tb_genre(
	id_genre INT(11) NOT NULL AUTO_INCREMENT,
	nama_genre VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
	status_data VARCHAR(255) NOT NULL DEFAULT "Aktif" CHECK (status_data IN ("Aktif", "Tidak Aktif")),
    PRIMARY KEY (id_genre)
);

-- Melihat isi data
SELECT * FROM tb_genre order by id_genre;
-- ===== END TABEL GENRE =====

-- ===== START TABEL ALBUM =====
DROP TABLE tb_album;
-- Membuat tabel
CREATE TABLE tb_album(
	id_album INT(11) NOT NULL AUTO_INCREMENT,
	id_artis INT(11) NOT NULL,
	id_rekaman INT(11) NOT NULL,
	id_genre INT(11) NOT NULL,
	nama_album VARCHAR(255) NOT NULL,
	rilis year NOT NULL, -- default format time YYYY:mm:dd
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
	status_data VARCHAR(255) NOT NULL DEFAULT "Aktif" CHECK (status_data IN ("Aktif", "Tidak Aktif")),
    PRIMARY KEY (id_album)
);

-- melihat isi data
SELECT * FROM tb_album;
-- ===== END TABEL ALBUM =====

-- ===== START TABEL LAGU =====
DROP TABLE tb_lagu;
-- Membuat tabel
CREATE TABLE tb_lagu(
	id_lagu INT(11) NOT NULL AUTO_INCREMENT,
	id_album INT(11) NOT NULL,
	nama_lagu VARCHAR(255) NOT NULL,
	keterangan VARCHAR(255) NOT NULL,
	durasi time NOT NULL, -- default format time HH:mm:ss
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
	status_data VARCHAR(255) NOT NULL DEFAULT "Aktif" CHECK (status_data IN ("Aktif", "Tidak Aktif")),
    PRIMARY KEY (id_lagu)
);

-- melihat data lagu
SELECT * FROM tb_lagu;
-- ===== END TABEL LAGU =====

-- =+=+= JAWAB SOAL =+=+=
-- 1.) Nama nama lagu yang hits tahun 2000 sampai 2010
SELECT nama_lagu
	FROM tb_lagu
		INNER JOIN tb_album ON tb_lagu.id_album = tb_album.id_album
		WHERE tb_album.rilis BETWEEN 2000 AND 2010
		AND tb_lagu.status_data = 'Aktif';

-- 2.) Nama nama vokalis yang lahir di jakarta
SELECT nama_artis
	FROM tb_artis
		INNER JOIN tb_detail_artis ON tb_artis.id_artis = tb_detail_artis.id_artis
		WHERE tb_detail_artis.tempat_lahir = 'Jakarta'
		AND tb_artis.status_data = 'Aktif';

-- 3.) Banyak jumlah instrumen yang tersedia pada pada tabel detail artis
SELECT COUNT(DISTINCT instrument) AS jumlah_instrumen
	FROM tb_detail_artis;

-- 4.) Durasi lagu dari album "Mestakung" dan "SKA Phobia"
SELECT tb_album.nama_album, SUM(TIME_TO_SEC(tb_lagu.durasi)) AS total_durasi
	FROM tb_lagu
		INNER JOIN tb_album ON tb_lagu.id_album = tb_album.id_album
		WHERE tb_album.nama_album IN ('Mestakung', 'SKA Phobia')
		AND tb_lagu.status_data = 'Aktif'
		GROUP BY tb_album.nama_album;

-- 5.) Jumlah lagu hits yang dibuat oleh Tipe-X