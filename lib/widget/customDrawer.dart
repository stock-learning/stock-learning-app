import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/routes.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: primaryColor),
            accountName: Text("José da Silva",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
            accountEmail: Text("jose.silva@gmail.com",
                style: TextStyle(color: Colors.white, fontSize: 15)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: primaryColor,
              child: Text("J",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700)),
            )),
        ListTile(
          title: Text("Conta"),
          trailing: Icon(Icons.settings),
          onTap: () => Navigator.pushNamed(context, accountFormRoute),
        ),
        Divider(),
        ListTile(
          title: Text("Sair"),
          trailing: Icon(Icons.close),
          onTap: () => {Navigator.pushNamed(context, signInRoute)},
        )
      ],
    ));
  }
}
