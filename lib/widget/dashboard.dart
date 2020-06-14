import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/customAppBar.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/routes.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColor
                ),
                accountName: Text("José da Silva", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500)), 
                accountEmail: Text("jose.silva@gmail.com", style: TextStyle(color: Colors.white, fontSize: 15)),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: primaryColor,
                  child: Text("J", style: TextStyle(color: primaryColor, fontSize: 30, fontWeight: FontWeight.w700)),
                )
              ),
              ListTile(
                title: Text("Conta"),
                trailing: Icon(Icons.settings),
                onTap: () => {
                  print('dados pessoais')
                },
              ),
              Divider(),
              ListTile(
                title: Text("Sair"),
                trailing: Icon(Icons.close),
                onTap: () => {
                  Navigator.pushNamed(context, signInRoute)
                },
              )
            ],
          ),),
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey
        ),
        body: PageView(
          controller: PageController(initialPage: 1),
          children: <Widget>[
            Container(
              child: Center(child: Text("Noticias Gerais"))
            ),
            Container(
              child: Center(child: Text("Timeline"))
            ),
            Container(
              child: Center(child: Text("Dados da empresa Selecionada"))
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.notifications),
          backgroundColor: primaryColor
        )
      );
  }
}
