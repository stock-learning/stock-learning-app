import 'package:flutter/material.dart';
import 'CustomAppBar.dart';

class Dashboard extends StatelessWidget {
  final GlobalKey _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("José da Silva"), 
                accountEmail: new Text("jose.silva@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xff311b92),
                  child: new Text("J"),
                )
              ),
              new ListTile(
                title: new Text("Conta"),
                trailing: new Icon(Icons.settings),
              ),
              new Divider(),
              new ListTile(
                title: new Text("Sair"),
                trailing: new Icon(Icons.close),
              )
            ],
          ),),
        appBar: CustomAppBar(
          key: _scaffoldKey
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
          backgroundColor: Color(0xff311b92)
        )
      );
  }
}
