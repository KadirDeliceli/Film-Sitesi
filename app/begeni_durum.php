<?php
session_start();
include("veri_tabanı.php");

$film_id = $_POST['film_id'];
$kullanici_id = $_POST['kullanici_id'];

// Beğeniyi kontrol et
$kontrol = mysqli_query($VeritabaniBaglantisi, "SELECT * FROM begeni WHERE film_id = $film_id AND kullanici_id = $kullanici_id");

if (mysqli_num_rows($kontrol) > 0) {
    echo "beğenildi";  // Beğenildi durumu
} else {
    echo "beğenilmedi";  // Beğenilmedi durumu
}
?>