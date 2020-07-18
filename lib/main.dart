import 'package:animated_do_app/src/pages/NavegacionPage.dart';
import 'package:animated_do_app/src/pages/Pagina1_page.dart';
import 'package:animated_do_app/src/pages/twitterPage.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Pagina1_page(),
    );
  }
}