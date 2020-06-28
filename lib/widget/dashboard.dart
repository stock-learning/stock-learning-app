import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/company.dart';
import 'package:stocklearningapp/widget/customAppBar.dart';
import 'package:stocklearningapp/widget/customDrawer.dart';
import 'package:stocklearningapp/widget/generalNews.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/notificationDashboard.dart';
import 'package:stocklearningapp/widget/timeline.dart';


class Dashboard extends StatefulWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DashboardState createState() => new DashboardState();

}

class DashboardState extends State<Dashboard> {

  String selectedinitials;

  @override
  void initState() {
    super.initState();
    this.selectedinitials = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget._scaffoldKey,
        endDrawer: CustomDrawer(),
        appBar: CustomAppBar(
          scaffoldKey: widget._scaffoldKey
        ),
        body: PageView(
          controller: PageController(initialPage: 1),
          children: <Widget>[
            GeneralNews(),
            Timeline(onSelectedCompany: (initials) => setState(() => this.selectedinitials = initials)),
            Company(initials: this.selectedinitials),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) {
                return NotificationDashboard();
              })
            );
          },
          child: Icon(Icons.notifications),
          backgroundColor: primaryColor
        )
      );
  }
}
