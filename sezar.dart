class Sezar {
  late final int a;
  late final List<String> b;
  final List<String> yeni_text = [];
  late int b1;
  late final int alfabe_uzunlugu; 

  Sezar(a, this.b, alfabe_uzunlugu) {
    if(a > 0) {
      this.a = a;
    } else {
      print('$a değeri sıfırdan küçük olmamalıdır');
      return;
    }
    this.alfabe_uzunlugu = alfabe_uzunlugu * 2;
  }

  String encode({required String? text}) {
    for (int i = 0; i < text!.length; i++) {
      if(b.contains(text[i])) {
        int c = b.indexOf(text[i]) + a;
        yeni_text.add(b[c % alfabe_uzunlugu]);
      } else {
        yeni_text.add(text[i]);
      }
    }
    
    return yeni_text.join('');
  }

  String decode({required String? text}) {
    for (int i = 0; i < text!.length; i++) {
      if(b.contains(text[i])) {
        int c = b.indexOf(text[i]) - a;
        yeni_text.add(b[c % alfabe_uzunlugu]);
      } else {
        yeni_text.add(text[i]);
      }
    }
    
    return yeni_text.join('');
  }
}