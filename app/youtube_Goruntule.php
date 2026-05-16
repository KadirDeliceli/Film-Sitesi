<?php
session_start();
include("veri_tabanı.php");
if (isset($_SESSION["KullaniciAdi"])) {
    $KullaniciAdi = $_SESSION["KullaniciAdi"];
    /*
    echo "kullanıcı id      :   " . $_SESSION["Kullaniciid"] . "<br>";
    echo "kullanıcı adı         :   " . $KullaniciAdi . "<br>";
    echo "kullanıcı sifre      :   " . $_SESSION["sifre"] . "<br>";
    */
}
if (isset($_POST["sil_id"])) {
    $sil_id = $_POST["sil_id"];
    mysqli_query($VeritabaniBaglantisi, "DELETE FROM yorum WHERE yorum_id='$sil_id' AND kullanıcı_adı='$KullaniciAdi'");
}
if (isset($_POST["guncelle_id"]) && isset($_POST["guncellenmis_yorum"])) {
    $tarih = date('Y-m-d H:i:s');
    $yorumdurum = "yorum bu tarihte Güncellendi.";
    $id = $_POST["guncelle_id"];
    $yeni_yorum = $_POST["guncellenmis_yorum"];
    mysqli_query($VeritabaniBaglantisi, "UPDATE yorum SET yorum='$yeni_yorum',tarih='$tarih',yorum_durum='$yorumdurum'  WHERE yorum_id='$id' AND kullanıcı_adı='$KullaniciAdi'");
}
?>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Film Fragmanı</title>

    <link rel="stylesheet" href="css/youtube_Goruntule.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="css/alev.css">
    <link rel="stylesheet" href="css/dropdown.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <link rel="icon" type="image/png" href="profilResimlari/logo.jpg">
</head>

<body>



    <div class="navbar-container">

        <?php
        if (isset($_SESSION["KullaniciAdi"])) {
            $kullanıcıid = $_SESSION['Kullaniciid'];
            $VeritabaniBaglantisi = mysqli_connect("film-db", "root", "root", "film");
            mysqli_set_charset($VeritabaniBaglantisi, "UTF8");
            $sorgu = mysqli_query($VeritabaniBaglantisi, "SELECT resim_yolu FROM profilyolu WHERE kullanici_id = '$kullanıcıid'");
            if ($sorgu && mysqli_num_rows($sorgu) > 0) {
                $veri = mysqli_fetch_assoc($sorgu);
                $profilResmiYolu = $veri['resim_yolu'];
            } else {
                $profilResmiYolu = "profilResimlari/varsayilan_avatar.png";
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
            <div class="logo-container" style="display: flex; justify-content: flex-start;">
                <img src="profilResimlari/logo.jpg" alt="Film Logosu" width="150" height="100">
            </div>
        </a>
        <pre>                                                                                                                                                                            </pre>
    </div>    
    <div class="header">
        <a href="AnaSayfa.php?sayfa=1" class="btn">Ana Sayfa</a>
        <?php if (!isset($_SESSION["KullaniciAdi"])) {  ?>
            <a href="kullanıcı_kayıt.php" class="btn">Kayıt Ol</a>
            <a href="kullanıcı_giris.php" class="btn">Giriş Yap</a>
        <?php } ?>
    </div>

    <br>
    <div class="video-container">
        <?php
        if (isset($_GET["youtube"])) {
            $gelenyoutube = $_GET["youtube"];
            echo '<div class="youtube-video-kapsayici">';
            echo $gelenyoutube;
            echo '</div>';

            $VeritabaniBaglantisi = mysqli_connect("film-db", "root", "root", "film");
            mysqli_set_charset($VeritabaniBaglantisi, "UTF8");

            $Sorgu = mysqli_query($VeritabaniBaglantisi, "SELECT * FROM filmler WHERE youtube='$gelenyoutube'");
            $Kayit1 = mysqli_fetch_assoc($Sorgu);
            $filmid = $Kayit1["id"]; //puan kaydetmek için film id alındı
        ?>

            <h2><i class="fa-solid fa-fire"></i> <b>Puan Ver</b></h2>

            <div class="rating-container">
                <i class="fa-solid fa-fire fire" data-index="1"></i>
                <i class="fa-solid fa-fire fire" data-index="2"></i>
                <i class="fa-solid fa-fire fire" data-index="3"></i>
                <i class="fa-solid fa-fire fire" data-index="4"></i>
                <i class="fa-solid fa-fire fire" data-index="5"></i>
                <i class="fa-solid fa-fire fire" data-index="6"></i>
                <i class="fa-solid fa-fire fire" data-index="7"></i>
                <i class="fa-solid fa-fire fire" data-index="8"></i>
                <i class="fa-solid fa-fire fire" data-index="9"></i>
                <i class="fa-solid fa-fire fire" data-index="10"></i>
            </div>

            <!-- Oy mesajı kutusu -->
            <div class="rating-message" id="ratingMessage">Verdiğiniz oy: 7/10</div>

            <?php
            if (isset($_SESSION["Kullaniciid"])) {
                $kullanici_id = $_SESSION["Kullaniciid"];
                $puanSorgu = mysqli_query($VeritabaniBaglantisi, "SELECT puan FROM mypuan WHERE kullanici_id = $kullanici_id AND film_id = $filmid");
                $puanData = mysqli_fetch_assoc($puanSorgu);
                $kullaniciPuani = $puanData ? $puanData['puan'] : 0;
            } else {
                $kullaniciPuani = 0; // kullanıcı login olmamaşsa puanı 0 olarak belirledik
            }
            ?>
            <script>
                var film_id = <?php echo $filmid; ?>;
                var selectedRating = <?php echo $kullaniciPuani; ?>;

                $(document).ready(function() {
                    // Kullanıcı giriş yapmamışsa uyarı mesaj gönderdik burda
                    var kullaniciGirisYaptiMi = <?php echo isset($_SESSION["Kullaniciid"]) ? 'true' : 'false'; ?>;
                    if (!kullaniciGirisYaptiMi) {
                        alert("Puan vermek için giriş yapmanız gerekiyor!");
                        return;
                    }
                    // Sayfa yüklenince önceki puanı göstermke için yaptık
                    if (selectedRating > 0) {
                        $(".fire").each(function() {
                            $(this).toggleClass("active", $(this).data("index") <= selectedRating);
                        });
                        $("#ratingMessage").text("Verdiğiniz oy: " + selectedRating + "/10").fadeIn();
                        setTimeout(function() {
                            $("#ratingMessage").fadeOut();
                        }, 3000);
                    }

                    // Hover efekti
                    $(".fire").hover(function() {
                        let index = $(this).data("index");
                        $(".fire").each(function() {
                            $(this).toggleClass("active", $(this).data("index") <= index);
                        });
                    }, function() {
                        $(".fire").each(function() {
                            $(this).toggleClass("active", $(this).data("index") <= selectedRating);
                        });
                    });

                    // Tıklama ile puan verme
                    $(".fire").click(function() {
                        selectedRating = $(this).data("index");

                        $("#ratingMessage").text("Verdiğiniz oy: " + selectedRating + "/10").fadeIn();
                        setTimeout(function() {
                            $("#ratingMessage").fadeOut();
                        }, 3000);

                        // AJAX ile puanı sunucuya gönder
                        $.ajax({
                            url: "puanGonder.php",
                            method: "POST",
                            data: {
                                Mypuan: selectedRating,
                                filmid: film_id
                            },
                            success: function(response) {
                                console.log("Puan başarıyla gönderildi: " + response);
                            },
                            error: function() {
                                console.log("Puan gönderilirken hata oluştu.");
                            }
                        });
                    });
                });
            </script>



        <?php

            $Sorgu = mysqli_query($VeritabaniBaglantisi, "SELECT * FROM filmler WHERE youtube='$gelenyoutube'");

            if ($Sorgu && mysqli_num_rows($Sorgu) > 0) {
                while ($Kayit = mysqli_fetch_assoc($Sorgu)) {
                    $filmid = $Kayit["id"];
                    echo "<br><br><br>";
                    echo '<div class="film-afis-bilgileri">';
                    echo '<div class="film-afis">';
                    echo '<img src="' . $Kayit["resim"] . '" alt="' . $Kayit["isim"] . ' Afişi">';
                    echo "</div>";
                    echo '<div class="film-bilgileri">';
                    echo "<a href='" . $Kayit["link"] . "' target='_blank' class='btn'>IMDb</a>";
                    echo "  Puan: " . $Kayit["puan"] . " <br>";
                    echo "<p><b>Açıklama:</b> " . $Kayit["acıklama"] . "</p>";
                    echo "<p><b>Süre:</b> " . $Kayit["Sure"] . "</p>";
                    echo "<p><b>Yıl:</b> " . $Kayit["yıl"] . "</p>";
                    echo "<p><b>Oyuncular:</b><br><pre>" . $Kayit["oyuncular"] . "</pre></p>";
                    echo "</div>";
                    echo "</div>";
                    echo "<br><br>";
                }
            } else {
                echo "<p style='color: red; font-weight: bold;'>Film bilgileri bulunamadı!</p>";
            }
        } else {
            echo "<p style='color: red; font-weight: bold;'>YouTube fragman linki bulunamadı!</p>";
        }
        // $filmid film id
        ?>
        <?php if (isset($_SESSION["KullaniciAdi"])) {  ?>
            <div class="yorum-formu">
                <form method="POST">
                    <label for="yorum">Yorum Ekle:</label>
                    <textarea name="yorum" id="yorum" rows="4" placeholder="Yorumunuzu buraya yazın..."></textarea>
                    <input type="submit" value="Gönder">
                </form>
            </div>
        <?php }
        // Yorum ekleme işlemi
        if (isset($_POST["yorum"])) {
            $yorum = $_POST["yorum"];
            $tarih = date('Y-m-d H:i:s');
            $yorumdurum = "yorum bu tarihte yapıldı.";
            mysqli_query($VeritabaniBaglantisi, "INSERT INTO yorum (kullanıcı_adı, film_id, yorum, tarih, yorum_durum) VALUES ('$KullaniciAdi', '$filmid', '$yorum', '$tarih', '$yorumdurum')");
        }

        // Yorumları çekme
        $Sorgu = mysqli_query($VeritabaniBaglantisi, "SELECT * FROM yorum WHERE film_id='$filmid' ORDER BY yorum_id DESC");

        if ($Sorgu && mysqli_num_rows($Sorgu) > 0) {
            echo '<div class="yorumlar">';
            echo '<h3>Yorumlar</h3>';

            while ($Kayit = mysqli_fetch_assoc($Sorgu)) {
                echo '<div class="yorum">';
                echo '<span class="kullanici-adi">' . $Kayit["kullanıcı_adı"] . '</span>';
                echo '<p class="yorum-metin">' . nl2br($Kayit["yorum"]) . '</p>';

                if (isset($_SESSION["KullaniciAdi"])) {
                    $kullaniciAdi1 = $_SESSION["KullaniciAdi"];
                    if ($Kayit["kullanıcı_adı"] == $kullaniciAdi1) {
                        echo "<form method='POST' style='display:inline'>
                            <input type='hidden' name='sil_id' value='{$Kayit['yorum_id']}'>
                            <input type='submit' value='❌ Sil' class='sil-btn'>
                        </form>";

                        echo "<form method='POST' style='display:inline'>
                            <input type='hidden' name='duzenle_id' value='{$Kayit['yorum_id']}'>
                            <input type='submit' value='✏️ Düzenle' class='duzenle-btn'>
                        </form>";
                    }
                }
                echo  $Kayit["tarih"] . " " . $Kayit["yorum_durum"];
                echo "<hr>";
                echo "<br><br>";


                if (isset($_POST["duzenle_id"]) && $_POST["duzenle_id"] == $Kayit["yorum_id"]) {
                    echo "<form method='POST' class='duzenle-form'>
                            <textarea name='guncellenmis_yorum'>{$Kayit['yorum']}</textarea>
                            <input type='hidden' name='guncelle_id' value='{$Kayit['yorum_id']}'>
                            <input type='submit' value='Kaydet' class='kaydet-btn'>
                        </form>";
                }

                echo '</div>';
            }

            echo '</div>';
        } else {
            echo '<p class="yorum-yok">Henüz yorum yapılmamış.</p>';
        }
        mysqli_close($VeritabaniBaglantisi);
        ?>
    </div>


</body>

</html>