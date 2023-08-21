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
-- Menambahkan data
INSERT INTO tb_rekaman (id_rekaman, nama_rekaman, created_at, status_data)
	VALUES
		(1, 'Alfa Records', NOW(), 'Aktif'),
		(2, 'Aquarius Musikindo', NOW(), 'Aktif'),
		(3, 'Bahaya Records', NOW(), 'Aktif'),
		(4, 'Musica Studio', NOW(), 'Aktif'),
		(5, 'Nagaswara', NOW(), 'Aktif'),
		(6, 'Slank Records', NOW(), 'Aktif'),
		(7, 'Sony BMG Indonesia', NOW(), 'Aktif'),
		(8, 'Sony Music Indonesia', NOW(), 'Aktif'),
		(9, 'Trinity Optima Production', NOW(), 'Aktif'),
		(10, 'Indie Label', NOW(), 'Aktif');
		
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
-- Menambahkan data
INSERT INTO tb_artis (id_artis, nama_artis, keterangan, created_at, status_data)
	VALUES
		(1, 'Tipe-X', 'Grup Musik', NOW(), 'Aktif'),
		(2, 'Souljah', 'Grup Musik', NOW(), 'Aktif'),
		(3, 'Tony Q Rastafara', 'Penyanyi Solo', NOW(), 'Aktif'),
		(4, 'Taylor Swift', 'Penyanyi Solo', NOW(), 'Aktif'),
		(5, 'Avril Lavigne', 'Penyanyi Solo', NOW(), 'Aktif'),
		(6, 'Gigi', 'Grup Musik', NOW(), 'Aktif');

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
-- Menambahkan data
INSERT INTO
	tb_detail_artis (id_detail_artis, id_artis, nama_asli, tempat_lahir, tanggal_lahir, instrument, created_at, status_data)
		VALUES
			-- tipe x
			(1, 1, 'Tresno Riandi', 'Jakarta', '1975-09-28', 'Vocal', NOW(), 'Aktif'),
			(2, 1, 'Billy', 'Jakarta', '1977-10-19', 'Gitar', NOW(), 'Aktif'),
			(3, 1, 'Micky', 'Jakarta', '1977-09-11', 'Bass', NOW(), 'Aktif'),
			(4, 1, 'Anto', 'Jakarta', '1980-05-01', 'Trombone', NOW(), 'Aktif'),
			(5, 1, 'Yoss', 'Jakarta', '1975-10-05', 'Gitar', NOW(), 'Aktif'),
			(6, 1, 'Arie Hardjo', 'Jakarta', '1975-10-05', 'Drum', NOW(), 'Aktif'),
			
			-- Souljah
			(7, 2, 'Danar Pramesti', '', '', 'Vocal', NOW(), 'Aktif'),
			(8, 2, 'Said Fauzan', '', '', 'Vocal', NOW(), 'Aktif'),
			(9, 2, 'Benjamin Renhat Pantro Silitonga', '', '', 'Bass', NOW(), 'Aktif'),
			(10, 2, 'David Agust Pasaribu', '', '', 'Keyboard', NOW(), 'Aktif'),
		
			-- Tony Q Rastafara
			(11, 3, 'Tony Waluyo Sukmoasih', 'Semarang', '1961-04-27', 'Vocal', NOW(), 'Aktif'),
			
			-- Taylor Swift
			(12, 4, 'Taylor Alison Swift', 'Pennsylvania', '1989-12-13', 'Vocal', NOW(), 'Aktif'),
			
			-- Avril Lavigne
			(13, 5, 'Avril Ramona Lavigne', 'Belleville', '1984-09-27', 'Vocal', NOW(), 'Aktif'),
			
			-- Gigi
			(14, 6, 'Tubagus Armand Maulana', 'Bandung', '1971-04-04', 'Vocal', NOW(), 'Aktif'),
			(15, 6, 'I Dewa Gede Budjana', 'Sumba Barat', '1963-01-15', 'Gitar', NOW(), 'Aktif'),
			(16, 6, 'Thomas Ramdhan', 'Bandung', '1967-03-05', 'Bass', NOW(), 'Aktif'),
			(17, 6, 'Gusti Erhandy Rakhmatullah', 'Banjarmasin', '1980-03-10', 'Drum', NOW(), 'Aktif');
			

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
-- Menambahkan data
INSERT INTO tb_genre (id_genre, nama_genre, created_at, status_data)
	VALUES
		(1, 'SKA', NOW(), 'Aktif'),
		(2, 'Rocksteady', NOW(), 'Aktif'),
		(3, 'Reggae', NOW(), 'Aktif'),
		(4, 'POP', NOW(), 'Aktif'),
		(5, 'Jazz', NOW(), 'Aktif'),
		(6, 'Blues', NOW(), 'Aktif'),
		(7, 'Country', NOW(), 'Aktif'),
		(8, 'Punk', NOW(), 'Aktif'),
		(9, 'Rock', NOW(), 'Aktif'),
		(10, 'Metal', NOW(), 'Aktif'),
		(11, 'Electronic Music Dance', NOW(), 'Aktif');

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
-- Menambahkan data
INSERT INTO tb_album (id_album, id_artis, id_rekaman, id_genre, nama_album, rilis, created_at, status_data)
	VALUES
		(1,1,2,1,'SKA Phobia','1999',NOW(),'Aktif'),
		(2,2,3,3,'Breaking The Roots','2005',NOW(),'Aktif'),
		(3,2,3,3,'Bersamamu','2007',NOW(),'Aktif'),
		(4,2,3,3,'Mestakung','2009',NOW(),'Aktif'),
		(5,2,3,3,'This Is Souljah','2014',NOW(),'Aktif'),
		(6,3,10,3,'Presiden','2009',NOW(),'Aktif');
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
-- Menambahkan data
INSERT INTO tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, created_at, status_data)
	VALUES
		(1, 1, 'Angan', '00:03:17', 'Hits', NOW(), 'Aktif'),
		(2, 1, 'Frustasi', '00:04:51', '', NOW(), 'Aktif'),
		(3, 1, 'Genit', '00:04:11', 'Hits', NOW(), 'Aktif'),
		(4, 1, 'E.P.', '00:03:11', '', NOW(), 'Aktif'),
		(5, 1, 'My World', '00:02:15', '', NOW(), 'Aktif'),
		(6, 1, 'Bebas Pusing', '00:02:40', '', NOW(), 'Aktif'),
		(7, 1, 'Bernyanyi', '00:02:55', '', NOW(), 'Aktif'),
		(8, 1, 'Stress', '00:03:09', '', NOW(), 'Aktif'),
		(9, 1, 'I.C.U', '00:04:42', '', NOW(), 'Aktif'),
		(10, 1, 'Song From Distance', '00:02:57', '', NOW(), 'Aktif');
		
-- Lagu Souljah - Breaking The Roots
INSERT INTO tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, created_at, status_data)
	VALUES
		(11, 2, 'Listen to Do Islan', '00:03:35', '', NOW(), 'Aktif'),
		(12, 2, 'Magenta Feat Happy Salma', '00:03:46', '', NOW(), 'Aktif'),
		(13, 2, 'Mati Menahan Rindu', '00:03:28', '', NOW(), 'Aktif'),
		(14, 2, 'Jamaica Away Feat Hendrix R', '00:04:42', 'Hits', NOW(), 'Aktif'),
		(15, 2, 'All The People In The World', '00:04:56', '', NOW(), 'Aktif'),
		(16, 2, 'Lelaku Itu Feat Sundari Sukotjo', '00:04:18', 'Hits', NOW(), 'Aktif'),
		(17, 2, 'Stripper', '00:02:57', '', NOW(), 'Aktif'),
		(18, 2, 'On The Radio', '00:03:01', '', NOW(), 'Aktif'),
		(19, 2, 'All I Know', '00:04:30', '', NOW(), 'Aktif'),
		(20, 2, 'The Day The World Turns Into Grey Feat Bad Mono', '00:04:02', '', NOW(), 'Aktif'),
		(21, 2, 'The Nation', '00:03:36', '', NOW(), 'Aktif'),
		(22, 2, 'Mahalo Feat Popok', '00:03:14', '', NOW(), 'Aktif');

-- Lagu Souljah - Bersamamu
INSERT INTO tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, created_at, status_data)
	VALUES
		(23, 3, 'I am Free', '00:03:44', 'Hits', NOW(), 'Aktif'),
		(24, 3, 'I Love Myself', '00:03:24', '', NOW(), 'Aktif'),
		(25, 3, 'Devilish Angel', '00:03:50', '', NOW(), 'Aktif'),
		(26, 3, 'Berdansa Sepanjang Malam', '00:03:49', '', NOW(), 'Aktif'),
		(27, 3, 'In a Fiya', '00:03:47', '', NOW(), 'Aktif'),
		(28, 3, 'Patah Hati', '00:03:08', '', NOW(), 'Aktif'),
		(29, 3, 'Kuingin Kau Mati Saja', '00:03:31', 'Hits', NOW(), 'Aktif'),
		(30, 3, 'War is Over', '00:03:20', '', NOW(), 'Aktif'),
		(31, 3, 'Elo Gak Penting', '00:03:47', '', NOW(), 'Aktif'),
		(32, 3, 'My Heart Said Yeah', '00:03:52', '', NOW(), 'Aktif'),
		(33, 3, 'Cintailah Aku', '00:03:45', '', NOW(), 'Aktif'),
		(34, 3, 'Bersamamu', '00:03:58', 'Hits', NOW(), 'Aktif');
		
-- Lagu Souljah - Mestakung
INSERT INTO tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, created_at, status_data)
	VALUES
		(35, 4, 'Loving Hand', '00:03:26', '', NOW(), 'Aktif'),
		(36, 4, 'Tak Selalu', '00:03:46', 'Hits', NOW(), 'Aktif'),
		(37, 4, 'Please', '00:04:20', '', NOW(), 'Aktif'),
		(38, 4, 'Jangan Berhenti', '00:03:15', '', NOW(), 'Aktif'),
		(39, 4, 'Jagoanku', '00:03:55', '', NOW(), 'Aktif'),
		(40, 4, 'Sesaat Denganmu', '00:04:23', '', NOW(), 'Aktif'),
		(41, 4, 'Hanya Ingin Pulang', '00:04:23', '', NOW(), 'Aktif'),
		(42, 4, 'Bagaimana Caranya', '00:03:36', '', NOW(), 'Aktif'),
		(43, 4, 'Wo Ow', '00:03:08', '', NOW(), 'Aktif'),
		(44, 4, 'Mars Jangkrik', '00:03:28', '', NOW(), 'Aktif'),
		(45, 4, 'Abidin', '00:03:34', '', NOW(), 'Aktif'),
		(46, 4, 'Sudah Sudahlah', '00:04:08', '', NOW(), 'Aktif');

-- Lagu Souljah - This Is Souljah
INSERT INTO tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, created_at, status_data)
	VALUES
		(47, 5, 'Move On', '00:04:41', 'Hits', NOW(), 'Aktif'),
		(48, 5, 'Bilang I Love You', '00:03:57', 'Hits', NOW(), 'Aktif'),
		(49, 5, 'Jatah Mantan', '00:03:31', '', NOW(), 'Aktif'),
		(50, 5, 'Sorry', '00:04:07', '', NOW(), 'Aktif'),
		(51, 5, 'Terlanjur Cinta', '00:03:56', '', NOW(), 'Aktif'),
		(52, 5, 'Kencan Resmi', '00:03:35', 'Hits', NOW(), 'Aktif'),
		(53, 5, 'Michael', '00:03:51', '', NOW(), 'Aktif'),
		(54, 5, 'Satu Frekuensi', '00:03:58', '', NOW(), 'Aktif'),
		(55, 5, 'PHP', '00:03:22', '', NOW(), 'Aktif'),
		(56, 5, 'Say You Love Me', '00:04:18', 'Hits', NOW(), 'Aktif'),
		(57, 5, 'Cuma Kamu', '00:04:34', '', NOW(), 'Aktif'),
		(58, 5, 'Winter Heart', '00:03:16', 'Hits', NOW(), 'Aktif'),
		(59, 5, 'Jangan Sedih Lagi', '00:03:36', 'Hits', NOW(), 'Aktif'),
		(60, 5, 'Bisakah', '00:02:52', 'Hits', NOW(), 'Aktif'),
		(61, 5, 'Terbuai Asmara', '00:03:51', '', NOW(), 'Aktif'),
		(62, 5, 'Mars Braddasouljah', '00:03:30', '', NOW(), 'Aktif'),
		(63, 5, 'I Will Be Home', '00:02:58', '', NOW(), 'Aktif');

-- Lagu Tony Q Rastafara - Presiden
INSERT INTO tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, created_at, status_data)
	VALUES
		(64, 6, 'Republik Sulap', '00:03:15', 'Hits', NOW(), 'Aktif'),
		(65, 6, 'Lop Song', '00:03:15', '', NOW(), 'Aktif'),
		(66, 6, 'Bla Bla Bla', '00:02:50', '', NOW(), 'Aktif'),
		(67, 6, 'Politik', '00:04:01', '', NOW(), 'Aktif'),
		(68, 6, 'Krisis Kepercayaan', '00:03:06', '', NOW(), 'Aktif'),
		(69, 6, 'Wake Up', '00:02:33', '', NOW(), 'Aktif'),
		(70, 6, 'Manteman', '00:03:08', 'Hits', NOW(), 'Aktif'),
		(71, 6, 'Matahariku', '00:02:49', '', NOW(), 'Aktif'),
		(72, 6, 'Presiden', '00:03:53', 'Hits', NOW(), 'Aktif'),
		(73, 6, 'Jangan Ambil Cintaku', '00:03:08', '', NOW(), 'Aktif');
		
		
-- melihat data lagu
SELECT * FROM tb_lagu;
-- ===== END TABEL LAGU =====