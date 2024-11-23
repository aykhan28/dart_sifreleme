import 'sezar.dart';
import 'affine.dart';
import 'dart:io';
import 'dart:async';

const String kilavuz = ''' \t \t ----ŞİFRELEME DOSYASININ ÇALIŞMA MANTIĞI----
Not: Türkçe kısmı daha tamamlanmadı..

sifreleme.dart -{şifreleme_algoritması} {algoritmanın_parametreleri} -{yapılacak_işlem} {alfabe_seçimi}
daha sonrasında metinimizi giriyoruz

Şifreleme Algoritması:
  -s   Sezar Şifreleme Algoritması
  -a   Affine Şifreleme Algoritması
  
Algoritma Parametreleri
  Sezar için bir tane int değer
  Affine için iki tane int değer, birincisi alfabedeki harflerin sayısıyla asal olmalı
  
Yapılacak İşlem
  -e   Şifreleme
  -d   Şifre Çözme
  
Alfabe Seçimi
  29   Türk Alfabesi
  26   İngiliz Alfabesi''';

class Secimler {
  void secimlerin_tespiti(var args, List<String> alfabe_sec) async {
    if (!args.isEmpty) {
      String? text = stdin.readLineSync();
      String text_uzantisi;

      if(args.length > 4){
        List<String> uzanti_tespiti = [];
        for(int i = 4; i > 0; i--) {
          uzanti_tespiti.add(text![text.length - i]);
        }
        text_uzantisi = uzanti_tespiti.join('');
      } else {
        text_uzantisi = "";
      }

      // Şifreleme Algoritması Seçimi
      switch (args[0]) {
        case '-s':
          print('-- Sezar Şifreleme Algoritması --');

          if(text_uzantisi == '.txt') {
            String metin = await dosyadaki_metin(text);
            sezar_secimi(args, alfabe_sec, metin);
          } else {
            print('Girdiğiniz Metin: $text');
            sezar_secimi(args, alfabe_sec, text);
          }
          break;

        case '-a':
          print('-- Affine Şifreleme Algoritması --');

          if(text_uzantisi == 'txt') {
            String metin = await dosyadaki_metin(text);
            affine_secimi(args, alfabe_sec, metin);
          } else {
            print('Girdiğiniz Metin: $text');
            affine_secimi(args, alfabe_sec, text);
          }
          break;

        default:
          print('Şifreleme algoritması yanlış seçildi');
      }
    } else {
      print(kilavuz);
    }
  }

  // Encode ve Decode seçimleri için
  void sezar_secimi(args, alfabe, text) {
    Sezar a1 = Sezar(int.parse(args[1]), alfabe, int.parse(args[3]));

    if (args[2] == '-e') {
      print('Şifrelenmiş Metin: ${a1.encode(text: text)}');
    } else if (args[2] == '-d') {
      print('Çözülmüş Metin: ${a1.decode(text: text)}');
    } else {
      print("Sezar algoritmasının ${args[2]} işlemi bulunmamaktadır!");
    }
  }

  void affine_secimi(args, alfabe, text) {
    Affine a1 = Affine(int.parse(args[1]), int.parse(args[2]), alfabe, int.parse(args[4]));

    if (args[3] == '-e') {
      print('Şifrelenmiş Metin: ${a1.encode(text: text)}');
    } else if (args[3] == '-d') {
      print('Çözülmüş Metin: ${a1.decode(text: text)}');
    } else {
      print("Sezar algoritmasının ${args[3]} işlemi bulunmamaktadır!");
    }
  }

  // Girdinin dosya ismi olma durumu
  Future<String> dosyadaki_metin(String? text) async{
    try {
      final dosya = File(text!);
      final metin = await dosya.readAsString();
      return metin;
    } catch (e) {
      print('Dosya bulunamadı: $e');
      return "";
    }
  }
}