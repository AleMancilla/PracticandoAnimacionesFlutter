import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>_NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notification page"),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          title: Text('Bones'),
          icon: FaIcon(FontAwesomeIcons.bone)
        ),
        
        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: BounceInDown(
                  from: 10.0,
                  animate: (numero>0)?true:false,
                  child: Bounce(
                    from: 10.0,
                    controller: (controller)=>Provider.of<_NotificationModel>(context).bouncecontroller = controller,
                    child: Container(
                      child: Text("$numero",style: TextStyle(color: Colors.white,fontSize: 9.0,),),
                      alignment: Alignment.center,
                      width: 14.0,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                )
              )
            ],
          )
        ),
        
        BottomNavigationBarItem(
          title: Text('My Dog'),
          icon: FaIcon(FontAwesomeIcons.dog)
        ),
        
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        int numero = Provider.of<_NotificationModel>(context,listen: false).numero;
        numero ++;
        Provider.of<_NotificationModel>(context,listen: false).numero = numero;

        if(numero >= 2){
          final controller = Provider.of<_NotificationModel>(context,listen: false).bouncecontroller;
          controller.forward(from:0.0);
        }
      },
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}


class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController _bouncecontroller;

  int get numero => this._numero;
  set numero(int numero){
    this._numero = numero;
    notifyListeners();
  }

  AnimationController get bouncecontroller => this._bouncecontroller;
  set bouncecontroller(AnimationController controller){
    this._bouncecontroller = controller;
    //notifyListeners();
  }
}