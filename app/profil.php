<?php
session_start();
include("veri_tabanı.php");
if (isset($_SESSION["KullaniciAdi"])) {
    $KullaniciAdi = $_SESSION["KullaniciAdi"];
?>
    <!DOCTYPE html>
    <html lang="tr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profil</title>

        <link rel="stylesheet" href="css/anasayfa.css">
        <link rel="stylesheet" href="css/dropdown.css">
        <link rel="stylesheet" href="css/profil.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

        <link rel="icon" type="image/png" href="profilResimlari/logo.jpg">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    </head>

    <body>
      


        <div class="navbar-container">

            <?php
            if (isset($_SESSION["KullaniciAdi"])) {
                $kullanıcıid = $_SESSION['Kullaniciid'];

                $sorgu = mysqli_query($VeritabaniBaglantisi, "SELECT resim_yolu FROM profilyolu WHERE kullanici_id = '$kullanıcıid'");
                if ($sorgu && mysqli_num_rows($sorgu) > 0) {
                    $veri = mysqli_fetch_assoc($sorgu);
                    $profilResmiYolu = $veri['resim_yolu'];
                } else {
                    $profilResmiYolu = "profilResimlari/varsayilan_avatar.png"; // Yüklenmemişse varsayılan resim
                }
                echo '<div class="navbar" style="position: absolute; top: 0px; right: 0px; color:black; background-color:#ffcc00; border-radius: 10px; padding: 8px 15px; display: flex; align-items: center; gap: 50px;">
                <span><strong>' . htmlspecialchars($KullaniciAdi) . '</strong></span>
                <img src="' . $profilResmiYolu . '" alt="Profil" style="width: 35px; height: 35px; border-radius: 50%; object-fit: cover;">
            </div>';
            } else {
                echo "HdfilmCenneti";
            }
            ?>



            <div class="dropdown">
                <a href="profil.php"><i class="fas fa-cog"></i> Profil Ayarlarım</a>
                <a href="kaydedilen.php"><i class="fas fa-list"></i> Kayıt Edilen Filmler</a>
                <a href="begenilen.php"><i class="fas fa-heart"></i> Beğenilen Filmler</a>
                <a href="izlenen.php"><i class="fas fa-eye"></i> İzlenen Filmler</a>
                <a href="cikis.php"><i class="fas fa-sign-out-alt"></i> Çıkış Yap</a>
            </div>
        </div>

        <script>
            $(document).ready(function() {
                $(".navbar").click(function() {
                    $(".dropdown").toggle();
                });

                // Menü dışına tıklayınca kapanmasını sağla
                $(document).click(function(e) {
                    if (!$(e.target).closest(".navbar-container").length) {
                        $(".dropdown").hide();
                    }
                });
            });
        </script>
    

        <div class="header">
            <a href="AnaSayfa.php?sayfa=1">
                <div class="logo-container">
                    <img src="profilResimlari/logo.jpg" alt="Film Logosu" width="150" height="100">
                </div>
            </a>
            <a href="AnaSayfa.php?sayfa=1" class="btn">Ana Sayfa</a>
        </div>   
        <br>
        <div class="film-container">
            <?php
            if (mysqli_connect_errno()) {
                echo "Bağlantı Hatası: " . mysqli_connect_error();
                die();
            }
            $kullanıcıid = $_SESSION['Kullaniciid'];
            $KullaniciAdi = $_SESSION["KullaniciAdi"];
            ?>

            <div class="profil-karti">
                <form action="profil.php" method="post" enctype="multipart/form-data">
                    <h2>Profil Ayarları</h2>

                    <label for="kullaniciadi">Kullanıcı Adınız:</label>
                    <input type="text" name="kullaniciadi" id="kullaniciadi" value="<?php echo htmlspecialchars($KullaniciAdi); ?>" readonly required>

                    <label for="Dosya">Profil Fotoğrafı:</label>

                    <div class="profil-resmi-container">
                        <img src="<?php echo $profilResmiYolu; ?>" id="profilPreview" onclick="document.getElementById('Dosya').click();">
                        <input type="file" name="Dosya" id="Dosya" accept="image/*" style="display:none;" onchange="gosterResim(this)">
                    </div>

                    <button type="submit">Profili Kaydet</button>
                </form>
            </div>

            <script>
                function gosterResim(input) {
                    if (input.files && input.files[0]) {
                        const okuyucu = new FileReader();
                        okuyucu.onload = function(e) {
                            document.getElementById('profilPreview').src = e.target.result;
                        };
                        okuyucu.readAsDataURL(input.files[0]);
                    }
                }
            </script>



            <?php
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                $gelendosya = $_FILES["Dosya"];
                $DosyaninAdi        = $_FILES["Dosya"]["name"];
                $DosyaninTempAdi    = $_FILES["Dosya"]["tmp_name"];
                $Yol                = "profilResimlari/";
                $DosyaYoluVeAdi     = $Yol . $DosyaninAdi;

                if (move_uploaded_file($DosyaninTempAdi, $DosyaYoluVeAdi)) {
                    
                    $kontrol = mysqli_query($VeritabaniBaglantisi, "SELECT * FROM profilyolu WHERE kullanici_id = '$kullanıcıid'");

                    if (mysqli_num_rows($kontrol) > 0) {
                        // Kayıt varsa güncelle
                        $guncelle = mysqli_query($VeritabaniBaglantisi, "UPDATE profilyolu SET resim_yolu = '$DosyaYoluVeAdi' WHERE kullanici_id = '$kullanıcıid'");
                        if ($guncelle) {
                            echo "Profil fotoğrafı güncellendi.";
                        } else {
                            echo "Güncelleme hatası: " . mysqli_error($VeritabaniBaglantisi);
                        }
                    } else {
                        // Kayıt yoksa ekle
                        $ekle = mysqli_query($VeritabaniBaglantisi, "INSERT INTO profilyolu (kullanici_id, resim_yolu) VALUES ('$kullanıcıid', '$DosyaYoluVeAdi')");
                        if ($ekle) {
                            echo "Profil fotoğrafı eklendi.";
                        } else {
                            echo "Ekleme hatası: " . mysqli_error($VeritabaniBaglantisi);
                        }
                    }
                } else {
                    echo "Dosya yüklenemedi.";
                }
            }
            mysqli_close($VeritabaniBaglantisi);
            echo "<br><br><br>";
            echo '</div>';
            ?>
        </div>

    <?php
} else {
    header("Location: AnaSayfa.php?sayfa=1");
}
    ?>
    </body>

    </html>