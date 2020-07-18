import 'package:animate_do/animate_do.dart';
import 'package:animated_do_app/src/pages/twitterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated do"),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter), 
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TwitterPage()));
            }
          ),

          IconButton(
            icon: Icon(Icons.navigate_next), 
            onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context)=>Pagina1_page()));
            }
          ),

        ],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: FaIcon(FontAwesomeIcons.play),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon( Icons.new_releases, color: Colors.blue,size: 40.0,),
            FadeInDown(delay: Duration(milliseconds: 200),child: Text("Titulo", style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w200),)),
            FadeInDown(delay: Duration(milliseconds: 800),child: Text("Soy un texto pequeño", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600),)),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220.0,
                height: 2.0,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}