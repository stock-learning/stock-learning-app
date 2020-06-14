import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/customAppBar.dart';
import 'package:stocklearningapp/widget/customDrawer.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/timeline.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: CustomDrawer(),
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey
        ),
        body: PageView(
          controller: PageController(initialPage: 1),
          children: <Widget>[
            Container(
              child: Center(child: Text("Noticias Gerais"))
            ),
            Timeline(),
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
