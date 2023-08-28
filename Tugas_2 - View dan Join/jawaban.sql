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
-- Hapus data
TRUNCATE tb_rekaman;
-- Menambahkan data
INSERT INTO tb_rekaman (nama_rekaman)
	VALUES
		('Rekaman A'),
		('Rekaman B'),
		('Rekaman C'),
		('Rekaman D'),
		('Rekaman E'),
		('Aquarius Musikindo');

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
-- Hapus data
TRUNCATE tb_artis;
-- Menambahkan data
INSERT INTO tb_artis (nama_artis, keterangan)
	VALUES
		('Type-X', 'Keterangan Artis X'),
		('Artis Y', 'Keterangan Artis Y'),
		('Artis Z', 'Keterangan Artis Z'),
		('Artis W', 'Keterangan Artis W'),
		('Artis V', 'Keterangan Artis V'),
		('Artis U', 'Keterangan Artis U');

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
-- Hapus data
TRUNCATE tb_detail_artis;
-- Menambahkan data
INSERT INTO tb_detail_artis (id_artis, nama_asli, tempat_lahir, tanggal_lahir, instrument)
	VALUES
		(1, 'Nama Asli X1', 'Jakarta', '1990-01-01', 'Gitar'),
		(2, 'Nama Asli Y1', 'Bandung', '1985-02-15', 'Vokal'),
		(3, 'Nama Asli Z1', 'Surabaya', '1992-05-20', 'Reggae'),
		(4, 'Nama Asli W1', 'Medan', '1991-07-10', 'Drum'),
		(5, 'Nama Asli V1', 'Yogyakarta', '1988-09-30', 'Keyboard'),
		(6, 'Nama Asli U1', 'Semarang', '1993-12-25', 'Reggae');

-- Melihat isi data
SELECT * FROM tb_detail_artis;
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
-- Menambahk
-- Hapus data
TRUNCATE tb_genre;
-- Insert data ke tabel tb_genre
INSERT INTO tb_genre (nama_genre)
	VALUES
		('Jazz'),
		('Blues'),
		('Metal'),
		('Punk'),
		('Folk'),
		('Electronic');

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
	rilis YEAR NOT NULL, -- default format time YYYY:mm:dd
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
	status_data VARCHAR(255) NOT NULL DEFAULT "Aktif" CHECK (status_data IN ("Aktif", "Tidak Aktif")),
    PRIMARY KEY (id_album)
);
-- Hapus data
TRUNCATE tb_album;
-- Menambahkan data
INSERT INTO tb_album (id_artis, id_rekaman, id_genre, nama_album, rilis)
	VALUES
		(1, 1, 1, 'Mestakung', '2007-01-01'),
		(2, 2, 2, 'SKA Phobia', '2012-03-20'),
		(3, 3, 3, 'Album Z', '2005-06-15'),
		(4, 4, 4, 'Album W', '2010-08-10'),
		(5, 5, 5, 'Album V', '2013-10-30'),
		(6, 6, 6, 'Album U', '2008-12-25');

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
	durasi TIME NOT NULL, -- default format time HH:mm:ss
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NULL,
    deleted_at DATETIME NULL,
	status_data VARCHAR(255) NOT NULL DEFAULT "Aktif" CHECK (status_data IN ("Aktif", "Tidak Aktif")),
    PRIMARY KEY (id_lagu)
);
-- Hapus data
TRUNCATE tb_lagu;
-- Menambahkan data
INSERT INTO tb_lagu (id_album, nama_lagu, keterangan, durasi)
	VALUES
		(1, 'Lagu 1', 'Hits', '00:03:30'),
		(1, 'Lagu 2', 'Non Hits', '00:04:15'),
		(1, 'Lagu 3', 'Hits', '00:03:45'),
		(1, 'Lagu 4', 'Non Hits', '00:04:00'),
		(1, 'Lagu 5', 'Hits', '00:03:20'),
		(2, 'Lagu 6', 'Hits', '00:04:30'),
		(2, 'Lagu 7', 'Non Hits', '00:03:50'),
		(2, 'Lagu 8', 'Hits', '00:03:15'),
		(2, 'Lagu 9', 'Hits', '00:04:10'),
		(2, 'Lagu 10', 'Non Hits', '00:03:30'),
		(3, 'Lagu 11', 'Hits', '00:03:40'),
		(3, 'Lagu 12', 'Hits', '00:04:05'),
		(3, 'Lagu 13', 'Non Hits', '00:03:55'),
		(3, 'Lagu 14', 'Hits', '00:03:25'),
		(3, 'Lagu 15', 'Non Hits', '00:04:20'),
		(4, 'Lagu 16', 'Hits', '00:03:35'),
		(4, 'Lagu 17', 'Non Hits', '00:03:50'),
		(4, 'Lagu 18', 'Hits', '00:03:30'),
		(4, 'Lagu 19', 'Hits', '00:04:05'),
		(4, 'Lagu 20', 'Non Hits', '00:03:40'),
		(5, 'Lagu 21', 'Hits', '00:04:10'),
		(5, 'Lagu 22', 'Non Hits', '00:03:30'),
		(5, 'Lagu 23', 'Hits', '00:03:45'),
		(5, 'Lagu 24', 'Non Hits', '00:03:20'),
		(5, 'Lagu 25', 'Hits', '00:04:00'),
		(6, 'Lagu 26', 'Hits', '00:04:20'),
		(6, 'Lagu 27', 'Non Hits', '00:03:15'),
		(6, 'Lagu 28', 'Hits', '00:03:50'),
		(6, 'Lagu 29', 'Hits', '00:03:40'),
		(6, 'Lagu 30', 'Non Hits', '00:03:25');

-- melihat data lagu
SELECT * FROM tb_lagu;
-- ===== END TABEL LAGU =====

-- =+=+= JAWAB SOAL =+=+=
-- 1.) Nama nama lagu yang hits tahun 2000 sampai 2010
SELECT A.nama_lagu
	FROM tb_lagu AS A
		INNER JOIN tb_album AS B ON A.id_album = B.id_album
		WHERE B.rilis BETWEEN '2000-1-1' AND '2011-1-1'
		AND A.status_data = 'Aktif';

-- 2.) Nama nama vokalis yang lahir di jakarta
SELECT nama_artis
	FROM tb_artis AS A
		INNER JOIN tb_detail_artis AS B ON A.id_artis = B.id_artis
		WHERE B.tempat_lahir = 'Jakarta'
		AND A.status_data = 'Aktif';

-- 3.) Banyak jumlah instrumen yang tersedia pada pada tabel detail artis
SELECT COUNT(DISTINCT instrument) AS jumlah_instrumen
	FROM tb_detail_artis
		WHERE tb_detail_artis.status_data = 'Aktif';

-- 4.) Durasi lagu dari album "Mestakung" dan "SKA Phobia"
SELECT B.nama_album, SUM(TIME_TO_SEC(A.durasi)) AS total_durasi
	FROM tb_lagu AS A
		INNER JOIN tb_album AS B ON A.id_album = B.id_album
		WHERE B.nama_album IN ('Mestakung', 'SKA Phobia')
		AND A.status_data = 'Aktif'
		GROUP BY B.nama_album;

-- 5.) Jumlah lagu hits yang dibuat oleh Tipe-X
SELECT COUNT(*) AS jumlah_lagu_hits
	FROM tb_lagu AS A
		INNER JOIN tb_album AS B ON A.id_album = B.id_album
		INNER JOIN tb_artis AS C ON B.id_artis = C.id_artis
		WHERE C.nama_artis = 'Tipe-X'
		AND A.status_data = 'Aktif';

-- 6.) Banyaknya lagu yang direkam oleh "Aquarius Musikindo"
SELECT COUNT(*) as jumlah_lagu_aquarius
	FROM tb_lagu AS A
		INNER JOIN tb_album AS B ON A.id_album = B.id_album
		INNER JOIN tb_rekaman AS C ON B.id_rekaman = C.id_rekaman
		WHERE C.nama_rekaman = 'Aquarius Musikindo';

-- 7.) Nama vokalis yang memiliki aliran musik reggae
SELECT A.nama_asli
	FROM tb_detail_artis AS A
		INNER JOIN tb_artis AS B ON A.id_artis = B.id_artis
		WHERE A.instrument = 'Reggae';