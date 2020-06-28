class StockDataModel {

  DateTime date;
  double value;
  double predictedValue;
  bool isSell;

  StockDataModel(this.date, this.value, this.predictedValue, this.isSell);

  static List<StockDataModel> getStockDataModelMock() {
    return [
      new StockDataModel(DateTime.now().subtract(Duration(days: 90)), 55.13, 54.13, false),
      new StockDataModel(DateTime.now().subtract(Duration(days: 82)), 42.68, 45.68, true),
      new StockDataModel(DateTime.now().subtract(Duration(days: 52)), 32.03, 33.03, false),
      new StockDataModel(DateTime.now().subtract(Duration(days: 31)), 28.80, 27.80, false),
      new StockDataModel(DateTime.now().subtract(Duration(days: 20)), 25.64, 26.64, true),
      new StockDataModel(DateTime.now().subtract(Duration(days: 15)), 52.12, 50.12, true),
      new StockDataModel(DateTime.now().subtract(Duration(days: 2)), 45.61, 46.61, true),
    ];
  }

}
