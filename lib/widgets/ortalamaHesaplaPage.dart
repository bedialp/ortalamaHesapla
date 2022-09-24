// ignore_for_file: file_names, avoid_print

import 'package:dinamik_not_ortalama_yeni/helper/data_helper.dart';
import 'package:dinamik_not_ortalama_yeni/model/ders.dart';
import 'package:dinamik_not_ortalama_yeni/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalama_yeni/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_not_ortalama_yeni/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_not_ortalama_yeni/widgets/ortalamaGoster.dart';
import 'package:flutter/material.dart';

import '../constans/app_constans.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesapla> createState() => _OrtalamaHesaplaState();
}

double? secilenKrediDegeri = 1.0;
double? secilenHarfDegeri = 4;
String girilenDersAdi = '';

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            Sabitler.baslikTest,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    ortalama: DataHelper.ortalamaHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length),
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onDismiss: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropdownWidget(onHarfSecildi: (harf) {
                    secilenHarfDegeri = harf;
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdownWidget(
                    onKrediSecildi: (kredi) {
                      secilenKrediDegeri = kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Sabitler.anaRenk,
                  size: 30,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return 'ders adını giriniz ';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade200.withOpacity(0.3),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri!,
          krediDegeri: secilenKrediDegeri!);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.tumEklenenDersler);
      print(DataHelper.ortalamaHesapla());
      setState(() {});
    }
  }
}
