import 'package:dinamik_not_ortalama_yeni/constans/app_constans.dart';
import 'package:dinamik_not_ortalama_yeni/helper/data_helper.dart';
import 'package:dinamik_not_ortalama_yeni/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  const DersListesi({Key? key, required this.onDismiss}) : super(key: key);
  final Function onDismiss;

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: DataHelper.tumEklenenDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} Kredi, Not Degeri ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            })
        : const Center(
            child: Text(
            'Lütfen Ders Ekleyin',
            style: Sabitler.baslikStyle,
          ));
  }
}
