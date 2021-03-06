import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 80.0;
  GlobalKey<ScaffoldState> scaffoldKey;

  CustomAppBar({this.scaffoldKey}) : assert(scaffoldKey != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferedHeight,
      padding: EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[primaryColor, secondaryColor])
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imagePath, fit: BoxFit.contain, height: 50)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => { scaffoldKey.currentState.openEndDrawer() },
                child: Icon(Icons.menu, color: textSecundaryColor, size: 30),
              )
              // IconButton(
              //     icon: Icon(Icons.menu, color: Colors.white, size: 30),
              //     onPressed: () => key.currentState.openEndDrawer(),
              // )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}
