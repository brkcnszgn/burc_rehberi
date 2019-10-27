import 'package:flutter/material.dart';

import 'burc_list.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burc rehberi",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home:BurcListesi(),
    );
  }
}
