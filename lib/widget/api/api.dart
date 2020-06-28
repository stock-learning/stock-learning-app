final String flutterTeste = """
query {
  flutterTeste {
    message
  }
}
""";

final String companyDataByUser = """
query companyDataByUser(\$id: String!) {
  companyData(id: \$id) {
    initials
    name
    logoUrl
    description
  }
  userFollowCompany(companyId: \$id)
  companyStockCurrentValue(companyId: \$id)
}
""";

final String stockDataChartQuery = """
query stockDataChartQuery(\$companyId: String!, \$startDate: DateTime!, \$endDate: DateTime!) {

}
""";

final String tweetsByCompanyQuery = """
query tweetsByCompanyQuery(\$companyId: String!) {
  tweets(companyId: \$companyId) {
    account
    tweet
    createdAt
    statusId
  }
}
""";

final String allTweetsQuery = """
query tweetsByCompanyQuery {
  tweets {
    account
    cleanText
    createdAt
    statusId
  }
}
""";
