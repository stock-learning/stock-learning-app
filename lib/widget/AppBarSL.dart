import 'package:flutter/material.dart';

class AppBarSL extends StatelessWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 80.0;
  String title = "FLUTTER";
  Color gradientBegin = Color(0xff311b92);
  Color gradientEnd = Color(0xff4527a0);
  GlobalKey<ScaffoldState> key;

  AppBarSL({key}) : assert(key != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferedHeight,
      padding: EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[gradientBegin, gradientEnd])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/logo.png', fit: BoxFit.contain, height: 50)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 30),
                  onPressed: () => key.currentState.openEndDrawer(),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}
