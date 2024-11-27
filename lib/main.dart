import 'package:flutter/material.dart';
import 'package:flutter_list_view/random.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple),
      home:   StateFulApp()
    );
  }

}



