-- Membuat database musik
create database db_musik;

-- Menggunakan database musuk
use db_musik;

-- ============================================================================
-- membuat tabel tb_rekaman
create table tb_rekaman(
	id_rekaman char(5) not null primary key,
	nama_rekaman varchar(255) not null,
	dibuat datetime null, -- data tanggal (YYYY-mm-dd) dan waktu (HH:mm:ss)
	diubah datetime null,
	status_data varchar(255) null
);

-- menghapus tabel tb_rekaman
-- drop table tb_rekaman;

-- memasukan data rekaman
-- truncate table tb_rekaman;
insert into tb_rekaman (id_rekaman, nama_rekaman, dibuat, status_data)
	values
		('RK-1', 'Alfa Records', now(), 'Aktif'),
		('RK-2', 'Aquarius Musikindo', now(), 'Aktif'),
		('RK-3', 'Bahaya Records', now(), 'Aktif'),
		('RK-4', 'Musica Studio', now(), 'Aktif'),
		('RK-5', 'Nagaswara', now(), 'Aktif'),
		('RK-6', 'Slank Records', now(), 'Aktif'),
		('RK-7', 'Sony BMG Indonesia', now(), 'Aktif'),
		('RK-8', 'Sony Music Indonesia', now(), 'Aktif'),
		('RK-9', 'Trinity Optima Production', now(), 'Aktif'),
		('RK-10', 'Indie Label', now(), 'Aktif');

-- melihat data rekaman
select * from tb_rekaman;
-- ============================================================================

-- membuat tabel artis
-- drop table tb_artis;
create table tb_artis(
	id_artis char(5) not null primary key,
	nama_artis varchar(255) not null,
	keterangan varchar(255) not null,
	dibuat datetime null,
	diubah datetime null,
	status_data varchar(255) null
);

-- menghapus tabel tb_artis
-- drop table tb_artis;

-- memasukan data artis
-- truncate table tb_artis;
insert into tb_artis (id_artis, nama_artis, keterangan, dibuat, status_data)
	values
		('AR-1', 'Tipe-X', 'Grup Musik', now(), 'Aktif'),
		('AR-2', 'Souljah', 'Grup Musik', now(), 'Aktif'),
		('AR-3', 'Tony Q Rastafara', 'Penyanyi Solo', now(), 'Aktif'),
		('AR-4', 'Taylor Swift', 'Penyanyi Solo', now(), 'Aktif'),
		('AR-5', 'Avril Lavigne', 'Penyanyi Solo', now(), 'Aktif'),
		('AR-6', 'Gigi', 'Grup Musik', now(), 'Aktif');

-- melihat data artis
select * from tb_artis;
-- ============================================================================

-- membuat table detail artis
create table tb_detail_artis(
	id_detail_artis char(5) not null primary key,
	id_artis char(5) not null,
	nama_asli varchar(255) not null,
	tempat_lahir varchar(255) not null,
	tanggal_lahir varchar(255) not null,
	instrument varchar(255) not null,
	dibuat datetime null,
	diubah datetime null,
	status_data varchar(255) null
);

-- memasukan data detail artis
-- truncate table tb_detail_artis;
insert into
	tb_detail_artis (id_detail_artis, id_artis, nama_asli, tempat_lahir, tanggal_lahir, instrument, dibuat, status_data)
		values
			-- tipe x
			('DA-1', 'AR-1', 'Tresno Riandi', 'Jakarta', '1975-09-28', 'Vocal', now(), 'Aktif'),
			('DA-2', 'AR-1', 'Billy', 'Jakarta', '1977-10-19', 'Gitar', now(), 'Aktif'),
			('DA-3', 'AR-1', 'Micky', 'Jakarta', '1977-09-11', 'Bass', now(), 'Aktif'),
			('DA-4', 'AR-1', 'Anto', 'Jakarta', '1980-05-01', 'Trombone', now(), 'Aktif'),
			('DA-5', 'AR-1', 'Yoss', 'Jakarta', '1975-10-05', 'Gitar', now(), 'Aktif'),
			('DA-6', 'AR-1', 'Arie Hardjo', 'Jakarta', '1975-10-05', 'Drum', now(), 'Aktif'),
			
			-- Souljah
			('DA-7', 'AR-2', 'Danar Pramesti', '', '', 'Vocal', now(), 'Aktif'),
			('DA-8', 'AR-2', 'Said Fauzan', '', '', 'Vocal', now(), 'Aktif'),
			('DA-9', 'AR-2', 'Benjamin Renhat Pantro Silitonga', '', '', 'Bass', now(), 'Aktif'),
			('DA-10', 'AR-2', 'David Agust Pasaribu', '', '', 'Keyboard', now(), 'Aktif'),
		
			-- Tony Q Rastafara
			('DA-11', 'AR-3', 'Tony Waluyo Sukmoasih', 'Semarang', '1961-04-27', 'Vocal', now(), 'Aktif'),
			
			-- Taylor Swift
			('DA-12', 'AR-4', 'Taylor Alison Swift', 'Pennsylvania', '1989-12-13', 'Vocal', now(), 'Aktif'),
			
			-- Avril Lavigne
			('DA-13', 'AR-5', 'Avril Ramona Lavigne', 'Belleville', '1984-09-27', 'Vocal', now(), 'Aktif'),
			
			-- Gigi
			('DA-14', 'AR-6', 'Tubagus Armand Maulana', 'Bandung', '1971-04-04', 'Vocal', now(), 'Aktif'),
			('DA-15', 'AR-6', 'I Dewa Gede Budjana', 'Sumba Barat', '1963-01-15', 'Gitar', now(), 'Aktif'),
			('DA-16', 'AR-6', 'Thomas Ramdhan', 'Bandung', '1967-03-05', 'Bass', now(), 'Aktif'),
			('DA-17', 'AR-6', 'Gusti Erhandy Rakhmatullah', 'Banjarmasin', '1980-03-10', 'Drum', now(), 'Aktif');
			

-- melihat data detail artis
select * from tb_detail_artis order by id_artis asc;
-- ============================================================================

-- membuat tabel genre
create table tb_genre(
	id_genre char(5) not null primary key,
	nama_genre varchar(255) not null,
	dibuat datetime null,
	diubah datetime null,
	status_data varchar(255) null
);

-- menghapus tabel tb_genre
-- drop table tb_genre;

-- memasukan data genre
-- truncate table tb_genre;
insert into tb_genre (id_genre, nama_genre, dibuat, status_data)
	values
		('GN-1', 'SKA', now(), 'Aktif'),
		('GN-2', 'Rocksteady', now(), 'Aktif'),
		('GN-3', 'Reggae', now(), 'Aktif'),
		('GN-4', 'POP', now(), 'Aktif'),
		('GN-5', 'Jazz', now(), 'Aktif'),
		('GN-6', 'Blues', now(), 'Aktif'),
		('GN-7', 'Country', now(), 'Aktif'),
		('GN-8', 'Punk', now(), 'Aktif'),
		('GN-9', 'Rock', now(), 'Aktif'),
		('GN-10', 'Metal', now(), 'Aktif'),
		('GN-11', 'Electronic Music Dance', now(), 'Aktif');

-- melihat data genre
select * from tb_genre order by id_genre;
-- ============================================================================


-- membuat tabel album
-- drop table tb_album;
create table tb_album(
	id_album char(5) not null primary key,
	id_artis char(5) not null,
	id_rekaman char(5) not null,
	id_genre char(5) not null,
	nama_album varchar(255) not null,
	rilis year not null, -- default format time YYYY:mm:dd
	dibuat datetime null,
	diubah datetime null,
	status_data varchar(255) null
);

-- menghapus tabel tb_album
-- drop table tb_album;

-- memasukan data album
-- truncate table tb_album;
insert into tb_album (id_album, id_artis, id_rekaman, id_genre, nama_album, rilis, dibuat, status_data)
	values
		('AL-1','AR-1','RK-2','GN-1','SKA Phobia','1999',now(),'Aktif'),
		('AL-2','AR-2','RK-3','GN-3','Breaking The Roots','2005',now(),'Aktif'),
		('AL-3','AR-2','RK-3','GN-3','Bersamamu','2007',now(),'Aktif'),
		('AL-4','AR-2','RK-3','GN-3','Mestakung','2009',now(),'Aktif'),
		('AL-5','AR-2','RK-3','GN-3','This Is Souljah','2014',now(),'Aktif'),
		('AL-6','AR-3','RK-10','GN-3','Presiden','2009',now(),'Aktif');

-- melihat data album
select * from tb_album;
-- ============================================================================

-- membuat tabel lagu
-- drop table tb_lagu;
create table tb_lagu(
	id_lagu char(5) not null primary key,
	id_album char(5) not null,
	nama_lagu varchar(255) not null,
	keterangan varchar(255) not null,
	durasi time not null, -- default format time HH:mm:ss
	dibuat datetime null,
	diubah datetime null,
	status_data varchar(255) null
);

-- menghapus tabel tb_lagu
-- drop table tb_lagu;

-- memasukan data lagu
-- Lagu TipeX - Ska Phobia
insert into tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, dibuat, status_data)
	values
		('LG-1', 'AL-1', 'Angan', '00:03:17', 'Hits', now(), 'Aktif'),
		('LG-2', 'AL-1', 'Frustasi', '00:04:51', '', now(), 'Aktif'),
		('LG-3', 'AL-1', 'Genit', '00:04:11', 'Hits', now(), 'Aktif'),
		('LG-4', 'AL-1', 'E.P.', '00:03:11', '', now(), 'Aktif'),
		('LG-5', 'AL-1', 'My World', '00:02:15', '', now(), 'Aktif'),
		('LG-6', 'AL-1', 'Bebas Pusing', '00:02:40', '', now(), 'Aktif'),
		('LG-7', 'AL-1', 'Bernyanyi', '00:02:55', '', now(), 'Aktif'),
		('LG-8', 'AL-1', 'Stress', '00:03:09', '', now(), 'Aktif'),
		('LG-9', 'AL-1', 'I.C.U', '00:04:42', '', now(), 'Aktif'),
		('LG-10', 'AL-1', 'Song From Distance', '00:02:57', '', now(), 'Aktif');
		
-- Lagu Souljah - Breaking The Roots
insert into tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, dibuat, status_data)
	values
		('LG-11', 'AL-2', 'Listen to Do Islan', '00:03:35', '', now(), 'Aktif'),
		('LG-12', 'AL-2', 'Magenta Feat Happy Salma', '00:03:46', '', now(), 'Aktif'),
		('LG-13', 'AL-2', 'Mati Menahan Rindu', '00:03:28', '', now(), 'Aktif'),
		('LG-14', 'AL-2', 'Jamaica Away Feat Hendrix R', '00:04:42', 'Hits', now(), 'Aktif'),
		('LG-15', 'AL-2', 'All The People In The World', '00:04:56', '', now(), 'Aktif'),
		('LG-16', 'AL-2', 'Lelaku Itu Feat Sundari Sukotjo', '00:04:18', 'Hits', now(), 'Aktif'),
		('LG-17', 'AL-2', 'Stripper', '00:02:57', '', now(), 'Aktif'),
		('LG-18', 'AL-2', 'On The Radio', '00:03:01', '', now(), 'Aktif'),
		('LG-19', 'AL-2', 'All I Know', '00:04:30', '', now(), 'Aktif'),
		('LG-20', 'AL-2', 'The Day The World Turns Into Grey Feat Bad Mono', '00:04:02', '', now(), 'Aktif'),
		('LG-21', 'AL-2', 'The Nation', '00:03:36', '', now(), 'Aktif'),
		('LG-22', 'AL-2', 'Mahalo Feat Popok', '00:03:14', '', now(), 'Aktif');

-- Lagu Souljah - Bersamamu
insert into tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, dibuat, status_data)
	values
		('LG-23', 'AL-3', 'I am Free', '00:03:44', 'Hits', now(), 'Aktif'),
		('LG-24', 'AL-3', 'I Love Myself', '00:03:24', '', now(), 'Aktif'),
		('LG-25', 'AL-3', 'Devilish Angel', '00:03:50', '', now(), 'Aktif'),
		('LG-26', 'AL-3', 'Berdansa Sepanjang Malam', '00:03:49', '', now(), 'Aktif'),
		('LG-27', 'AL-3', 'In a Fiya', '00:03:47', '', now(), 'Aktif'),
		('LG-28', 'AL-3', 'Patah Hati', '00:03:08', '', now(), 'Aktif'),
		('LG-29', 'AL-3', 'Kuingin Kau Mati Saja', '00:03:31', 'Hits', now(), 'Aktif'),
		('LG-30', 'AL-3', 'War is Over', '00:03:20', '', now(), 'Aktif'),
		('LG-31', 'AL-3', 'Elo Gak Penting', '00:03:47', '', now(), 'Aktif'),
		('LG-32', 'AL-3', 'My Heart Said Yeah', '00:03:52', '', now(), 'Aktif'),
		('LG-33', 'AL-3', 'Cintailah Aku', '00:03:45', '', now(), 'Aktif'),
		('LG-34', 'AL-3', 'Bersamamu', '00:03:58', 'Hits', now(), 'Aktif');
		
-- Lagu Souljah - Mestakung
insert into tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, dibuat, status_data)
	values
		('LG-35', 'AL-4', 'Loving Hand', '00:03:26', '', now(), 'Aktif'),
		('LG-36', 'AL-4', 'Tak Selalu', '00:03:46', 'Hits', now(), 'Aktif'),
		('LG-37', 'AL-4', 'Please', '00:04:20', '', now(), 'Aktif'),
		('LG-38', 'AL-4', 'Jangan Berhenti', '00:03:15', '', now(), 'Aktif'),
		('LG-39', 'AL-4', 'Jagoanku', '00:03:55', '', now(), 'Aktif'),
		('LG-40', 'AL-4', 'Sesaat Denganmu', '00:04:23', '', now(), 'Aktif'),
		('LG-41', 'AL-4', 'Hanya Ingin Pulang', '00:04:23', '', now(), 'Aktif'),
		('LG-42', 'AL-4', 'Bagaimana Caranya', '00:03:36', '', now(), 'Aktif'),
		('LG-43', 'AL-4', 'Wo Ow', '00:03:08', '', now(), 'Aktif'),
		('LG-44', 'AL-4', 'Mars Jangkrik', '00:03:28', '', now(), 'Aktif'),
		('LG-45', 'AL-4', 'Abidin', '00:03:34', '', now(), 'Aktif'),
		('LG-46', 'AL-4', 'Sudah Sudahlah', '00:04:08', '', now(), 'Aktif');

-- Lagu Souljah - This Is Souljah
insert into tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, dibuat, status_data)
	values
		('LG-47', 'AL-5', 'Move On', '00:04:41', 'Hits', now(), 'Aktif'),
		('LG-48', 'AL-5', 'Bilang I Love You', '00:03:57', 'Hits', now(), 'Aktif'),
		('LG-49', 'AL-5', 'Jatah Mantan', '00:03:31', '', now(), 'Aktif'),
		('LG-50', 'AL-5', 'Sorry', '00:04:07', '', now(), 'Aktif'),
		('LG-51', 'AL-5', 'Terlanjur Cinta', '00:03:56', '', now(), 'Aktif'),
		('LG-52', 'AL-5', 'Kencan Resmi', '00:03:35', 'Hits', now(), 'Aktif'),
		('LG-53', 'AL-5', 'Michael', '00:03:51', '', now(), 'Aktif'),
		('LG-54', 'AL-5', 'Satu Frekuensi', '00:03:58', '', now(), 'Aktif'),
		('LG-55', 'AL-5', 'PHP', '00:03:22', '', now(), 'Aktif'),
		('LG-56', 'AL-5', 'Say You Love Me', '00:04:18', 'Hits', now(), 'Aktif'),
		('LG-57', 'AL-5', 'Cuma Kamu', '00:04:34', '', now(), 'Aktif'),
		('LG-58', 'AL-5', 'Winter Heart', '00:03:16', 'Hits', now(), 'Aktif'),
		('LG-59', 'AL-5', 'Jangan Sedih Lagi', '00:03:36', 'Hits', now(), 'Aktif'),
		('LG-60', 'AL-5', 'Bisakah', '00:02:52', 'Hits', now(), 'Aktif'),
		('LG-61', 'AL-5', 'Terbuai Asmara', '00:03:51', '', now(), 'Aktif'),
		('LG-62', 'AL-5', 'Mars Braddasouljah', '00:03:30', '', now(), 'Aktif'),
		('LG-63', 'AL-5', 'I Will Be Home', '00:02:58', '', now(), 'Aktif');

-- Lagu Tony Q Rastafara - Presiden
insert into tb_lagu (id_lagu, id_album, nama_lagu, durasi, keterangan, dibuat, status_data)
	values
		('LG-64', 'AL-6', 'Republik Sulap', '00:03:15', 'Hits', now(), 'Aktif'),
		('LG-65', 'AL-6', 'Lop Song', '00:03:15', '', now(), 'Aktif'),
		('LG-66', 'AL-6', 'Bla Bla Bla', '00:02:50', '', now(), 'Aktif'),
		('LG-67', 'AL-6', 'Politik', '00:04:01', '', now(), 'Aktif'),
		('LG-68', 'AL-6', 'Krisis Kepercayaan', '00:03:06', '', now(), 'Aktif'),
		('LG-69', 'AL-6', 'Wake Up', '00:02:33', '', now(), 'Aktif'),
		('LG-70', 'AL-6', 'Manteman', '00:03:08', 'Hits', now(), 'Aktif'),
		('LG-71', 'AL-6', 'Matahariku', '00:02:49', '', now(), 'Aktif'),
		('LG-72', 'AL-6', 'Presiden', '00:03:53', 'Hits', now(), 'Aktif'),
		('LG-73', 'AL-6', 'Jangan Ambil Cintaku', '00:03:08', '', now(), 'Aktif');
		
		
-- melihat data lagu
select * from tb_lagu order by nama_lagu asc;
-- ============================================================================
