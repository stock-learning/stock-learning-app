import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/CustomAppBar.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/customDrawer.dart';
import 'package:stocklearningapp/widget/customRaisedButton.dart';
import 'package:stocklearningapp/widget/customTextField.dart';
import 'package:stocklearningapp/widget/loading.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/routes.dart';

class AccountForm extends StatefulWidget {
  @override
  AccountFormState createState() {
    return AccountFormState();
  }
}

class AccountFormState extends State<AccountForm> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(),
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey
      ),
      body: Query(
        options: QueryOptions(
          documentNode: gql(currentUserQuery),
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.loading) {
            return buildLoading();
          } else if (result.hasException) {
            return buildError(result.exception.toString());
          } else {
            return buildMutation(result);
          }
        },
      )
    );
  }

  Widget buildLoading() {
    return Loading();
  }

  Widget buildError(String e) {
    return Container(child: Text(e));
  }

  Widget buildMutation(QueryResult result) {
    return Mutation(
        options: MutationOptions(
          documentNode: gql(currentUserMutation)
        ),
        builder: (RunMutation runMutation, QueryResult mutationResult) {
          if (mutationResult.loading) {
            return buildLoading();
          } else if (mutationResult.hasException) {
            return buildError(mutationResult.exception.toString());
          } else {
            return buildForm(runMutation, result);
          }
        }
    );
  }

  Widget buildForm(RunMutation runMutation, QueryResult currentUserQueryResult) {
    final nameFieldController = TextEditingController();
    final emailFieldController = TextEditingController();
    final passwordFieldController = TextEditingController();
    return Container(
      child: Form(
      key: _formKey,
        child: ListView(
          children: <Widget>[
            CustomTextField(
              color: textPrimaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'Nome',
              text: currentUserQueryResult.data['currentUserQuery']['name'],
              prefix: Icons.account_circle,
              obscureText: false,
              validator: (value) =>  value == null || value.isEmpty ? "O campo nome é obrigatório" : null,
              controller: nameFieldController,
            ),
            CustomTextField(
              color: textPrimaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'E-mail',
              text: currentUserQueryResult.data['currentUserQuery']['email'],
              prefix: Icons.account_circle,
              obscureText: false,
              validator: (value) =>  value == null || value.isEmpty ? "O campo e-mail é obrigatório" : null,
              controller: emailFieldController,
            ),
            CustomTextField(
              color: textPrimaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'Senha',
              prefix: Icons.vpn_key,
              obscureText: true,
              validator: (value) =>  value == null || value.isEmpty ? "O campo senha é obrigatório" : null,
              controller: passwordFieldController,
            ),
            CustomTextField(
              color: textPrimaryColor,
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              label: 'Confirmar senha',
              prefix: Icons.vpn_key,
              obscureText: true,
              validator: (value) {
                if (passwordFieldController.text != null && passwordFieldController.text != value) {
                  return "As senhas não são iguais";
                }
                return null;
              }
            ),
            CustomRaisedButton(
              background: secondaryColor,
              textColor: textSecundaryColor,
              label: 'Salvar alterações',
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  runMutation({
                    'name': nameFieldController.text,
                    'email': emailFieldController.text,
                    'password': passwordFieldController.text
                  });
                  Navigator.pushNamed(context, homePageRoute);
                }
              },
            ),
            CustomRaisedButton(
              background: defaultColor,
              textColor: primaryColor,
              label: 'Cancelar',
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              onPressed: () => Navigator.pushNamed(context, homePageRoute),
            ),
          ]
        )
      )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     child: Text('')
      // child: Form(
      //   key: _formKey,
      //   child: Column(
      //     children: <Widget>[
      //       TextFormField(
      //         validator: (value) {
      //           if (value.isEmpty) {
      //             return 'Please enter some text';
      //           }
      //           return null;
      //         },
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 16.0),
      //         child: RaisedButton(
      //           onPressed: () {
      //             if (_formKey.currentState.validate()) {
      //               Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
      //             }
      //           },
      //           child: Text('Submit'),
      //         ),
      //       ),
      //     ]
      //   )
      // ),
    // );
  // }
}

