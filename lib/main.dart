
import 'package:appmestre/screen/login.dart';
import 'package:flutter/material.dart';

//TODO: Nesta tela sera verificado se á dados de usuario logado,
//Todo assim determinando se o usuario ira ser direcionado para tela de login, ou para home page


void main() {
  runApp(MyApp());
  //findUser('72105794000169', 'admin', 'admin.*'); //TODO passando o tenant, nome, senha
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App Mestre',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: LoginPage(),
    );
  }
}



