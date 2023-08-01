CREATE DATABASE belajar_basisdata

USE belajar_basisdata

DROP TABLE pegawai;
-- Sebaiknya tidak memakai drop tapi pakai ALTER 

CREATE TABLE pegawai (
	`id_pegawai` INT(11) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(255) NOT NULL UNIQUE,
	`password` VARCHAR(255) NOT NULL,
	`nama_pegawai` VARCHAR(255) NULL,
	`tempat_lahir` VARCHAR(255) NULL,
	`tanggal_lahir` VARCHAR(255) NULL,
	`jenis_kelamin` VARCHAR(255) NULL,
	`alamat` VARCHAR(255) NULL,
	`no_telp` VARCHAR(255) NULL,
	`jabatan` VARCHAR(255) NULL,
	`created_at` datetime NULL,
	`updated_at` datetime NULL,
	`deleted_at` datetime NULL,
	`status_data` VARCHAR(255) NULL,
	PRIMARY KEY (`id_pegawai`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO pegawai (id_pegawai, username, password, nama_pegawai, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_telp, jabatan, created_at, updated_at, deleted_at, status_data) 
	VALUES 
		(1 , 'oskhar', 'testing', 'muh oskhar', 'jakarta', '9april 2003', 'laki laki', 'jakarta barat', '0987634567', 'mahasiswa', NOW(), NULL, NULL, 'active'),
		(2 , 'faiz', 'testing', 'muh oskhar', 'jakarta', '9april 2003', 'laki laki', 'jakarta barat', '0987634567', 'mahasiswa', NOW(), NULL, NULL, 'active'),
		(3 , 'vallendra', 'testing', 'muh oskhar', 'jakarta', '9april 2003', 'laki laki', 'jakarta barat', '0987634567', 'mahasiswa', NOW(), NULL, NULL, 'active');

TRUNCATE TABLE pegawai; 

SELECT * FROM pegawai;