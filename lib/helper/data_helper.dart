import 'package:dinamik_not_ortalama_yeni/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    for (var element in tumEklenenDersler) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    }
    return toplamNot / toplamKredi;
  }

  static List<String> _tumDerrslerinHarfleri() {
    return [
      'AA',
      'BA',
      'BB',
      'CB',
      'CC',
      'DC',
      'DD',
      'FD',
      'FF',
    ];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerrslerinHarfleri()
        .map(
          (e) => DropdownMenuItem(
            value: _harfiNotaCevir(e),
            child: Text(e),
          ),
        )
        .toList();
  }

  static List _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<Object>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map(
          (e) => DropdownMenuItem(
            value: e.toDouble(),
            child: Text(e.toString()),
          ),
        )
        .toList();
  }
}
