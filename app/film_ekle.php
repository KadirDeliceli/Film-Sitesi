<?php
include("veri_tabanı.php");
?>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Film Ekle</title>

    <link rel="stylesheet" href="css/film_ekle.css">

    <link rel="icon" type="image/png" href="profilResimlari/logo.jpg">

</head>

<body>
        
    <a href="AnaSayfa.php?sayfa=1" class="anasayfa-btn">Ana Sayfa</a>

    <div class="form-container">
        <form action="film_ekle.php" method="post">
            <label>İsim:</label>
            <input type="text" name="isim" required>

            <label>Puan:</label>
            <input type="text" name="puan" required>

            <label>Link:</label>
            <input type="text" name="link" required>

            <label>Youtube:</label>
            <input type="text" name="youtube" required>

            <label>Resim:</label>
            <input type="text" name="resim" required>

            <label>Acıklama:</label>
            <input type="text" name="acıklama" required>

            <label>Süre:</label>
            <input type="text" name="Sure" required>

            <label>Yıl:</label>
            <input type="text" name="yıl" required>

            <label>Oyucular:</label>
            <input type="text" name="oyuncular" required>

            <input type="submit" value="Gönder">
        </form>
    </div>

    <?php

    if (mysqli_connect_errno()) {
        echo "Bağlantı Hatası";
        echo "Hata Açıklaması: " . mysqli_connect_error() . "<br />";
    }

    if (isset($_POST["isim"]) && isset($_POST["puan"]) && isset($_POST["link"]) && isset($_POST["youtube"]) && isset($_POST["resim"]) && isset($_POST["acıklama"]) && isset($_POST["Sure"]) && isset($_POST["yıl"]) && isset($_POST["oyuncular"])) {
        $gelenisim = $_POST["isim"];
        $gelenpuan = $_POST["puan"];
        $gelenlink = $_POST["link"];
        $gelenyoutube = $_POST["youtube"];
        $gelenresim = $_POST["resim"];
        $gelenacıklama = $_POST["acıklama"];
        $gelenSure = $_POST["Sure"];
        $gelenyıl = $_POST["yıl"];
        $gelenoyuncular = $_POST["oyuncular"];
        $sorgu = mysqli_query($VeritabaniBaglantisi, "INSERT INTO filmler (isim, puan, link, youtube, resim , acıklama , Sure , yıl , oyuncular) VALUES ('$gelenisim', '$gelenpuan', '$gelenlink', '$gelenyoutube', '$gelenresim','$gelenacıklama' ,'$gelenSure', '$gelenyıl', '$gelenoyuncular')");

        if ($sorgu) {
            echo "<p style='color: green; font-weight: bold;'>Film başarıyla eklendi!</p>";
        } else {
            echo "<p style='color: red; font-weight: bold;'>Film ekleme sırasında bir sorun oluştu...</p>";
        }
    }
    ?>

</body>

</html>