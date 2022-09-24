import 'package:flutter/material.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.pink;
  static const String baslikTest = 'Ortalama Hesapla';
  /* static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  ); */
  static const TextStyle baslikStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
  static const TextStyle ortalamaGosterBodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );
  static const TextStyle ortalamaStyle = TextStyle(
    fontSize: 52,
    fontWeight: FontWeight.w800,
    color: anaRenk,
  );
  static BorderRadius borderRadius = BorderRadius.circular(16);
  static const dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
