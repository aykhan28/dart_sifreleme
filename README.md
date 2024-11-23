# Dart Şifreleme Aracı 🔐

**Dart Şifreleme Aracı**, metinleri şifrelemek ve çözmek için geliştirilen basit ama güçlü bir komut satırı uygulamasıdır. **Sezar Şifreleme** ve **Affine Şifreleme** algoritmalarını destekler. Uygulama, hem **Türkçe** hem de **İngilizce alfabeler** ile çalışabilir ve metni doğrudan giriş olarak alabilir ya da bir dosyadan okuyabilir.

---

## Özellikler ✨

- **Sezar Şifreleme** (`-s`): Harfleri belirli bir kaydırma miktarıyla şifreler.
- **Affine Şifreleme** (`-a`): Daha gelişmiş bir lineer şifreleme algoritmasıdır.
- **Alfabe Desteği**:
  - Türkçe Alfabe (29 harf, `-29`)
  - İngilizce Alfabe (26 harf, `-26`)
- **Metin ve Dosya Desteği**:
  - Girdi olarak bir dosya adı veya doğrudan bir metin kullanabilirsiniz.

---

## Kullanım 💻

Komut formatı:

```bash
dart main.dart -{şifreleme_algoritması} {algoritma_parametreleri} -{işlem} {alfabe_seçimi}
```

### Şifreleme Algoritmaları:
- `-s`: Sezar Şifreleme Algoritması
- `-a`: Affine Şifreleme Algoritması

### Algoritma Parametreleri:
- **Sezar**: Bir tam sayı (örn. `3`)
- **Affine**: İki tam sayı, birincisi alfabedeki harf sayısıyla asal olmalı (örn. `5 8`)

### İşlem:
- `-e`: Şifreleme
- `-d`: Şifre çözme

### Alfabe Seçimi:
- `29`: Türk Alfabesi
- `26`: İngilizce Alfabesi

---

## Örnekler 📚

### 1. Doğrudan Metin Şifreleme (Sezar):
```bash
dart main.dart -s 3 -e 29
Metin: merhaba
```

Çıktı:
```
Şifrelenmiş Metin: phujädf
```

### 2. Dosyadan Şifreleme (Affine):
```bash
dart main.dart -a 5 8 -e 26
deneme.txt
```

`deneme.txt` içeriği:
```
hello world
```

Çıktı:
```
Şifrelenmiş Metin: mjqqt btwqi
```

---

## Gereksinimler ⚙️

- Dart SDK (`>=2.17.0`)
- Geliştirme ortamınızda `dart` komutunun çalışır durumda olması

---

## Proje Yapısı 📂

- **main.dart**: Uygulamanın giriş noktası.
- **secimler.dart**: Komut argümanlarını işleyen ve algoritmaları yöneten sınıf.
- **sezar.dart**: Sezar Şifreleme algoritmasının implementasyonu.
- **affine.dart**: Affine Şifreleme algoritmasının implementasyonu.
- **alfabe.dart**: Türkçe ve İngilizce alfabe tanımları.

---

## Katkı Sağlama 🤝

Her türlü geri bildiriminizi ve katkılarınızı bekliyoruz! Hata bildirimleri, öneriler ve yeni özellik talepleri için lütfen bir **issue** oluşturun veya bir **pull request** gönderin. 🎉

---

## Lisans 📜

Bu proje [MIT Lisansı](https://opensource.org/licenses/MIT) ile lisanslanmıştır.
