import 'alfabe.dart';
import 'secimler.dart';

void main(List<String> args) {
  String alfabe_uzunlugu = args[args.length - 1];
  Alfabe alfabe_secimi = Alfabe(alfabe_uzunlugu);
  List<String> alfabe_sec = alfabe_secimi.alfabe_sec();

  Secimler s1 = Secimler();
  s1.secimlerin_tespiti(args, alfabe_sec);
}