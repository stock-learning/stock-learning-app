import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/models/stockData.model.dart';

class StockDataChart extends StatelessWidget {

  final charts.Color chartPrimaryColor = charts.Color(
    r: primaryColor.red,
    g: primaryColor.green,
    b: primaryColor.blue,
    a: primaryColor.alpha
  );
  final charts.Color chartSecondaryColor = charts.Color(
    r: secondaryColor.red,
    g: secondaryColor.green,
    b: secondaryColor.blue,
    a: secondaryColor.alpha
  );

  final List<StockDataModel> data;
  final bool showBooleanPrediction;
  final String title;
  
  StockDataChart({
    @required this.data,
    @required this.title,
    this.showBooleanPrediction = false
  });

  List<charts.Series<StockDataModel, DateTime>> getListSeries() {
    if (this.showBooleanPrediction) {
      return [
        new charts.Series<StockDataModel, DateTime> (
          id: 'valuePredictions',
          data: this.data,
          colorFn: (StockDataModel stockDataModel, _) {
            if (stockDataModel.isSell) {
              return charts.MaterialPalette.red.shadeDefault;
            } else {
              return charts.MaterialPalette.green.shadeDefault;
            }
          },
          domainFn: (StockDataModel stockDataModel, _) => stockDataModel.date,
          measureFn: (StockDataModel stockDataModel, _) => stockDataModel.value,
        )
      ];
    } else {
      return [
        new charts.Series<StockDataModel, DateTime> (
          id: 'actualValues',
          data: this.data,
          colorFn: (_, __) => this.chartPrimaryColor,
          domainFn: (StockDataModel stockDataModel, _) => stockDataModel.date,
          measureFn: (StockDataModel stockDataModel, _) => stockDataModel.value,
        ),
        new charts.Series<StockDataModel, DateTime> (
          id: 'predictedValues',
          data: this.data,
          colorFn: (_, __) => this.chartSecondaryColor,
          domainFn: (StockDataModel stockDataModel, _) => stockDataModel.date,
          measureFn: (StockDataModel stockDataModel, _) => stockDataModel.predictedValue,
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  this.title,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: charts.TimeSeriesChart(
                  this.getListSeries(),
                  animate: true,
                  primaryMeasureAxis: charts.AxisSpec(
                    showAxisLine: true,
                  ),
                  // primaryMeasureAxis: charts.NumericAxisSpec(
                  //   tickFormatterSpec: charts.BasicNumericTickFormatterSpec.fromNumberFormat(
                  //     NumberFormat.simpleCurrency(locale: 'pt-BR')
                  //   )
                  // ),
                  domainAxis: charts.DateTimeAxisSpec(
                    tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                      minute: charts.TimeFormatterSpec(
                        format: 'mm',
                        transitionFormat: 'hh:mm'
                      ),
                      hour: charts.TimeFormatterSpec(
                        format: 'hh',
                        transitionFormat: 'dd/MM',
                      ),
                      day: charts.TimeFormatterSpec(
                        format: 'd',
                        transitionFormat: 'dd/MM'
                      ),
                      month: charts.TimeFormatterSpec(
                        format: 'MMMM',
                        transitionFormat: 'MMMM yyyy'
                      ),
                      year: charts.TimeFormatterSpec(
                        format: 'yyyy',
                        transitionFormat: 'yyyy'
                      ),
                    )
                  )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
