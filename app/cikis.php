<?php
session_start();
if (isset($_SESSION["KullaniciAdi"])) {
    $KullaniciAdi = $_SESSION["KullaniciAdi"];
}

    if (isset($_SESSION["KullaniciAdi"])) {
        unset($_SESSION["KullaniciAdi"]);
        unset($_SESSION["Kullaniciid"]);
        unset($_SESSION["sifre"]);

        header("Location: AnaSayfa.php?sayfa=1");
    } else {
        header("Location: AnaSayfa.php?sayfa=1");
    }
?>
