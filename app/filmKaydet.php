<?php
session_start();
include("veri_tabanı.php");
if (isset($_POST["film_id"]) && isset($_POST["kullanici_id"])) {
    $film_id = $_POST["film_id"];
    $kullanici_id = $_POST["kullanici_id"];


    if (mysqli_connect_errno()) {
        echo "Bağlantı hatası: " . mysqli_connect_error();
        exit;
    }

    // Daha önce kaydetme yapılmış mı kontrol et
    $kontrol = mysqli_query($VeritabaniBaglantisi, "SELECT * FROM kaydet  WHERE film_id = $film_id AND kullanici_id = $kullanici_id");

    if (mysqli_num_rows($kontrol) > 0) {
        // kaydetme varsa sil (beğeniyi geri al)
        mysqli_query($VeritabaniBaglantisi, "DELETE FROM kaydet  WHERE film_id = $film_id AND kullanici_id = $kullanici_id");
        echo "Beğeni kaldırıldı";
    } else {
        // kaydetme yoksa ekle (daha önce eklenmemişse)
        mysqli_query($VeritabaniBaglantisi, "INSERT INTO kaydet  (film_id, kullanici_id) VALUES ($film_id, $kullanici_id)");
        echo "Beğeni eklendi";
    }

    mysqli_close($VeritabaniBaglantisi);
} else {
    echo "Veriler eksik";
}
?>
