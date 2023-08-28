<?php

$conn = mysqli_connect("localhost", "root", "tesdoang", "belajar_basisdata");
if (!$conn) {
    die("error");
}

$query = mysqli_query($conn, "SELECT COUNT(nik) FROM penyewa");
$result = mysqli_fetch_column($query);

print json_encode($result);
?>