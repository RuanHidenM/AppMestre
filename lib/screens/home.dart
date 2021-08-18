import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/screens/views/drawerside.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  _homePage createState() => _homePage();
}

class _homePage extends State<HomePage>{
  get MediaWidth => MediaQuery.of(context).size.width;
  var snapshots;
  String EmailIdentificado = '';
  var resultado;
  var userLogadoEmail;

  final _userDao = UserDao();

  void initState(){
    _userDao.findUsuario();
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        drawer:DrawerSide(),
        drawerEdgeDragWidth: MediaWidth / 3 ,
        drawerScrimColor: Colors.black26,
        appBar: AppBar(
          shadowColor: Color.fromRGBO(36, 82, 108, 250),
          //Todo: cor da borda shadow, para ficar mesclado com o widget de filtro a baixo
          backgroundColor: Color.fromRGBO(36, 82, 108, 25),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dashboard', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'DASHBOARD',
                          style: TextStyle(
                              color: Colors.black12,
                              fontSize: MediaWidth / 10
                          ),
                        ),
                        Text(
                          'O dashboard esta vazio',
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: MediaWidth / 25
                          ),
                        ),
                        //TODO: Testando objectbox
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      );
  }
}

class GraficoCaixaEBanco{
  String nomeCaixaEBanco;
  double taskvalue;
  Color colorva1;

  GraficoCaixaEBanco(this.nomeCaixaEBanco, this.taskvalue, this.colorva1);
}
