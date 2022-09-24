import 'package:flutter/material.dart';

import '../constans/app_constans.dart';
import '../helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  const HarfDropdownWidget({Key? key, required this.onHarfSecildi})
      : super(key: key);
  final Function onHarfSecildi;

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double? secilenHarfDegeri = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton(
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: ((deger) {
          setState(() {
            secilenHarfDegeri = deger as double?;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        }),
        value: secilenHarfDegeri,
        underline: Container(),
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
      ),
    );
  }
}
