class Affine {
  late final int a;
  late final int a1;
  late final List<String> b;
  final List<String> yeni_text = [];
  late int b1;
  late final int alfabe_uzunlugu;

  Affine(int a, this.a1, this.b, this.alfabe_uzunlugu){
    if(alfabe_uzunlugu % a != 0) {
      this.a = a;
    } else {
      print('Girdiğiniz değer $alfabe_uzunlugu ile asal olmalıdır!');
      return;
    }
  }

  String encode({required String? text}) {
    for (int i = 0; i < text!.length; i++) {
      if(b.contains(text[i])) {
        int c = a * b.indexOf(text[i]) + a1;
        yeni_text.add(b[c % alfabe_uzunlugu]);
      } else {
        yeni_text.add(text[i]);
      }
    }
    
    return yeni_text.join('');
  }

  String decode({required String? text}) {
    int? ters_a = tersiniAlma(a, alfabe_uzunlugu);

    for (int i = 0; i < text!.length; i++) {
      if(b.contains(text[i])) {
        int c = ters_a! * (b.indexOf(text[i]) - a1) % alfabe_uzunlugu + alfabe_uzunlugu;
        yeni_text.add(b[c % alfabe_uzunlugu]);
      } else {
        yeni_text.add(text[i]);
      }
    }
    
    return yeni_text.join('');
  }

  int? tersiniAlma(int a, int b) {
    for (int i = 1; i < b; i++) {
      if((a * i) % b == 1) {
        return i;
      }
    }
    return -1;
  }
}