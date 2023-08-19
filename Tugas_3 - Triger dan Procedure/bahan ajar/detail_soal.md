Soal nomor 1. Pemahaman Dasar - Jelaskan perbedaan antara MySQL, MariaDB, SQL Server, DBeaver, HeidiSQL - Jelaskan, apa yg dimaksud tentang Triger dan Procedure - Jelaskan, apa yang dimaksud dengan commit transaction dan rollback transaction - Jelaskan, tentang teknik softdelete pada SQL - Jelaskan tentang teknik casecade pada SQL

Proses bisnis ERD - New Sewa Mobil
1). Setiap entitas tambahkan 4 kolom yaitu dibuat, diubah, dihapus dengan tipe data datetime dan status data dengan tipe data enum (Aktif dan Tidak Aktif)

    2). Entitas pegawai terbagi menjadi yaitu  1 Pemilik dan 3 Pegawai.
    	Pemilik dapat melihat/tambah/ubah/hapus semua entitas yg ada
    	Pegawai dapat melihat semua entitas. Dan hanya bisa tambah/ubah/hapus di entitas penyewa, peminjam, denda

    3). Entitas mobil di isi oleh 15 buah data dengan syarat
    	Terbagi menjadi 2 jenis mobil mobil keluarga ex (Suzuki Ertiga/Nissan Serena/Totoya Avansa/Toyoya Inova/dll) dan mobil sedan ex (Toyota AE 86/ Toyota vios/ Toyota Corola Altis/ dll)
    	Boleh memasukan lebih dari 1 mobil yg sama, ex (Boleh terdapat 2, 3, 4 atau lebih mobil Toyota AE 86, namun yg membedakan nya ada di plat nomor, nomor rangka, nomor mesin)

    4). Entitas Harga berisi 6 buah data, dengan syarat
    	kolom jenis mobil adalah mobil keluarga dan mobil sedan
    	kolom ketegran harga adalah harga weekday, weekend, libur lebaran
    	Ex pengisi data
    		- H1, 500rb, Mobil Keluarga, Weekday
    		- H2, 500rb + 15%, Mobil Keluarga, Weekend
    		- H3, 500rb + 50%, Mobil Keluarga, Libur Lebaran
    		- H4, 400rb, Mobil Sedan, Weekday
    		- H5, 400rb + 15%, Mobil Sedan, Weekend
    		- H6, 400rb + 50%, Mobil Sedan, Libur Lebaran
    	Hanya ada 1 data yg aktif untuk setiap Jenis mobil

    5). Entitas penyewa diiis oleh 10 data, setiap penyewa maks meminjam 2 mobil untuk 1x proses sewa.

    6). Entitas peminjaman berisi N data, dengan syarat
    	Saat menambah data (Proses Sewa), hanya kolom (ID Peminjaman, ID Mobil, ID Pegawai, NIK, Lama Peminjaman, Tgl Pinjam, Uang Muka). Sisa kolom yg ada akan terisi otomatis melalui procedure.
    	Saat merubah data (Proses Pengembalian Mobil), hanya merubah tanggal kembali dari NULL menjadi tanggal pengembalian saat itu.

    7). Entitas denda akan terisi otomatis, apabila terjadi keterlambatan pengembalian mobil.
    	Denda perhari untuk mobil sedan adalah 500rb
    	Denda perhari untuk mobil keluarga adalah 600rb

Soal nomor 2. triger procedure studi kasus (ERD - New Sewa Mobil)

    1). Buatlah trigger dan procedure untuk melakukan log data. ex
    	Apabila pegawai X menambah data penyewa. maka entitas log data secara otomatis bertambah
    		ID Log 1, P001, Pegawai X tambah data penyewa, Berhasil
    	Apabila pegawai X menambahkan data peminjaman, maka entitas log data secara otomatis bertambah
    		ID Log 2, P001, Pegawai X tambah data peminjaman, Berhasil
    	Dan seterus nya.

    2). Buatlah trigger dan procedure untuk melakukan rollback transaction, apabila pegawai menambah data untuk entitas mobil dan harga

    3). Buatlah trigger dan procedure untuk setiap entitas. Apabila suatu entitas di isi data. Maka kolom dibuat terisi tanggal hari ini dan status data aktif

    4). Buatlah trigger dan procedure pada entitas peminjaman untuk melakukan proses sewa mobil berikut
    	- Kondisi 1. Apabila ID Mobil tidak terdapat pada entitas mobil atau mobil tersebut sedang disewa maka dilakukan rollback transaction
    	- Kondisi 2. Apabila ID Pegawai tidak terdapat pada entitas pegawai maka dilakukan rollback transaction
    	- Kondisi 3. Apabila NIK tidak terdapat pada entitas penyewa atau NIK sedang melakukan sewa mobil maka dilakukan rollback transaction
    	- Apabila kondisi 1, 2, 3 sudah benar. Maka dilakukan commit transaction
    	- Dapat mengisi otomatis kolom total harga. Dengan cara lama peminjaman x harga sewa perhari. Agar dapat mengambil nilai harga sewa perhari, dilakukan subquery dari entitas peminjaman ke entitas harga
    	- Kondisi 4. Apabila uang muka lebih kecil dari total harga maka dilakukan rollback transaction
    	- Kondisi 5. Apabila uang muka lebih besar dari total harga maka dilakukan rollback transaction
    	- Apabila kondisi 4 dan 5 terpenuhi maka di lakukan commit transaction
    	- Apabila uang muka sama dengan total harga maka sisa pembayaran diisi 0
    	- Dapat mengisi otomatis kolom sisa peminjaman. Dengan cara Total Harga - Uang Muka
    	- Dapat mengisi otomatis kolom status pinjam = 'DiSewa'

    5). Buatlah trigger dan procedure pada entitas peminjaman untuk melakukan proses pengembalian mobil berikut
    	- UPDTAE tb_peminjaman SET tgl_kembali=now() WHERE id_pengembalian = 'xxx';
    	- Setelah tgl_kembali terisi maka status peminjaman akan terisi otomatis dengan nilai Dikembalikan
    	- apabila tgl_kembali sesuai dengan tgl_pinjam + lama peminjaman, maka keterangan diisi non denda
    	- apabila tg_kembali TIDAK SESUAI dengan tgl_pinjam + lama peminjaman maka keterangan di isi denda
    	- apabila denda, maka entitas denda terisi secara otomatis. sesuai dengan proses bisnis yg ada.

Soal nomor 3. casecade dan softdelete studi kasus (ERD - New Sewa Mobil)
Apabila suatu penyewa diubah status data nya menjadi tidak aktif. Maka seluruh data peminjaman atas nama penyewa tersebut menjadi tidak aktif.
