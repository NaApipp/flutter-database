<?php 
// Header Script agar bisa diakses flutter
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");


$koneksi = new mysqli('localhost','root','','db_produk');

$id_produk = $_POST['id_produk'];  
$nama_produk = $_POST['nama_produk'];  
$harga_produk = $_POST['harga_produk'];  
$stok_produk = $_POST['stok_produk'];  
$warna_produk = $_POST['warna_produk'];  

$data = mysqli_query($koneksi, "update  tb_produk set
                                        nama_produk='$nama_produk', 
                                        harga_produk='$harga_produk',
                                        stok_produk='$stok_produk',
                                        warna_produk='$warna_produk' where id_produk='$id_produk'");

if ($data) {
    echo json_encode([
        'pesan' => 'Sukses Update'
    ]);
} else {
    echo json_encode([
        'pesan' => 'Gagal Update'
    ]);
}
?>