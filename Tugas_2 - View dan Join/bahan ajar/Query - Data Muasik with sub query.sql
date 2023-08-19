-- melihat data dari semua tabel
select * from tb_artis;
select * from tb_detail_artis;
select * from tb_rekaman;
select * from tb_genre;
select * from tb_album;
select * from tb_lagu;

-- LATIHAN SOAL
-- 1. Sebutkan nama-nama lagu yg hits kemudian rilis diantara tahun 2000-2010
-- 2. Sebutkan nama-nama vokalis yang lahir di Jakarta
-- 3. Berapa banyak jumlah instrumen yang tersedia pada pada tabel detail artis (Query Distinct)
-- 4. Berapa lama durasi lagu dari album Mestakung dan SKA Phobia
-- 5. Berapa banyak jumlah lagu hits yang dibuat oleh Tipe-X
-- 6. Berapa jumlah lagu yg direkam oleh Aquarius Musikindo
-- 7. Sebutkan nama vocalis yang memiliki aliran musik reggae
SELECT * FROM tb_detail_artis WHERE instrument='Vocal' AND Tempat_lahir='Jakarta'

SELECT COUNT(id_detail_artis) AS Jumlah, instrument
	FROM tb_detail_artis group by instrument 

-- Sebutkan nama-nama rekaman kemudian uruntkan secara ascending
-- menggunakan ORDER BY
SELECT nama_rekaman FROM tb_rekaman
	ORDER BY nama_rekaman ASC;

-- Sebutkan nama-nama album yang rilis diantara tahun 2000  sampai tahun 2010
-- menggunakan klausa where
SELECT nama_album, rilis FROM tb_album
	WHERE rilis >= 2000 AND rilis <= 2010;                                              

-- menggunakan operator
SELECT nama_album, rilis FROM tb_album
	WHERE rilis BETWEEN 2000 AND 2010;
	
-- Sebutkan nama-nama artis yang memiliki umur lebih dari 50 tahun
-- fungsi TIMESTAMPDIFF(format tanggal, kolom1, kolom2)
-- kolom 1 akan dikurangi kolom 2
SELECT * FROM tb_detail_artis;
SELECT * FROM
	(
		SELECT nama_asli, TIMESTAMPDIFF(YEAR, tanggal_lahir, NOW()) AS umur
			FROM tb_detail_artis
	) AS inner_tabel
	WHERE umur >=50;

-- Sebutkan data artis secara detail yang memiliki awalan nama taylor atau Avril
-- Menggunakan operator LIKE dan OR
SELECT nama_asli, tempat_lahir, tanggal_lahir, instrument
	FROM tb_detail_artis
		WHERE nama_asli LIKE 'Taylor%' OR nama_asli LIKE 'Avril%';
		
		
-- Sebutkan lagu-lagu yang hits namun direkam secara indie label
-- Membuat View 
CREATE VIEW view_2 AS
	SELECT nama_lagu, nama_rekaman, keterangan
		FROM tb_lagu A, tb_album B, tb_rekaman C
			WHERE
				A.id_album = B.id_album AND
				A.keterangan = 'Hits' AND
				B.id_rekaman = C.id_rekaman AND
				C.nama_rekaman='Indie Label';

-- Menampilkan view
SELECT * FROM view_2;

-- membuat join
SELECT B.nama_lagu, C.nama_rekaman, B.keterangan
		FROM tb_album A
			INNER JOIN tb_lagu B ON B.id_album = A.id_album
			INNER JOIN tb_rekaman C ON C.id_rekaman = A.id_rekaman
				WHERE B.keterangan='Hits' AND C.nama_rekaman='Indie Label';


-- Sebutkan nama-nama album yg dibuat oleh Souljah
-- # Membuat View
CREATE VIEW view_1 AS
	SELECT A.nama_artis, B.nama_album, B.rilis
		FROM tb_artis as A, tb_album AS B
			WHERE A.nama_artis = 'Souljah' AND A.id_artis = B.id_artis;

-- # Menampilkan View
SELECT * FROM view_1;

-- # Membuat dan Menampilkan JOIN
SELECT A.nama_artis, B.nama_album, B.rilis
	FROM tb_artis A
		INNER JOIN tb_album B ON B.id_artis = A.id_artis
			WHERE A.nama_artis = 'Souljah';


-- Berapa jumlah grup musik dan penyanyi solo
-- menggunakan fungsi count dengan klausa grup by
select * from tb_artis;
SELECT COUNT(id_artis) AS jumlah, keterangan
	FROM tb_artis
		GROUP BY keterangan;
		
-- Berapa banyak jumlah lagu hits yang memiliki aliran musik SKA dan/atau Reggae
-- Menggunakan JOIN untuk menggabungkan tabel lagu, album, genre
-- Menggunakan klausa WHERE untuk memberikan kondisi lagu hits dengan aliran SKA/Reggae
-- GROUP BY Berdasarkan nama genre
SELECT COUNT(B.id_lagu) AS jumlah, C.nama_genre
	FROM tb_album A
		INNER JOIN tb_lagu B ON B.id_album = A.id_album
		INNER JOIN tb_genre C ON C.id_genre = A.id_genre
			WHERE B.keterangan='Hits' AND (C.nama_genre='SKA' OR C.nama_genre='Reggae')
				GROUP BY C.nama_genre;
			

