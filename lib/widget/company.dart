import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/companyLogo.dart';
import 'package:stocklearningapp/widget/descriptionText.dart';
import 'package:stocklearningapp/widget/followCompany.dart';
import 'package:stocklearningapp/widget/loading.dart';
import 'package:stocklearningapp/widget/models/stockData.model.dart';
import 'package:stocklearningapp/widget/stockDataChart.dart';
import 'package:stocklearningapp/widget/tweets.dart';

class Company extends StatelessWidget {

  final String initials;
  final String valuePredictionChartLabel;
  final String booleanPredictionChartLabel;
  final currencyFormat = NumberFormat.simpleCurrency(locale: 'pt-BR');

  Company({
    this.initials,
    this.valuePredictionChartLabel = 'Previsão de valores',
    this.booleanPredictionChartLabel = 'Recomendação de venda/compra',
  });

  @override
  Widget build(BuildContext context) {
    if (this.initials == null) {
      return buildNotFound();
    } else {
      return buildQuery(context);
    }
  }

  Widget buildNotFound() {
    return Container(
      child: Center(
        child: Text(
          'Selecione uma empresa para visualizar seus dados.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30
          ),
        )
      ),
    );
  }

  Widget buildQuery(BuildContext context) {
    return Query(
      options: QueryOptions(
        documentNode: gql(companyDataByUser),
        variables:  {
          "initials": this.initials
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
                    child: CompanyLogo(url: result.data['companyDataByInitials']['logoUrl'])
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        result.data['companyDataByInitials']['name'],
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
                        result.data['companyDataByInitials']['initials'],
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
                      text: result.data['companyDataByInitials']['description'],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: FollowCompany(
              initialFollowState: result.data['userFollowCompany'],
              initials: this.initials,
            ),
          ),
          Container(
            child: StockDataChart(
              data: toStockDataModel(result.data['stockDataPrediction']), //StockDataModel.getStockDataModelMock(), // TODO - definir como buscar isso na api
              showBooleanPrediction: true,
              title: this.valuePredictionChartLabel,
            ),
          ),
          // Container(
          //   child: StockDataChart(
          //     data: StockDataModel.getStockDataModelMock(), // TODO - definir como buscar isso na api
          //     showBooleanPrediction: false,
          //     title: this.booleanPredictionChartLabel,
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(15),
            child: Tweets(
              initials: this.initials
            ),
          ),
        ],
      )
    );
  }

  List<StockDataModel> toStockDataModel(dynamic data) {
    print('aqui');
    return List<StockDataModel>.from(data.map((e) => StockDataModel(DateTime.parse(e['dateTime']), e['value']+0.0, 0.0, e['isSell'])).toList());
  }
}
