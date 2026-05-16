<?php
include("veri_tabanı.php");
?>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kullanıcı Kayıt</title>

    <link rel="stylesheet" href="css/kullanıcı_kayıt.css"> <!-- CSS dosyasını bağlama -->

    <link rel="icon" type="image/png" href="profilResimlari/logo.jpg">

</head>

<body>
    <a href="AnaSayfa.php?sayfa=1" class="btn">Ana Sayfa</a>
    <a href="kullanıcı_giris.php" class="btn">Giriş Yap</a>

    <div class="container">
        <h2>Kullanıcı Kayıt</h2>
        <form action="kullanıcı_kayıt.php" method="post">
            Kullanıcı Adı: <input type="text" name="kullaniciadi" required><br>
            Şifre: <input type="password" name="sifre" required><br>
            <input type="submit" value="KAYIT OL">
        </form>

        <?php

        if (mysqli_connect_errno()) {
            echo "<p class='message' style='color: red;'>Bağlantı Hatası: " . mysqli_connect_error() . "</p>";
            exit();
        }

        if (isset($_POST["kullaniciadi"]) && isset($_POST["sifre"])) {
            $gelenkullaniciadi = $_POST["kullaniciadi"];
            $Gsifre = $_POST["sifre"];

            $gelensifre = password_hash($Gsifre, PASSWORD_DEFAULT);

            $kontrol_sorgusu = "SELECT * FROM kullanici WHERE kullaniciadi = '$gelenkullaniciadi'";
            $kontrol_sonucu = mysqli_query($VeritabaniBaglantisi, $kontrol_sorgusu);

            if (mysqli_num_rows($kontrol_sonucu) > 0) {
                echo "<p class='message' style='color: red;'>Bu kullanıcı adı zaten kullanılıyor. Lütfen farklı bir kullanıcı adı seçin.</p>";
            } else {
                $ekleme_sorgusu = "INSERT INTO kullanici (kullaniciadi, sifre) VALUES ('$gelenkullaniciadi', '$gelensifre')";
                $sorgu = mysqli_query($VeritabaniBaglantisi, $ekleme_sorgusu);

                if ($sorgu) {
                    echo "<p class='message' style='color: green;'>Kullanıcı başarıyla eklendi!</p>";
                } else {
                    echo "<p class='message' style='color: red;'>Kullanıcı ekleme sırasında bir sorun oluştu.</p>";
                }
            }
        }
        mysqli_close($VeritabaniBaglantisi);
        ?>
    </div>
</body>

</html>