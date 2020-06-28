import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/DataTimeline.dart';
import 'package:stocklearningapp/widget/customLoader.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/models/dataTimeline.model.dart';

class Timeline extends StatelessWidget {
  Future load() async {
    // await new Future.delayed(const Duration(seconds: 5), () {});
    List<DataTimelineModel> model = DataTimelineModel.getDataModel();
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Text(
            'Atualizado em 20:00',
            style: TextStyle(color: Colors.blueGrey[300]),
          )
        ]),
        Expanded(
          child: ListView.builder(
              itemCount: model.length,
              itemBuilder: (context, index) => DataTimeline(model: model[index]),
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: FutureBuilder(
        future: load(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data;
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CustomLoader();
        },
      ),
    );
  }
}
