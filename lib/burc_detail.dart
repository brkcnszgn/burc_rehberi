import 'package:burc_rehberi/burc_list.dart';
import 'package:burc_rehberi/models/burcModel.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetail extends StatefulWidget {

  int getPosition;

  BurcDetail(this.getPosition);

  @override
  _BurcDetailState createState() => _BurcDetailState();
}

class _BurcDetailState extends State<BurcDetail> {

  BurcModel selectPosition;
  Color changesAppBarColor;
  PaletteGenerator paletteGenerator;
  @override
  void initState() {
    super.initState();
    //constructordan hemen sonra calisir
    selectPosition=BurcListesi.tumBurclar[widget.getPosition];
    changeColorSearch();
  }

  void changeColorSearch(){
    Future<PaletteGenerator> fPlaetGenerator = PaletteGenerator.fromImageProvider(AssetImage("images/"+selectPosition.burcBuyukResim));

    fPlaetGenerator.then((value){
      paletteGenerator = value;
      setState(() {
        //sayfalarda yuklenmesi degisebilen alanlar icin kullanilir setState
        changesAppBarColor = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

 return Scaffold(
      primary: true,
     body: CustomScrollView(
       slivers: <Widget>[

         SliverAppBar(
           iconTheme: IconThemeData(
             color: Colors.white, //change your color here
           ),
           expandedHeight: 250,
           pinned: true,
           primary: true,
           flexibleSpace: FlexibleSpaceBar(
             title: Text(selectPosition.burcAdi+ " Burcu ve ozellikleri",style: TextStyle(color: Colors.white),),
             background: Image.asset("images/"+selectPosition.burcBuyukResim,fit: BoxFit.cover,),
           ),
           backgroundColor: changesAppBarColor != null ? changesAppBarColor : Colors.amber,

         ),
    SliverToBoxAdapter(
      //tek child vardir sadece yukari asagi yapar
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(selectPosition.burcDetay,style: TextStyle(fontSize: 16,color:Colors.black),),
        ),
      ),
    )
       ],
     ),
    );
  }
}
