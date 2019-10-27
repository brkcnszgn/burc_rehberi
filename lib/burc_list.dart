import 'dart:ui';

import 'package:burc_rehberi/utils/Strings.dart';
import 'package:flutter/material.dart';

import 'models/burcModel.dart';

class BurcListesi extends StatelessWidget {
 static List<BurcModel> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = readyToDataList();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Burc Rehberi",style: TextStyle(color: Colors.white),),
      ),
      body: readyToList(),
    );
  }

  List<BurcModel> readyToDataList() {
    List<BurcModel> allBurc = [];
    /*
    toplam 12 burcumuz bulunmakta bu yuzden elle yazdigimiz listeleyi for ile donuyoruz
    Strings icerisinde adi tarihi ve genel ozellikleri alip buyuk kucuk images'leri ekliyoruz
    * */
    for (int i = 0; i < 12; i++) {
      String littleImage = Strings.BURC_ADLARI[i].toLowerCase() +
          "${i + 1}.png"; //Burada Koc -> koc @a cevrildi sonuna da +1 eklendi imagesdeki resimler icin
      String bigImage = Strings.BURC_ADLARI[i].toLowerCase() +
          "_buyuk" +
          "${i + 1}.png"; // Koc -> koc_buyuk1.png

      BurcModel addBurc = BurcModel(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          bigImage,
          littleImage);
      allBurc.add(addBurc);
    }
    return allBurc;
  }

  Widget readyToList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        return ListPosition(context, position);
        //donen listenin uzunlugu kadar liste elemani olustur.
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget ListPosition(BuildContext context, int position) {
    BurcModel addToBurc = tumBurclar[position];

    return Container(
      height: 100,
      child: Card(
        color: Colors.yellow.shade400,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap:() => ClickForListPosition(context, position),
            leading: Image.asset(
              "images/" + addToBurc.burcKucukResim,
              width: 64,
              height: 64,
            ),
            title: Text(
              addToBurc.burcAdi,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                addToBurc.burcTarihi,
                style: TextStyle(fontSize: 14, color: Colors.black38),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  ClickForListPosition(BuildContext context,int position) {
    Navigator.pushNamed(context, 'burcDetail/$position');
  }
}
