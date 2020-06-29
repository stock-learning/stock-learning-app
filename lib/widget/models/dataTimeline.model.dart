import 'package:graphql_flutter/graphql_flutter.dart';

class DataTimelineModel {
  String imageURL;
  String name;
  String initials;
  String description;
  double percentage;
  bool isUp;

  DataTimelineModel(this.imageURL, this.name, this.initials, this.description, this.percentage, this.isUp);

  static List<DataTimelineModel> convertModel(QueryResult result) {
    List<DataTimelineModel> model = List<DataTimelineModel>();
    for (var i = 0; i < result.data['timeline']['data'].length; i++) {
      model.add(DataTimelineModel(
        result.data['timeline']['data'][i]['logoUrl'],
        result.data['timeline']['data'][i]['name'],
        result.data['timeline']['data'][i]['initials'],
        result.data['timeline']['data'][i]['description'],
        result.data['timeline']['data'][i]['porcentage'].toDouble(),
        result.data['timeline']['data'][i]['isPositive']
      ));
    }
    return model;
  }

  static List<DataTimelineModel> convertDynamicModel(dynamic result) {
    List<DataTimelineModel> model = List<DataTimelineModel>();
    for (var i = 0; i < result['newLiveUpdate']['data'].length; i++) {
      model.add(DataTimelineModel(
        result['newLiveUpdate']['data'][i]['logoUrl'],
        result['newLiveUpdate']['data'][i]['name'],
        result['newLiveUpdate']['data'][i]['initials'],
        result['newLiveUpdate']['data'][i]['description'],
        result['newLiveUpdate']['data'][i]['porcentage'].toDouble(),
        result['newLiveUpdate']['data'][i]['isPositive']
      ));
    }
    return model;
  }
}
