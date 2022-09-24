import 'package:dinamik_not_ortalama_yeni/widgets/ortalamaHesaplaPage.dart';
import 'package:flutter/material.dart';
import 'constans/app_constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const OrtalamaHesapla(),
    );
  }
}
