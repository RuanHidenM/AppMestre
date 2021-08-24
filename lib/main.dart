
import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/screens/detalhesdoitem.dart';
import 'package:appmestre/screens/home.dart';
import 'package:appmestre/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/loading_progress_logo_mestre.dart';

//TODO: Mesta tela é verificado se á dados do usuario logado

void main() {
  //TODO Efeito de inicialização do App
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _daoUser = UserDao();
  int usuarioLogado = 0;
  @override
  Widget build(BuildContext context) {
    _daoUser.findQuantUsuarioLogado().then((value) {
      usuarioLogado = value;
    });
    //TODO Futurebuilder do efeito no carregamento na tela.
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: loaddingMestre('Carregando...'));
        }else{
          //TODO FutureBuilder da verificação se já tem um usuario logado.
          return FutureBuilder(
            future: _daoUser.findQuantUsuarioLogado(),
            builder: (context, value){

              //TODO Verifica se tem um usuario cadastrado no login.
              if(usuarioLogado >= 1){
                //TODO Se Sim, Direcionar a tela para o HomePage.
                return MaterialApp(
                  title: 'Mestre Sistemas App',
                  theme: ThemeData(
                    primarySwatch: Colors.blueGrey,//TODO: Cor do app
                  ),
                  home: HomePage(),
                );
                }else{
                //TODO Se Não, Direciona a tela para o Login.
                return MaterialApp(
                  title: 'Mestre Sistemas App',
                  theme: ThemeData(
                    primarySwatch: Colors.blueGrey,//TODO: Cor do app
                  ),
                  home: LoginPage(),
                  //home: DetalhesDoItem(),
                );
              }
            }
          );
        }
      },
    );
  }
}


//TODO: Efeito de time out no abrir o aplicativo
class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(Duration(seconds: 3));
  }
}




