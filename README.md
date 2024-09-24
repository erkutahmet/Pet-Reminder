---

# 🐾 Pet Reminder App

Geliştirmiş olduğum **Pet Reminder**, evcil hayvan sahiplerine özel bir mobil uygulamadır. Bu uygulama sayesinde kullanıcılar, hayvan dostlarıyla ilgili hatırlatmalar oluşturabiliyor, veterinerlerle kolayca iletişim kurabiliyor ve gündemdeki haberleri takip edebiliyor. Ayrıca, kişisel ayarları kullanarak kendi tercihlerine göre özelleştirme imkanı sunuyor. Uygulama, iOS platformu için geliştirilmiş olup Swift ve UIKit framework'ü kullanılarak hazırlandı.

## 🚀 Özellikler

### 🗓️ Hatırlatıcı Oluşturma
Evcil hayvanınızın beslenme saatleri, aşıları ya da veteriner ziyaretleri gibi önemli görevleri takip edebilmeniz için kullanıcı dostu bir hatırlatıcı sistemi sunuyor.

### 📰 Güncel Haberler
Uygulamam, internetten hayvanlarla ilgili en son haberleri otomatik olarak çekerek ana sayfada kullanıcıya gösteriyor. Böylece, evcil hayvanınızın günlük bakımını yaparken en son gelişmelerden haberdar olabiliyorsunuz.

### 🐕‍🦺 Veterinerlerle Mesajlaşma
Veterinerlerle birebir mesajlaşma özelliği sayesinde, evcil hayvanınızla ilgili sorularınızı ve acil durumları hızlı bir şekilde veterinerinize iletebiliyorsunuz. Bu özellik, veteriner randevuları arasında geçen sürede güvenli ve hızlı iletişim sağlıyor.

### ⚙️ Kişisel Ayarlar
Kullanıcılar, uygulama içerisindeki kişisel ayarları kolayca değiştirip, uygulamayı kendi ihtiyaçlarına göre özelleştirebiliyorlar.

### 📱 Kullanıcı Deneyimi
Uygulama, sade ve şık tasarımıyla dikkat çekiyor. Kullanıcı arayüzü, kolay anlaşılır bir navigasyon sunarak her türlü kullanıcı için rahat bir deneyim sağlıyor.

## 🛠️ Kullanılan Teknolojiler

Pet Reminder uygulamasını geliştirmek için kullandığım başlıca teknolojiler ve araçlar:

- **Swift** 🍎
- **UIKit** 📱
- **Alamofire** 🌐
- **FirebaseAuth** 🔐
- **FirebaseFirestore** 💾
- **Message Kit** ✉️
- **JSON-Server (Fake Backend)** 🗄️
- **Cocoapods** 📦

## 🔧 Kurulum

Projeyi kendi sisteminizde çalıştırmak için şu adımları izleyiniz:

1. Bu repoyu klonlamak için:
   ```bash
   git clone https://github.com/erkutahmet/Pet-Reminder.git
   ```

2. Gerekli bağımlılıkları yüklemek için:
   ```bash
   cd Pet-Reminder/app
   pod install
   ```

3. Xcode ile projeyi açın:
   ```bash
   open PetReminder.xcworkspace
   ```

4. Local olarak json-server çalıştırmak için:
   ```bash
   cd Pet-Reminder/app/News
   npm run start:server

5. Simülatör veya fiziksel cihazlarda çalıştırabilirsiniz.

## 🌟 Gelecekteki Planlar

- **Hatırlatıcı sistemini geliştirmek**: Hatırlatma seçeneklerini daha da özelleştirilebilir hale getirmek istiyorum.
- **Tasarım iyileştirmeleri**: Kullanıcı deneyimini geliştirmek için daha modern ve kullanıcı dostu bir arayüz tasarlamayı planlıyorum.
- **Push bildirimleri eklemek**: Hatırlatıcılar için anlık bildirimlerle kullanıcıları bilgilendirmeyi hedefliyorum.
- **Yeni özellikler**: Evcil hayvan sahiplerinin hayatını kolaylaştıracak yeni fonksiyonlar eklemeyi düşünüyorum.

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyorum! Eğer bu projeye katkıda bulunmak isterseniz, lütfen bir "pull request" açın ya da bir "issue" oluşturun. Geri bildiriminiz benim için çok değerli.

---
