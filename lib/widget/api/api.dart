final String flutterTeste = """
query {
  flutterTeste {
    message
  }
}
""";

final String companyDataByUser = """
query companyDataByUser(\$initials: String!) {
  companyDataByInitials(initials: \$initials) {
    initials
    name
    logoUrl
    description
  }
  userFollowCompany(initials: \$initials)
  companyStockCurrentValue(initials: \$initials)
}
""";

final String stockDataChartQuery = """
query stockDataChartQuery(\$initials: String!, \$startDate: DateTime!, \$endDate: DateTime!) {

}
""";

final String tweetsByCompanyQuery = """
query tweetsByCompanyQuery(\$initials: String!) {
  tweets(initials: \$initials) {
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

final String currentUserNotification = """
query {
  currentUserNotification {
    text
    dateTime
  }
}
""";

final String currentUserMutation = """
mutation currentUserMutation(\$name: String!, \$email: String!, \$password: String!) {
	currentUserMutation(user: { name: \$name,  email: \$email, password: \$password}) {
    name
    email
  }
}
""";


final String currentUserQuery = """
query currentUserQuery {
	currentUserQuery {
    name
    email
  }
}
""";

final String followCompanyMutation = """
mutation followCompany(\$initials: String!, \$isFollow: Boolean!) {
  followCompany(initials: \$initials, isFollow: \$isFollow)
}
""";

final String loginQuery = """
query login(\$email: String!, \$password: String!) {
  login(email: \$email, password: \$password) {
    success
    token
  }
}
""";