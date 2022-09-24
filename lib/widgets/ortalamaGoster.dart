// ignore_for_file: file_names

import 'package:dinamik_not_ortalama_yeni/constans/app_constans.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  const OrtalamaGoster(
      {Key? key, required this.ortalama, required this.dersSayisi})
      : super(key: key);
  final double ortalama;
  final int dersSayisi;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seciniz',
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
        Text(
          ortalama >= 0 ? ortalama.toStringAsFixed(2) : '0.0',
          style: Sabitler.ortalamaStyle,
        ),
        const Text(
          'Ortalama',
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
      ],
    );
  }
}
