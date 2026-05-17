-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3357
-- Üretim Zamanı: 15 Tem 2025, 13:37:23
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `film`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `begeni`
--

CREATE TABLE `begeni` (
  `begeni_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `begeni`
--

INSERT INTO `begeni` (`begeni_id`, `film_id`, `kullanici_id`) VALUES
(1, 1, 2),
(3, 1, 1),
(4, 8, 1),
(5, 4, 2),
(6, 8, 2),
(7, 6, 2),
(9, 24, 1),
(10, 20, 1),
(11, 13, 1),
(12, 11, 1),
(13, 2, 1),
(14, 29, 1),
(15, 28, 1),
(16, 27, 1),
(17, 28, 2),
(18, 3, 9),
(19, 4, 9),
(20, 8, 9),
(21, 2, 10),
(22, 3, 10),
(23, 1, 11),
(24, 2, 11),
(25, 4, 11),
(26, 1, 13),
(27, 3, 13),
(28, 6, 13),
(29, 1, 14),
(30, 6, 14),
(31, 13, 14),
(32, 7, 14),
(33, 1, 15),
(34, 4, 15),
(35, 6, 15),
(36, 8, 15),
(37, 12, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `filmler`
--

CREATE TABLE `filmler` (
  `id` int(11) NOT NULL,
  `isim` varchar(50) NOT NULL,
  `puan` varchar(10) NOT NULL,
  `link` varchar(500) NOT NULL,
  `youtube` varchar(1000) NOT NULL,
  `resim` varchar(500) NOT NULL,
  `acıklama` longtext NOT NULL,
  `Sure` varchar(15) NOT NULL,
  `yıl` varchar(10) NOT NULL,
  `oyuncular` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `filmler`
--

INSERT INTO `filmler` (`id`, `isim`, `puan`, `link`, `youtube`, `resim`, `acıklama`, `Sure`, `yıl`, `oyuncular`) VALUES
(1, 'The Gorge', '6.8', 'https://www.imdb.com/title/tt13654226/?ref_=ext_shr_lnk', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/rUSdnuOLebE?si=fMWf6tlELa7Act-O\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://image.tmdb.org/t/p/original/2HmsMhRXM7dNIUgDvmRlshfPldJ.jpg', 'Birbirlerinden uzakta görev yapan iki yetenekli ajan gizemli bir uçurumu korurken yakınlaşır. Aşağıdaki kötülük ortaya çıkınca, içinde ne varsa hayatta kalmak için beraber hareket etmeleri gerekir.', '127 dakika', '2025', 'John Lone. Rolü : Shiwan Khan.\r\nPeter Boyle. Rolü : Moe Shrevnitz.\r\nTim Curry. Rolü : Farley Claymore.\r\nAlec Baldwin. Rolü : Lamont Cranston / The Shadow.\r\nIan McKellen. Rolü : Dr. Reinhardt Lane.\r\nPenelope Ann Miller. Rolü : Margo Lane.\r\nSab Shimono. Rolü : Dr. Tam.\r\nJonathan Winters. Rolü : Barth.'),
(2, 'Vahşi Robot', '8.2', 'https://www.imdb.com/title/tt29623480/?ref_=ext_shr_lnk', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/67vbA5ZJdKQ?si=8xXIiOwEY8T56CqZ\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img3.acsta.net/r_1920_1080/img/97/ac/97ac1dd0ec6391e6acde380ede79c1bc.png', 'Bir robot olan ROZZUM birimi 7134, kısaca Roz, ıssız bir adada gemi kazası geçirir. Zorlu koşullara uyum sağlamayı öğrenir, adadaki hayvanlarla ilişkiler kurar ve yetim kalmış bir kaz yavrusunun evlatlık ebeveyni olur.\r\n', '101 Dakika', '2024', 'Lupita Nyong\'o: Roz\r\nPedro Pascal: Fink\r\nKit Connor: Brightbill\r\nBill Nighy: Longneck\r\nStephanie Hsu: Vontra\r\nMatt Berry: Paddler\r\nVing Rhames: Thunderbolt\r\nMark Hamill: Thorn\r\nCatherine O\'Hara: Pinktail'),
(3, 'Old Guy', '5.2', 'https://www.imdb.com/title/tt26442053/?ref_=ext_shr_lnk', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vAGp4TkTbAE?si=C4K9HypWCT_diqfW\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/img/0a/31/0a31c611c7891c54feda237f8a1008f0.jpg', 'Eski kiralık katil Danny, kulüp yöneticisi Anata\'ya aşkını kazanmak için çabalarken, şirket tarafından tekrar sahaya çağrılır. Ancak sadece Z kuşağı yetenekli suikastçı Wihlborg\'u eğitmek için. Dünyası altüst olur, ama bu fırsatı kaçırmaz.', '93 dakika ', '2024', 'Christoph Waltz\r\nLucy Liu\r\nCooper Hoffman\r\nDesmond Eastwood'),
(4, 'Kaptan Amerika: Cesur Yeni Dünya', '6.1', 'https://www.imdb.com/title/tt14513804/?ref_=ext_shr_lnk', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/aWyh7fORVBw?si=ey6U7qJY6nce2ISL\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img3.acsta.net/r_1920_1080/img/d9/80/d980b16b510f2ae4ac4ac4e136b84741.jpg', 'Sam, yeni Başkan Thaddeus Ross ile görüştükten sonra uluslararası bir olayın ortasında kalır. Dünyayı tehlikeye atan sinsi bir planın arkasındaki nedeni açığa çıkarmalıdır.', '108 dakika', '2025', 'Anthony Mackie: Sam Wilson / Kaptan Amerika\r\nHarrison Ford: Thaddeus \"Thunderbolt\" Ross\r\nDanny Ramirez: Joaquin Torres / Falcon\r\nTim Blake Nelson: Samuel Sterns / The Leader\r\nShira Haas: Ruth Bat-Seraph / Sabra\r\nCarl Lumbly: Isaiah Bradley\r\nLiv Tyler: Betty Ross'),
(6, 'Örümcek Adam: Eve Dönüş', '8.2', 'https://www.imdb.com/title/tt10872600/?ref_=ext_shr_lnk', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/mQ_F_0jA59k?si=0ni5697w4iB2G94f\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img2.acsta.net/r_1920_1080/img/d1/54/d15496a20a072faed305f221e028a365.jpg', 'Örümcek Adam\'ın gerçek kimliği Peter Parker olarak ortaya çıkmasından sonra gelişen olaylar anlatılıyor. Peter, kimliğinin ortaya çıkmasından sonra büyük suçlamalarla karşı karşıya kalır. Medyanın baskısı altında kalınca yakınındakiler de tehlikeye girer. Peter, Doktor Strange\'den yardım ister. ', '148 dakika', '2021', 'Tom Holland: Peter Parker / Örümcek Adam\r\nMichael Keaton: Adrian Toomes / Akbaba\r\nRobert Downey Jr.: Tony Stark / Demir Adam\r\nZendaya: Michelle Jones\r\nMarisa Tomei: May Parker\r\nJacob Batalon: Ned Leeds\r\nJon Favreau: Happy Hogan\r\nLaura Harrier: Liz Allan\r\nTony Revolori: Flash Thompson\r\nBokeem Woodbine: Herman Schultz / Şokçu\r\nDonald Glover: Aaron Davis'),
(7, 'The Batman', '7.8', 'https://www.imdb.com/title/tt1877830/?ref_=ext_shr_lnk', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/mqqft2x_Aa4?si=PI8h1Fz0N2ZOvNTH\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://upload.wikimedia.org/wikipedia/tr/2/27/Batman_Arkham_Knight_Kapak_Resmi.jpg', 'Matt Reeves, The Batman filminde Bruce Wayne\'i dünyanın en iyi dedektifi olarak göstereceğini açıklamıştı. Çizgi romanlara uygun olarak ilerlemeyi planlayan Reeves, izleyicilerine noir bir film sunacak. The Batman\'in oyuncu kadrosunda kesin olarak yer alacak olan ve karakterleri belli olan isimler Batman rolüyle Robert Pattinson; Catwoman rolüyle Zoe Kravitz; The Riddler rolüyle Paul Dano ve Jim Gordon rolüyle Jeffrey Wright, Alfred rolüyle Andy Serkis ve Carmine Falcone rolüyle John Turturro\'dan oluşuyor.', '176 dakika', '2022', 'Robert Pattinson: Bruce Wayne / Batman\r\nZoë Kravitz: Selina Kyle / Kedi Kadın\r\nPaul Dano: Edward Nashton / Riddler\r\nJeffrey Wright: James Gordon\r\nJohn Turturro: Carmine Falcone\r\nPeter Sarsgaard: Gil Colson\r\nBarry Keoghan: Stanley Merkel / Joker\r\nAndy Serkis: Alfred Pennyworth\r\nColin Farrell: Oswald \"Penguen\" Cobblepot'),
(8, 'Arrival ', '7.9', 'https://www.imdb.com/title/tt2543164/?ref_=ext_shr_lnk', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tFMo3UJ4B4g?si=NI8iRIv7PLVsptI7\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/img/8f/64/8f642a9e7b4f4208e86637eebf4ad1ae.jpg', 'Gizemli bir uzay gemisi dünyaya iniş yapar. Amaçlarının ne olduğu bilinmeyen uzaylılarla iletişim kurmanın yolları aranmaya başlar. Uzaylılarla iletişim kurması için bir dil bilimcisi olan Dr. Louise Banks hükümet tarafından göreve çağrılır. Uzaylıların barışçıl mı yoksa istilacı mı olduğu çözülmeye çalışılacaktır. Başrollerini Amy Adams ve Jeremy Renner’ın palaştığı Arrival filminin yönetmen koltuğunda ise Denis Villeneuve oturuyor.', '116 dakika ', '2016', 'Amy Adams: Dr. Louise Banks\r\nJeremy Renner: Ian Donnelly\r\nForest Whitaker: Albay G.T. Weber\r\nMichael Stuhlbarg: Ajan Halpern\r\nTzi Ma: General Shang'),
(11, 'Oldboy', '8.3', 'https://www.imdb.com/title/tt0364569/?ref_=nv_sr_srsg_0_tt_6_nm_2_in_0_q_oldb', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TJyExPnb_cw?si=GIOFkYHyZ0S87P2A\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img3.acsta.net/r_1920_1080/img/aa/4c/aa4c4832575815c0a43c9de0dc7e4634.jpg', 'İhtiyar Delikanlı, yıllarca hapis tutulan bir adamın serbest bırakılmasının ardından intikam arayışını konu ediyor. Oh Dae-Soo adında bir adam, bir gün kaçırılır ve 15 yıl boyunca eski püskü bir hücrede tutuklu kalır. Hiçbir açıklama yapılmamıştır. Sonra bir gün serbest bırakılır. Eline, para, cep telefonu ve pahalı kıyafetler verilir. Bu adam başına gelen bu durumun nasıl ve neden olduğunu anlamak ve gereken intikamı almak konusunda kararlıdır. Bu sırada Oh Dear-Soo aslında kendisini kaçıranların daha da büyük bir planının olduğunu keşfeder. Ancak bu planın özü acı dolu bir yoldan geçmektedir. Gerçeği bulmak ise bu yolun ta kendisidir.', '120 dakika', '2003', 'Choi Min-sik - Oh Dae-su\nYoo Ji-tae - Lee Woo-jin\nKang Hye-jung - Mi-do\nKim Byeong-ok - Mr. Han\nOh Dal-su - Park Cheol-woong'),
(12, 'Mad Max: Fury Road', '8.3', 'https://www.imdb.com/title/tt1392190/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_mad%2520max%2520f', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/hEJnMQG9ev8?si=ZPbEdzBhiM6kxMzO\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img2.acsta.net/r_1920_1080/img/72/c5/72c5f95a497b28e0cd2f3b928ac1a318.jpg', '\r\n\r\nMad Max: Fury Road\'da, zorlu geçmişi Mad Max’i hayatta kalmak için en iyi yolun yalnız olmak gerektiğine inandırmıştır. Yine de bir şekilde kendini Furiosa adlı liderlerinin peşinde çorak topraklardaki savaş ortamından, sürekli kaçarak hayatta kalmaya çalışan bir grubun arasında bulur. Yaşadıkları ortamı zalimce yöneten Immortan Joe’dan kaçmaktadırlar ve Joe kendisinden çalınan ve yeri doldurulamayacak derecede önemli kaybının peşindedir. Post-apokaliptik türünün yaratıcısı ve efsanevi “Mad Max” filmlerinin ardındaki usta yönetmen George Miller\'ın bir kez daha yönetmen koltuğunda oturduğu Mad Max: Fury Road geri dönüyor! Charlize Theron ve Tom Hardy\'nin rol aldığı film, serinin dördüncü bölümü. Filmin diğer başrollerinde; Nicholas Hoult, Hugh Keays-Byrne, Nathan Jones, Josh Helman, Rosie Huntington-Whiteley, Riley Keough, Zoë Kravitz yer alıyor.\r\n', '118 dakika', '2015', 'Tom Hardy - Max Rockatansky\r\nCharlize Theron - Imperator Furiosa\r\nNicholas Hoult - Nux\r\nHugh Keays-Byrne - Immortan Joe\r\nJosh Helman - Slit\r\nNathan Jones - Rictus Erectus\r\nZoë Kravitz - Toast the Knowing\r\nRosie Huntington-Whiteley - The Splendid Angharad\r\nRiley Keough - Capable\r\nAbbey Lee - The Dag\r\nCourtney Eaton - Cheedo the Fragile\r\n'),
(13, 'The Matrix', '8.7', 'https://www.imdb.com/title/tt0133093/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_matrix', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vKQi3bBA1y8?si=UdFwcMHLk1Pkniqm\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img3.acsta.net/r_1920_1080/img/1b/42/1b427ba68cb9e9086246256c1db4f719.jpg', '\r\n\r\nBir yaşanan gerçek vardır, bir de yaşananın ötesinde olan gerçeklik... Biri rüya, diğeri ise Matrix! Neo,son derece tehlikeli bir adam olan Morpheus’un gerçeği bildiğine inanmaktadır. Bir gece Neo, kendisini başka bir dünyaya götürebilecek güzel yabancı Trinity ile tanışır. Bu kızın götüreceği dünyada, Neo Morpheus’u bulacak ve Matrix hakkında bir şeyler öğrenecektir. Neo, Tam olarak kavrayamadığı şeylerin yaşamını kontrol ettiğini biliyor.. Nedir bu Matrix?\r\n', '136 dakika', '1999', 'Keanu Reeves - Neo\r\nLaurence Fishburne - Morpheus\r\nCarrie-Anne Moss - Trinity\r\nHugo Weaving - Agent Smith\r\nGloria Foster - The Oracle\r\nJoe Pantoliano - Cypher\r\nMarcus Chong - Tank\r\n'),
(14, 'The Good The Bad and The Ugly', '8.8', 'https://www.imdb.com/title/tt0060196/?ref_=nv_sr_srsg_0_tt_6_nm_2_in_0_q_the%2520good%2520the%2520bad', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/IFNUGzCOQoI?si=lo-sXURK2NlloJwW\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/pictures/23/08/10/01/52/2929498.jpg', '\r\n\r\nİyi, Kötü ve Çirkin, üç silah arkadaşının maceralarını konu ediyor. Ortak bir hedefe doğru değişik nedenlerle yol almakta olan üç silah arkadaşı aslında kader açısından yolları kesişmiş insanlardır. İsimleri İyi, Kötü ve Çirkin olan bu kişiler için o dönemdeki Amerikan İç Savaşı bir araçtır. İyi ile Çirkin’in risk barındıran ancak iyi para getiren işleri mevcuttur. Çirkin, aranan azılı bir suçlu olduğu için İyi onu adalete teslim edip önce ödülünü alıyor sonra da darağacından riskli bir metot ile kurtarıp bir sonraki işe kadar sağ kalmasını sağlamaktadır. Bir gün gizli bir hazinenin ortaya çıkmasıyla ikilinin araları bozulur. Onlar birbirleriyle didişirken ortaya üçüncü bir hazine avcısı çıkar; o da Kötü adındaki kişidir. Artık her şeyin başka türlü yaşanma zamanıdır...\r\n', '161 dakika', '1966', 'Clint Eastwood - Blondie (The Good)\r\nLee Van Cleef - Angel Eyes (The Bad)\r\nEli Wallach - Tuco (The Ugly)\r\nAldo Giuffrè - Alcoholic Union Captain\r\nLuigi Pistilli - Father Pablo Ramirez\r\nRada Rassimov - Maria\r\nMario Brega - Corporal Wallace\r\n'),
(15, 'There Will Be Blood', '8.2', 'https://www.imdb.com/title/tt0469494/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_there%2520wi', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/FeSLPELpMeM?si=lCSp4fWbTeRbZINB\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img2.acsta.net/r_1920_1080/medias/nmedia/18/63/80/44/18887932.jpg', 'Kan Dökülecek\'te, Daniel Plainview, 1900\'lü yılların başlarında ıssız bir bölgede, petrol arama çalışmalarını sürdüren bir şirketin sahibidir. Daha fazlasına sahip olmak isteyen bu hırslı adamın hayattaki tek varlığı küçük oğludur. Petrol buldukları bu bölgeyi yörenin yerlilerinin izniyle arama iznini satın alan adam hırsın götürdüklerine tanık olacak, diğer yandan ise kasabanın gencecik rahibinin yaşantısındaki hırs faktörü de Daniel\'da olduğu gibi, sahip olduğu yegane şeyi mahvedecektir.', '158 dakika', '2007', 'Daniel Day-Lewis - Daniel Plainview\nPaul Dano - Eli Sunday\nKevin J. O\'Connor - Henry Brands\nCiarán Hinds - Fletcher Hamilton\nDillon Freasier - H.W. Plainview\n'),
(16, 'The Thing', '8.2', 'https://www.imdb.com/title/tt0084787/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_The%2520Thing', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5ftmr17M-a4?si=1gHdlZ3a68yYhQXg\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://m.media-amazon.com/images/M/MV5BYTA3NDU5MWEtNTk4Yy00ZDNkLThmZTQtMjU3ZGVhYzAyMzU4XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'Antarktika\'daki bir araştırma ekibi, kurbanlarının görünümüne bürünen şekil değiştiren bir uzaylı tarafından avlanır.\r\n\r\n', '109 dakika', '1982', 'Kurt Russell - R.J. MacReady\r\nWilford Brimley - Dr. Blair\r\nT.K. Carter - Nauls\r\nDavid Clennon - Palmer\r\nKeith David - Childs\r\nRichard Dysart - Dr. Copper\r\nCharles Hallahan - Norris\r\nPeter Maloney - George Bennings\r\nRichard Masur - Clark\r\nDonald Moffat - Garry\r\n'),
(17, 'The Big Lebowski', '8.1', 'https://www.imdb.com/title/tt0118715/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_Big%2520Le', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/cd-go0oBF4Y?si=5SHtF1mcSXwv04nY\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/img/18/e6/18e6061e735abd1c7598c06c4083381b.jpg', '\r\nBüyük Lebowski, muhtemelen Coenlerin kendine has filmografilerinin içerisinde bile ayrı bir yere ve öneme sahip olarak değerlendiriliyor. Bir karışıklık bazen umulmadık olaylara sebep olabilir. Kaldı ki işin içinde para varsa olaya dahil olacak bir sürü insan da çıkar. Jeff Lebowski böyle bir meselenin orta yerinde kalır. ...\r\n', '117 dakika', '1998', 'Jeff Bridges - Jeffrey \"The Dude\" Lebowski\r\nJohn Goodman - Walter Sobchak\r\nJulianne Moore - Maude Lebowski\r\nSteve Buscemi - Theodore Donald \"Donny\" Kerabatsos\r\nDavid Huddleston - Jeffrey Lebowski (The Big Lebowski)\r\nPhilip Seymour Hoffman - Brandt\r\nTara Reid - Bunny Lebowski\r\n'),
(18, 'Blade Runner', '8.1', 'https://www.imdb.com/title/tt0083658/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_blade%2520runner', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/eogpIG53Cis?si=LfAYsYaeYku-3aMh\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/img/05/00/05000bd2f1e9ceed98e799f9658dc65d.jpg', 'Bıçak Sırtı, çekildiği yıldan çok uzak bir dönemde, 2019 yılında, dünyanın artık distopik bir yaşam alanı haline geldiği bir dönemde geçer. Tyrell gibi devasa üretici firmalar Replikant isimli, dış görünüm olarak insan türünden ayırt edilemeyen robotlar üretmektedirler. Dünya dışı kolonilerin tehlikeli ve illegal işlerinin halledilmesi için kullanılan bu robotlar, Blade Runners isimli özel polisler tarafından yakalanmaktadır. Uzman bir Blade Runner olan Rick Deckard, görevini bıraktığı bir esnada, Los Angeles’a gelen bir grup replikantı yakalamak için verilen son bir görevi kabul eder. Ancak iki milyon insanın yaşadığı bu şehirde görünüm olarak insandan hiçbir farkı bulunmayan bu robotları teşhis etmek hiç kolay olmayacaktır. ', '117 dakika', '1982', 'Harrison Ford - Rick Deckard\r\nRutger Hauer - Roy Batty\r\nSean Young - Rachael\r\nEdward James Olmos - Gaff\r\nDaryl Hannah - Pris\r\nWilliam Sanderson - J.F. Sebastian\r\nM. Emmet Walsh - Bryant\r\n'),
(20, 'Kingdom of Heaven', '7.3', 'https://www.imdb.com/title/tt0320661/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_kingdo', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/k-VUKvJ7vPw?si=qIMlz9LGzwWOLF7x\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/medias/nmedia/18/35/53/31/18425554.jpg', '\r\nFilm, Ortaçağ’da Kudüs’te geçen bir tarihi aksiyon olarak nitelendirilmektedir. Balian adında genç bir adam aslen demircilik yapmaktadır. Ailesini kaybetmiştir ve kader onun için bambaşka bir plan hazırlamaktadır. O yakında şövalye olacaktır. Ardından aşk kapıyı çalacak ve yüreğine ateş düşecektir. Bir prensese gönül ...\r\n', '144 dakika', '2005', 'Orlando Bloom - Balian de Ibelin\r\nEva Green - Sibylla\r\nLiam Neeson - Godfrey de Ibelin\r\nJeremy Irons - Tiberias\r\nEdward Norton - King Baldwin IV\r\nDavid Thewlis - Raynald de Chatillon\r\nMarton Csokas - Guy de Lusignan\r\nBrendan Gleeson - Reynald de Chatillon\r\nGhassan Massoud - Saladin\r\n'),
(21, 'Seven Samurai', '8.6', 'https://www.imdb.com/title/tt0047478/?ref_=nv_sr_srsg_1_tt_7_nm_0_in_0_q_seven%2520sam', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1XMJY0hYJEw?si=SEQlG2BAwZOmcu6g\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/img/a9/84/a98489bf5291aa3db26938f6aacc9c24.jpg', 'Yedi Samuray, haydutların saldırdığı fakir bir köyü korumaya çalışan samurayların hikayesini anlatıyor. Usta Samurai Kambei’nin cesareti ve fedakarlığına şahit bir grup köylü ondan sürekli olarak haydutlardan köylerini korumasını isterler. Kambei bu isteği herhangi bir çıkarı olmamasına rağmen kabul eder ve ilk olarak kısa süre sonra müridi olan genç samurai Katsushiro’yu, ardından da güç kullanmaya meraklı bir samurai olarak görünen, fakat sonradan bir çiftçinin oğlu olduğu ortaya çıkan Kikuchiyo’yu yanına alır.Takımına dört yeni samurai daha ekleyerek köyü savunmaya girişen Kambei köylüler tarafından heyacanla karşılanır,herkesin sevgisini kazanır; bir süre sonra onlara kendilerini savunmayı öğretmeye başlar. Bu arada haydutlar köyün sınırlarında dolaşmakta ve yeni saldırıları için uygun bir zaman kollamaktadırlar...', '207 dakika', '1954', 'Toshirō Mifune - Kikuchiyo\r\nTakashi Shimura - Kambei Shimada\r\nKeiko Tsushima - Shino\r\nYoshio Inaba - Gorobei Katayama\r\nSeiji Miyaguchi - Kyūzō\r\nDaisuke Katō - Heihachi Hayashida\r\nMinoru Chiaki - Shichirōji\r\nIsao Kimura - Katsushirō Okamoto\r\nSusumu Fujita - Rikichi\r\nKamatari Fujiwara - Manzo\r\n'),
(22, 'Harakiri', '', 'https://www.imdb.com/title/tt0056058/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_harakiri', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gfABwM-Ppng?si=CQQrmyoTnDCcWdB-\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img2.acsta.net/r_1920_1080/medias/nmedia/18/66/97/39/18965657.jpg', '1630 yılının Japonyası\'nda yaşlı bir samuray harakiri yapabileceği uygun bir yer bulabilmek için Iyi şehrine gelir. Onurlu bir şekilde yaşamını sonlandırmak isteyen bu adamın önündeki tek engel, toprak sahibi lordun huzurunda bu isteğini belirtip, kendisinden izin alabilmektir. Ancak bu esnada kendisinden önce bu taleple gelen genç bir samurayla karşılaşması işleri değiştirecektir. ', '133 dakika', '1962', 'Tatsuya Nakadai - Hanshirō Tsugumo\r\nAkira Ishihama - Motome Chijiiwa\r\nYoshio Inaba - Kōbei Tsujii\r\nIchirō Sugai - Jinai Chijiiwa\r\nNoboru Nakaya - Saitō Kageyu\r\nIsao Kimura - Miyamoto Owari\r\nFujio Suga - Matagoro Tsujii\r\n'),
(23, 'Sicario', '7.7', 'https://www.imdb.com/title/tt3397884/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_sicario', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Yfhu5JIxnZc?si=SAU0neSQo8JT4HXk\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img2.acsta.net/r_1920_1080/pictures/15/07/29/17/08/261485.jpg', '\r\n\r\nBaşrollerinde yıldız oyuncular Emily Blunt, Benicio Del Toro, Josh Brolin, Jeffrey Donovan ve Jon Bernthal\'in yer aldığı Sicario, ABD ve Meksika arasında bulunan kanunsuz sınır kenti Suarez\'de idealist bir FBI ajanı olan Kate ve özel operasyon kuvveti görevlilerinin uyuşturucu kartelleriyle mücadele etmek için görevlendirilmelerini konu alıyor. Sicario, oyunu kurallarına göre oynamayan suçlulara ulaşmak için sınırları zorlayan soluk soluğa bir operasyonun hikayesi. Sinematografik açıdan neredeyse kusursuz olan ve eleştirmenlerden tam not alan filmin yönetmenliğini Denis Villeneuve üstlenirken, senaryo koltuğunda Taylor Sheridan oturuyor.\r\n', '121 dakika', '2015', 'Emily Blunt - Kate Macer\r\nBenicio del Toro - Alejandro Gillick\r\nJosh Brolin - Matt Graver\r\nVictor Garber - Dave Jennings\r\nJon Bernthal - Ted\r\nBernardo Saracino - Enrique\r\nMaximiliano Hernández - Silvio\r\nManuel Garcia-Rulfo - Reggie\r\n'),
(24, 'Prisoners', '8.2', 'https://www.imdb.com/title/tt1392214/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_Prisoners', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ipqARUF38n0?si=Zouj_BZZ72-8vMht\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/pictures/210/280/21028038_20130813155654441.jpg', '\r\nTutsak, adaleti kendi elleriyle sağlamaya çalışan bir adamın hikayesini anlatıyor. Maccachusetts eyaletinin Brockton bölgesinde, Şükran Günü\'nü kutlamak için bir araya gelen Dovers ve Birches aileleri her şeyin yolunda gittiği bu yemek esnasında korkunç bir haberle altüst olurlar. Gecenin ilerleyen saatlerinde ailelerin iki ...\r\n', '153 dakika', '2013', 'Hugh Jackman - Keller Dover\r\nJake Gyllenhaal - Detective Loki\r\nViola Davis - Grace Dover\r\nMaria Bello - Nancy Birch\r\nTerrence Howard - Franklin Birch\r\nPaul Dano - Alex Jones\r\nMelissa Leo - Holly Jones\r\nDavid Dastmalchian - Cowan\r\n'),
(25, 'Pacific Rim', '6.9', 'https://www.imdb.com/title/tt1663662/?ref_=nv_sr_srsg_1_tt_8_nm_0_in_0_q_Pasific%2520Rim', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/5guMumPFBag?si=N7kqEtBMSzUIO0-w\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/pictures/210/081/21008109_20130524124818714.jpg', 'İnsanoğlunu yok olma tehlikesiyle karşı karşıya bırakan şey, ansızın denizin altından gelmeye başlayan Kaiju isimli yaratıklardır. Bu dehşet verici varlıklar dünyanın temel kaynaklarını harap ederken canlı nüfusunu da hızlıca yok etmeye başlarlar. Çaresiz insanlık Jaeger isimli devasa robotlar üreterek felaketi durdurmaya çalışır. Tüm talimatları iki pilottan alan Jaeger\'ler beyin gücüyle çalışan donanımlı ve güçlü robotlardır. Ne var ki ortada onların bile çözümleyemeceği katastrofik bir gidişat söz konusudur. Tüm çareler tükenmişken ortaya çıkan eski bir pilot ve stajyeri insanlığın son umudu olmaya çalışacaktır.', '131 dakika', '2013', 'Charlie Hunnam - Raleigh Becket\r\nRinko Kikuchi - Mako Mori\r\nIdris Elba - Stacker Pentecost\r\nCharlie Day - Dr. Newton Geiszler\r\nRoberto Jung - Hannibal Chau\r\nBurn Gorman - Dr. Hermann Gottlieb\r\nRon Perlman - Hannibal Chau (voice)\r\nMax Martini - Hercules Hansen\r\n'),
(26, 'Pan\'s labyrinth', '8.2', 'https://www.imdb.com/title/tt0457430/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_Pan%27s%2520', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/jVZRnnVSQ8k?si=ZJDRLmcNS9d7ydaH\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img2.acsta.net/r_1920_1080/img/c8/26/c826290b490206abb89b33ecbb25b851.jpg', '\r\n\r\nPan’ın Labirenti, fantastik bir dünyaya kaçan küçük bir kızın hikayesini anlatıyor. İspanya’da faşist iktidarın tüm vahşetinin gölgesinde yalnız bir kız çocuğu olan Ofelia, sadist eğilimleri olan babasının etrafındakilere yaptığı tüm eziyetleri bizzat gözlemlemektedir. Bu küçük kız çocuğunun gerçeklikten kaçabileceği tek yer kendi hayal gücüdür. Ofelia, gerçeklikte bulamadığı huzuru, hayallerinde aramaya başlayacaktır. Bu esnada vahşet ise tüm sertliğiyle Ofelia’nın çevresinde vuku bulmaya devam edecektir. Guillermo del Toro’nun gösterildiği sene Cannes’da dakikalarca ayakta alkışlanan yakın dönem başyapıtı, çocukların gözünden savaşın ne kadar sert bir fırtına olduğunu gözler önüne seriyor\r\n', '118 dakika', '2006', 'Ivana Baquero - Ofelia\r\nSergi López - Capitán Vidal\r\nMaribel Verdú - Mercedes\r\nDoug Jones - Fauno / Pale Man\r\nAlex Angulo - Doctor Ferreiro\r\nAriadna Gil - Carmen\r\nManolo Solo - Pedro\r\n'),
(27, 'Hellboy', '6.9', 'https://www.imdb.com/title/tt0167190/?ref_=nv_sr_srsg_0_tt_8_nm_0_in_0_q_Hellboy', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kA9vtXbbhVs?si=bi3rPy6NDRkapMcB\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 'https://tr.web.img4.acsta.net/r_1920_1080/medias/nmedia/18/35/16/60/18382392.jpg', '\r\n\r\nİkinci Dünya Savaşı\'nın son günlerinde Naziler, ölüm sebeplerini iyileştirmek üzere kara büyü kullanırlar. Bu sırada farkında olmadan bir iblis dünyaya getirirler. Müttefikler seremoninin gerçekleştirildiği yere baskın yaparlar. Ancak iblis henüz çağırılmıştır. Küçük Hellboy, büyüyüp yetişkin olduğunda kötülük yerine iyiliğe hizmet etmeye karar verir, kara büyü yapan Rasputin’den kurtulan Profesör Broom tarafından yetiştirilir. Dünyaya iyiliğin penceresinden bakan takım arkadaşları ile birlikte maceralar yaşayan Hellboy’un yapabileceklerinin gücü sınır tanımamaktadır. Deneysel olarak, istenmeden dünyaya gelişinin aslında bir anlamı vardır...\r\n', '122 dakika', '2004', 'Ron Perlman - Hellboy / Anung Un Rama\r\nSelma Blair - Liz Sherman\r\nDoug Jones - Abe Sapien\r\nJohn Hurt - Trevor Bruttenholm\r\nRupert Evans - FBI Agent John Myers\r\nJeffrey Tambor - Tom Manning\r\nKarel Roden - Karl Ruprecht Kroenen\r\n'),
(34, 'Blade II', '6.7', ' https://www.imdb.com/title/tt0187738/?ref_=nv_sr_srsg_6_tt_8_nm_0_in_0_q_blade%25202', ' <iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vAUB7dcUn8o?si=sNkH_eDTN8ADxZri\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', ' https://m.media-amazon.com/images/I/7157iZGU8sL._AC_SL1328_.jpg', 'Açıklma.....', '117 dakika', '2003', 'Kadir Deliceli'),
(35, 'Fantastic Mr. Fox', '7.9', ' https://www.imdb.com/title/tt0432283/?ref_=nv_sr_srsg_0_tt_7_nm_1_in_0_q_mr%2520fan', ' <iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/K_BzxFkkImI?si=hXhTEE4dEauVHJV6\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', ' https://tr.web.img4.acsta.net/r_1920_1080/pictures/20/12/13/00/55/4165684.png', ' Hikayenin kahramanı Mr. Fox isimli bir tilki. Mr. Fox ailesini beslemek için her akşam üç zengin çiftçiden tavuk, ördek ve hindi çalmaktadır. Sinirli çiftçiler tilkiden artık bıkmışlardır ve onu öldürmek için ellerinden gelen herşeyi yapmaktadırlar. Sonunda yakalanan tilki, çiftçilerden daha zeki davranarak yakalandığı yerden aç kalmamak için çıkmaya çalışır. ', '87 dakika', '2009', 'Oyuncu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `izlenme`
--

CREATE TABLE `izlenme` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `izlenme`
--

INSERT INTO `izlenme` (`id`, `film_id`, `kullanici_id`) VALUES
(1, 1, 2),
(3, 4, 1),
(4, 1, 1),
(5, 8, 1),
(6, 6, 1),
(7, 2, 2),
(8, 6, 2),
(9, 8, 2),
(10, 28, 1),
(11, 20, 1),
(12, 21, 1),
(13, 19, 1),
(14, 11, 1),
(15, 2, 1),
(16, 29, 1),
(17, 27, 1),
(18, 28, 2),
(19, 29, 2),
(20, 3, 9),
(22, 1, 9),
(23, 8, 9),
(24, 1, 10),
(25, 4, 10),
(26, 6, 10),
(29, 4, 11),
(31, 7, 13),
(32, 13, 13),
(33, 1, 13),
(34, 3, 14),
(35, 6, 14),
(36, 13, 14),
(37, 8, 14),
(38, 7, 14),
(39, 1, 15),
(43, 12, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kaydet`
--

CREATE TABLE `kaydet` (
  `kayıt_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kaydet`
--

INSERT INTO `kaydet` (`kayıt_id`, `film_id`, `kullanici_id`) VALUES
(1, 1, 2),
(3, 3, 1),
(4, 2, 1),
(5, 8, 1),
(6, 7, 1),
(7, 6, 1),
(8, 3, 2),
(9, 4, 2),
(10, 7, 2),
(11, 8, 2),
(12, 27, 1),
(13, 25, 1),
(14, 24, 1),
(15, 21, 1),
(16, 22, 1),
(17, 23, 1),
(18, 14, 1),
(19, 16, 1),
(20, 12, 1),
(21, 11, 1),
(22, 13, 1),
(23, 29, 1),
(24, 28, 1),
(25, 28, 2),
(26, 26, 2),
(27, 27, 2),
(28, 3, 9),
(29, 4, 9),
(30, 6, 9),
(31, 1, 9),
(32, 2, 9),
(33, 1, 10),
(34, 3, 10),
(35, 13, 10),
(36, 1, 11),
(37, 2, 11),
(38, 3, 11),
(39, 6, 11),
(40, 1, 13),
(41, 2, 13),
(42, 4, 13),
(43, 12, 13),
(44, 11, 13),
(45, 8, 13),
(46, 6, 13),
(47, 2, 14),
(48, 4, 14),
(49, 6, 14),
(52, 11, 14),
(53, 7, 14),
(54, 1, 15),
(55, 3, 15),
(56, 13, 15),
(57, 12, 15),
(58, 11, 15),
(59, 7, 15),
(60, 8, 15);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `id` int(11) NOT NULL,
  `kullaniciadi` varchar(100) NOT NULL,
  `sifre` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`id`, `kullaniciadi`, `sifre`) VALUES
(1, 'kadir', '$2y$10$S9DGBBVWI/9gkMdcj.7hRuW.6dXIf4yleU6XwTnt8pv7ExZdvHfcK'),
(2, 'erdem', '$2y$10$bHW1bOR3cHSyUVAUR25dy.6xA7IXszKZXHxi9ThoJMdmUrthuuZPW'),
(3, 'kerem', '$2y$10$I.BpXo5I5rQqlTQS1gC6bua/Gc3bd514eARbvKJV44tmji3z1bCH.'),
(16, 'feyzanur', '$2y$10$fO3SINwCBiUGX6s5XV22YuGrrFQiifTuy2./IAJxkzNrWMwU.LTiW');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mypuan`
--

CREATE TABLE `mypuan` (
  `kullanici_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `puan` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `mypuan`
--

INSERT INTO `mypuan` (`kullanici_id`, `film_id`, `puan`) VALUES
(3, 2, 6),
(3, 1, 9),
(1, 4, 8),
(1, 2, 9),
(2, 1, 6),
(1, 29, 9),
(9, 1, 7),
(9, 4, 8),
(10, 2, 7),
(10, 30, 6),
(11, 2, 7),
(11, 31, 8),
(13, 2, 9),
(13, 32, 7),
(14, 2, 9),
(15, 2, 9),
(16, 13, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `profilyolu`
--

CREATE TABLE `profilyolu` (
  `id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `resim_yolu` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `profilyolu`
--

INSERT INTO `profilyolu` (`id`, `kullanici_id`, `resim_yolu`) VALUES
(1, 2, 'profilResimlari/386f71f9-541d-4289-b75c-db2c669a1842.png'),
(2, 3, 'profilResimlari/varsayilan_avatar.png'),
(3, 16, 'profilResimlari/sinop.jpeg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorum`
--

CREATE TABLE `yorum` (
  `yorum_id` int(11) NOT NULL,
  `kullanıcı_adı` varchar(50) NOT NULL,
  `film_id` int(11) NOT NULL,
  `yorum` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tarih` datetime DEFAULT NULL,
  `yorum_durum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `yorum`
--

INSERT INTO `yorum` (`yorum_id`, `kullanıcı_adı`, `film_id`, `yorum`, `tarih`, `yorum_durum`) VALUES
(26, 'kadir', 2, '12345', '2025-05-22 17:37:09', 'yorum bu tarihte Güncellendi.'),
(27, 'erdem', 2, 'erdeeem', '2025-05-22 17:38:14', 'yorum bu tarihte Güncellendi.'),
(28, 'erdem', 1, 'The Gorge Çok iyi', '2025-05-22 18:42:45', 'yorum bu tarihte yapıldı.'),
(29, 'erdem', 2, 'yeni yorum', '2025-05-23 19:57:11', 'yorum bu tarihte yapıldı.'),
(30, 'erdem', 4, 'Kaptan Amerika Çok iyi\r\n', '2025-05-24 13:44:31', 'yorum bu tarihte yapıldı.'),
(31, 'kadir', 4, 'Kaptan Amerikayı gerçekten çok beğendim', '2025-05-24 14:56:28', 'yorum bu tarihte yapıldı.'),
(32, 'kadir', 29, 'Çok  iyi', '2025-05-24 15:38:32', 'yorum bu tarihte yapıldı.'),
(33, 'erdem', 27, 'Film Çok Güzeldi\r\n', '2025-05-27 14:34:23', 'yorum bu tarihte yapıldı.'),
(37, 'kadir12', 2, 'film çok güzeldi', '2025-05-29 20:18:53', 'yorum bu tarihte yapıldı.'),
(40, 'kadir1', 34, 'Film çok güzelddiiiiiii', '2025-05-29 20:30:23', 'yorum bu tarihte yapıldı.'),
(42, 'feyzanur', 13, 'film çok iyi\r\n', '2025-06-24 18:13:18', 'yorum bu tarihte yapıldı.');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `begeni`
--
ALTER TABLE `begeni`
  ADD PRIMARY KEY (`begeni_id`);

--
-- Tablo için indeksler `filmler`
--
ALTER TABLE `filmler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `izlenme`
--
ALTER TABLE `izlenme`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kaydet`
--
ALTER TABLE `kaydet`
  ADD PRIMARY KEY (`kayıt_id`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `profilyolu`
--
ALTER TABLE `profilyolu`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `yorum`
--
ALTER TABLE `yorum`
  ADD PRIMARY KEY (`yorum_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `begeni`
--
ALTER TABLE `begeni`
  MODIFY `begeni_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Tablo için AUTO_INCREMENT değeri `filmler`
--
ALTER TABLE `filmler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Tablo için AUTO_INCREMENT değeri `izlenme`
--
ALTER TABLE `izlenme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Tablo için AUTO_INCREMENT değeri `kaydet`
--
ALTER TABLE `kaydet`
  MODIFY `kayıt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `profilyolu`
--
ALTER TABLE `profilyolu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `yorum`
--
ALTER TABLE `yorum`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
