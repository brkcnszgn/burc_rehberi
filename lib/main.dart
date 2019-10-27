import 'package:flutter/material.dart';

import 'burc_detail.dart';
import 'burc_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      initialRoute: "/burcList",

      routes: {
        "/": (context)=> BurcListesi(),
        "/burcList": (context) => BurcListesi(),
      },

      onGenerateRoute: (RouteSettings settings) {
        List<String> pathPositions =
            settings.name.split("/"); //    /burcdetail/0......
        if (pathPositions[0] == "burcDetail") {
          return MaterialPageRoute(
            builder: (context) => BurcDetail(
              int.parse(pathPositions[1]),
            ),
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      title: "Burc rehberi",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
//      home: BurcListesi(),
    );
  }
}
