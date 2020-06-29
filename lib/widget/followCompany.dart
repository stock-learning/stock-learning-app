import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/customRaisedButton.dart';
import 'package:stocklearningapp/widget/loading.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';

class FollowCompany extends StatefulWidget {

  final String initials;
  final bool initialFollowState;

  FollowCompany({
    @required this.initials,
    @required this.initialFollowState
  });
    

  FollowCompanyState createState() => new FollowCompanyState();

}

class FollowCompanyState extends State<FollowCompany> {

  bool isFollowing;

  @override
  void initState() {
    super.initState();
    this.isFollowing = widget.initialFollowState;

  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        documentNode: gql(followCompanyMutation)
      ),
      builder: (RunMutation runMutation, QueryResult mutationResult) {
        if (mutationResult.loading) {
          return buildLoading();
        } else if (mutationResult.hasException) {
          return buildError(mutationResult.exception.toString());
        } else {
          if (this.isFollowing) {
            return buildUnfollowButton(runMutation);
          } else {
            return buildFollowButton(runMutation);
          }
        }
      }
    );
  }

  Widget buildLoading() {
    return Loading();
  }

  Widget buildError(String e) {
    return Text(e);
  }

  Widget buildUnfollowButton(RunMutation runMutation) {
    return CustomRaisedButton(
      background: defaultColor,
      textColor: primaryColor,
      label: 'Deixar de seguir',
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      onPressed: () => this.switchFollowState(runMutation),
    );
  }

  Widget buildFollowButton(RunMutation runMutation) {
    return CustomRaisedButton(
      background: secondaryColor,
      textColor: textSecundaryColor,
      label: 'Seguir',
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      onPressed: () => this.switchFollowState(runMutation),
    );
    
  }

  void switchFollowState(RunMutation runMutation) {
    this.isFollowing = !this.isFollowing;
    runMutation({
      'initials': widget.initials,
      'isFollow': this.isFollowing,
    });
  }

}
