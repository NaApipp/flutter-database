<?php 
// Header Script agar bisa diakses flutter
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");


$koneksi = new mysqli('localhost','root','','db_produk');

$id_produk = $_POST['id_produk'];  
 

$data = mysqli_query($koneksi, "delete from tb_produk where id_produk='$id_produk'");

if ($data) {
    echo json_encode([
        'pesan' => 'Sukses Delete'
    ]);
} else {
    echo json_encode([
        'pesan' => 'Gagal Delete'
    ]);
}
?>