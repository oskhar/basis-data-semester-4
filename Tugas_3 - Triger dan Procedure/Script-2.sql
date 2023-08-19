USE belajar_basisdata

SELECT * FROM penyewa;
SELECT * FROM mobil;
SELECT * FROM peminjaman;
AND
		B.tanggal_pinjam BETWEEN '2023-09-01' AND '2023-09-30';

SELECT A.nama as cara_view, C.nama_mobil, B.tanggal_pinjam, B.tanggal_kembali
	FROM penyewa as A, peminjaman as B, mobil as C
		WHERE A.nik = B.nik AND B.id_mobil = C.id_mobil;
		
SELECT A.nama as cara_join_1, C.nama_mobil, B.tanggal_pinjam, B.tanggal_kembali 
	FROM penyewa as A 
		JOIN peminjaman as B on A.nik = B.nik
		JOIN mobil as C on B.id_mobil = C.id_mobil;
		
SELECT B.nama as cara_join_2, C.nama_mobil, A.tanggal_pinjam, A.tanggal_kembali 
	FROM peminjaman as A
		JOIN penyewa as B on A.nik = B.nik
		JOIN mobil as C on A.id_mobil = C.id_mobil;

SELECT A.nama, C.nama_mobil, B.tanggal_pinjam, B.tanggal_kembali
	FROM penyewa as A, peminjaman as B, mobil as C
		WHERE A.nik = B.nik AND B.id_mobil = C.id_mobil;
	
SELECT COUNT(A.id_mobil) as banyak_mobil, B.nama_mobil FROM peminjaman as A, mobil as B
	WHERE A.id_mobil = B.id_mobil
	GROUP BY A.id_peminjaman, ;
	
