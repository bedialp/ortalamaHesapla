import 'package:flutter/material.dart';

import '../constans/app_constans.dart';
import '../helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  const KrediDropdownWidget({Key? key, required this.onKrediSecildi})
      : super(key: key);
  final Function onKrediSecildi;

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double? secilenKrediDegeri = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton(
        items: DataHelper.tumDerslerinKredileri(),
        onChanged: ((deger) {
          setState(() {
            secilenKrediDegeri = deger as double?;
            widget.onKrediSecildi(deger);
          });
        }),
        value: secilenKrediDegeri,
        underline: Container(),
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
      ),
    );
  }
}
