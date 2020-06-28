import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/companyLogo.dart';
import 'package:stocklearningapp/widget/descriptionText.dart';
import 'package:stocklearningapp/widget/loading.dart';
import 'package:stocklearningapp/widget/models/stockData.model.dart';
import 'package:stocklearningapp/widget/stockDataChart.dart';
import 'package:stocklearningapp/widget/tweets.dart';

class Company extends StatelessWidget {

  final String companyId;
  final String valuePredictionChartLabel;
  final String booleanPredictionChartLabel;
  final currencyFormat = NumberFormat.simpleCurrency(locale: 'pt-BR');

  Company({
    this.companyId,
    this.valuePredictionChartLabel = 'Previsão de valores',
    this.booleanPredictionChartLabel = 'Recomendação de venda/compra',
  }):
    assert(companyId != null);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(companyDataByUser),
        variables:  {
          "id": this.companyId
        }
      ),
      builder: (QueryResult result, {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.loading) {
          return this.buildLoading();
        } else if (result.hasException) {
          return this.buildError(result);
        } else {
          return this.buildCompanyData(context, result);
        }
      }
    );
  }

  Widget buildLoading() {
    return Container(
      child: Loading(),
    );
  }

  Widget buildError(QueryResult result) {
    return Container(
      child: Text('Exception...\n' + result.exception.toString()),
    );
  }

  Widget buildCompanyData(BuildContext context, QueryResult result) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Card(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    child: CompanyLogo(url: result.data['companyData']['logoUrl'])
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        result.data['companyData']['name'],
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        result.data['companyData']['initials'],
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        '${this.currencyFormat.format(result.data['companyStockCurrentValue'])}',
                        style: TextStyle(
                          fontSize: 50.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: DescriptionText(
                      text: result.data['companyData']['description'],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: StockDataChart(
              data: StockDataModel.getStockDataModelMock(), // TODO - definir como buscar isso na api
              showBooleanPrediction: false,
              title: this.valuePredictionChartLabel,
            ),
          ),
          Container(
            child: StockDataChart(
              data: StockDataModel.getStockDataModelMock(), // TODO - definir como buscar isso na api
              showBooleanPrediction: true,
              title: this.booleanPredictionChartLabel,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Tweets(
              companyId: this.companyId
            ),
          ),
        ],
      )
    );
  }
}
