# Film İnceleme Sitesi – Kubernetes ve CI/CD Final Projesi

## Bartın Üniversitesi

### Bilgisayar Mühendisliği Bölümü

### Bulut Bilişim Dersi Final Projesi

---

# Proje Hakkında

Bu projede daha önce geliştirilmiş olan PHP tabanlı film inceleme sitesi Docker container yapısına dönüştürülmüş ve Kubernetes ortamında çalıştırılmıştır. Proje kapsamında uygulama yüksek erişilebilirlik, ölçeklenebilirlik ve sürdürülebilir dağıtım mantığıyla yapılandırılmıştır.

Sistem Kubernetes üzerinde Deployment, Service, Persistent Volume, Persistent Volume Claim ve NetworkPolicy kullanılarak çalıştırılmıştır. Ayrıca Jenkins tabanlı bir CI/CD pipeline kurulmuş, GitHub webhook mekanizması ile otomatik deployment süreci gerçekleştirilmiştir.

Proje boyunca amaç; klasik bir web uygulamasını modern bulut teknolojileri kullanarak container tabanlı bir mimariye taşımak ve otomatik dağıtım süreçlerini uygulamalı olarak gerçekleştirmektir.

---

# Kullanılan Teknolojiler

* Docker
* Kubernetes
* Jenkins
* GitHub Webhook
* Ngrok
* PHP
* MySQL
* Docker Hub
* Ubuntu Linux

---

# Uygulama Mimarisi

Projede temel olarak iki ana container bulunmaktadır:

* Film sitesinin çalıştığı PHP Web container’ı
* Veritabanı işlemlerini yöneten MySQL container’ı

Kullanıcı web sitesine eriştiğinde istekler Kubernetes Service üzerinden ilgili Pod’lara yönlendirilir. Film bilgileri, kullanıcı yorumları ve diğer veriler MySQL veritabanında tutulmaktadır.

Uygulama container mantığıyla çalıştığı için sistem farklı ortamlara kolay şekilde taşınabilmektedir.

---

# Kubernetes Mimarisi

Projede Kubernetes üzerinde aşağıdaki bileşenler kullanılmıştır:

## Deployment

Deployment yapısı ile uygulamanın belirli sayıda Pod ile çalışması sağlanmıştır. Sistem istenildiğinde kolayca ölçeklenebilmektedir.

Örnek olarak:

* film-web deployment
* film-db deployment

kullanılmıştır.

Deployment sayesinde:

* Otomatik Pod yönetimi
* Rolling update
* Rollback işlemleri
* Replica kontrolü

gerçekleştirilmiştir.

---

## Service

Kubernetes Service yapısı ile Pod’ların dış dünyaya açılması sağlanmıştır.

Projede:

* Web uygulaması için NodePort Service
* Veritabanı için ClusterIP Service

kullanılmıştır.

Bu yapı sayesinde kullanıcılar web uygulamasına tarayıcı üzerinden erişebilmektedir.

---

## Persistent Volume ve PVC

MySQL verilerinin Pod silinse bile kaybolmaması amacıyla Persistent Volume ve Persistent Volume Claim kullanılmıştır.

Bu yapı sayesinde:

* Veriler kalıcı olarak saklanmıştır
* Container yeniden başlasa bile veriler korunmuştur

Özellikle veritabanı uygulamalarında veri kaybını önlemek için bu yapı büyük önem taşımaktadır.

---

## NetworkPolicy

Güvenlik amacıyla Kubernetes NetworkPolicy kullanılmıştır.

Bu politika sayesinde:

* Sadece gerekli Pod’ların veritabanına erişmesine izin verilmiştir
* Yetkisiz erişimler sınırlandırılmıştır

Böylece Kubernetes ağı içerisinde daha güvenli bir yapı oluşturulmuştur.

---

# Docker Yapısı

Uygulama için özel bir Dockerfile hazırlanmıştır.

Docker image oluşturulduktan sonra Docker Hub üzerine yüklenmiştir.

Bu yapı sayesinde Kubernetes cluster içerisindeki Pod’lar image’ı Docker Hub üzerinden çekerek çalıştırabilmektedir.

---

# CI/CD Pipeline Süreci

Projede Jenkins kullanılarak otomatik CI/CD pipeline sistemi kurulmuştur.

Süreç şu şekilde çalışmaktadır:

1. Proje GitHub repository’sine push edilir
2. GitHub webhook Jenkins’i tetikler
3. Jenkins pipeline otomatik olarak çalışır
4. Yeni Docker image oluşturulur
5. Docker Hub’a gönderilir
6. Kubernetes deployment güncellenir
7. Yeni versiyon sistem üzerinde çalışmaya başlar

Bu yapı sayesinde manuel deployment ihtiyacı azaltılmıştır.

---

# Jenkins ve Ngrok Kullanımı

Local ortamda çalışan Jenkins’in GitHub tarafından erişilebilir olması için Ngrok kullanılmıştır.

Ngrok ile Jenkins servisi dış dünyaya açılmış ve webhook bağlantısı kurulmuştur.

```bash
ngrok http 30080
```

Daha sonra oluşan public URL GitHub webhook kısmına eklenmiştir.

---

# Rolling Update İşlemi

Deployment güncellemesi sırasında Kubernetes rolling update mekanizması kullanılmıştır.

Bu işlem sayesinde:

* Sistem tamamen kapanmadan güncelleme yapılmıştır
* Yeni Pod’lar çalışırken eski Pod’lar kontrollü şekilde kapatılmıştır

```bash
kubectl set image deployment/film-web film-web=kadir57/film-site:v2
```

---

# Rollback İşlemi

Hatalı bir güncelleme durumunda sistem önceki sürüme döndürülebilmektedir.

Örnek rollback işlemi:

```bash
kubectl rollout undo deployment/film-web
```

Bu özellik Kubernetes’in en önemli avantajlarından biridir.

---

# Ölçekleme (Scaling)

Projede uygulamanın yük altında daha stabil çalışması için scaling işlemleri uygulanmıştır.

Örnek:

```bash
kubectl scale deployment film-web --replicas=3
```

Bu işlem sonrası uygulama birden fazla Pod ile çalıştırılmıştır.

---

# Sistem Mimarisi

Projenin genel çalışma yapısı aşağıdaki gibidir:

GitHub → Jenkins → Docker Hub → Kubernetes Cluster

Bu mimari sayesinde:

* Kod değişiklikleri otomatik dağıtılmıştır
* Süreçler hızlandırılmıştır
* Daha sürdürülebilir bir yapı oluşturulmuştur

---

# Projede Karşılaşılan Problemler

Proje geliştirme sürecinde bazı problemler ile karşılaşılmıştır.

Bunlardan bazıları:

* Jenkins webhook bağlantı problemleri
* NodePort çakışmaları
* Kubernetes servis erişim sorunları
* Persistent Volume bağlantı problemleri
* Docker image güncelleme hataları

Bu problemler log inceleme ve Kubernetes komutları kullanılarak çözülmüştür.

---

# Kazanımlar

Bu proje sayesinde:

* Docker container mantığı öğrenildi
* Kubernetes temel bileşenleri uygulamalı şekilde kullanıldı
* CI/CD süreçleri deneyimlendi
* Jenkins pipeline yapısı kuruldu
* Rolling update ve rollback işlemleri gerçekleştirildi
* Bulut bilişim mimarileri hakkında pratik kazanıldı

Ayrıca gerçek bir uygulamanın Kubernetes ortamına taşınma süreci deneyimlenmiş oldu.

---

# Repository İçeriği

Repository içerisinde aşağıdaki dosyalar bulunmaktadır:

* Dockerfile
* Jenkinsfile
* Kubernetes manifest dosyaları
* PHP uygulama dosyaları
* SQL veritabanı dosyası
* README.md

---

# Sonuç

Bu projede klasik bir web uygulaması modern container teknolojileri kullanılarak Kubernetes ortamına taşınmıştır. Jenkins destekli CI/CD pipeline sistemi ile uygulamanın otomatik dağıtımı sağlanmıştır.

Proje kapsamında Deployment, Service, Persistent Volume, PVC, NetworkPolicy, scaling, rolling update ve rollback işlemleri başarıyla uygulanmıştır.

Bulut bilişim teknolojilerinin gerçek kullanım senaryoları uygulamalı olarak deneyimlenmiş ve modern yazılım dağıtım süreçleri öğrenilmiştir.
