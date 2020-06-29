import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stocklearningapp/widget/api/api.dart';
import 'package:stocklearningapp/widget/customErrorHandling.dart';
import 'package:stocklearningapp/widget/customLoader.dart';
import 'package:stocklearningapp/widget/customRaisedButton.dart';
import 'package:stocklearningapp/widget/customTextField.dart';
import 'package:stocklearningapp/widget/logo.dart';
import 'package:stocklearningapp/widget/models/constants.model.dart';
import 'package:stocklearningapp/widget/routes.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  showAlert(BuildContext context) {
    Widget button = FlatButton(onPressed: () => Navigator.pushNamed(context, signInRoute), child: Text('Voltar ao Login'));
    AlertDialog alert = AlertDialog(
      title: Text('Aviso'),
      content: Text('Usuário criado com sucesso!'),
      actions: [
        button,
      ],
    );
    showDialog(context: context, builder: (context) {
      return alert;
    });
  }

  Widget buildForm(RunMutation runMutation, BuildContext context) {
    final nameFieldController = TextEditingController();
    final emailFieldController = TextEditingController();
    final passwordFieldController = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 70, left: 30, right: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[primaryColor, secondaryColor])
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Logo(),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: defaultColor,
                  borderRadius: BorderRadius.all(Radius.circular(2))
                ),
                child: Text(
                  'Crie sua conta',
                  style: TextStyle(
                    color: textPrimaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
              CustomTextField(
                color: textSecundaryColor,
                padding: EdgeInsets.only(left: 20, right: 20),
                label: 'Nome completo',
                prefix: Icons.account_circle,
                validator: (value) =>  value == null || value.isEmpty ? "O campo nome é obrigatório" : null,
                controller: nameFieldController
              ),
              CustomTextField(
                color: textSecundaryColor,
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                label: 'E-mail',
                prefix: Icons.account_circle,
                validator: (value) =>  value == null || value.isEmpty ? "O campo e-mail é obrigatório" : null,
                controller: emailFieldController
              ),
              CustomTextField(
                color: textSecundaryColor,
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                label: 'Senha',
                prefix: Icons.vpn_key,
                obscureText: true,
                validator: (value) =>  value == null || value.isEmpty ? "O campo senha é obrigatório" : null,
                controller: passwordFieldController
              ),
              CustomTextField(
                color: textSecundaryColor,
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                label: 'Confirme a senha',
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
                background: defaultColor,
                textColor: primaryColor,
                label: 'Criar',
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                onPressed: () { 
                  if (this._formKey.currentState.validate()) {
                    runMutation({
                      'name': nameFieldController.text,
                      'email': emailFieldController.text,
                      'password': passwordFieldController.text
                    });
                    this.showAlert(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(
          documentNode: gql(userMutation)
        ),
        builder: (RunMutation runMutation, QueryResult mutationResult) {
          if (mutationResult.loading) {
            return CustomLoader();
          } else if (mutationResult.hasException) {
            return CustomErrorHandling(exception: mutationResult);
          } else {
            return buildForm(runMutation, context);
          }
        }
    );
  }
}