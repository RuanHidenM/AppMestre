import 'dart:async';
import 'package:appmestre/database/dao/empresa_dao.dart';
import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/http/http_verifica_token.dart';
import 'package:appmestre/screens/catalogo.dart';
import 'package:appmestre/screens/login.dart';
import 'package:appmestre/screens/views/dropdown_button_empresas.dart';
import 'package:appmestre/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

import '../caixa_banco.dart';

class DrawerSide extends StatefulWidget {
  _drawerSide createState() => _drawerSide();
}

class _drawerSide extends State<DrawerSide> {
  get MediaHeight => MediaQuery.of(context).size.height;

  get MediaWidth => MediaQuery.of(context).size.width;
  String _connectionStatus = 'UnkNown';
  final Connectivity _connectivity = new Connectivity();
  var nomeUsuario; //TODO Nome do usuario
  var emailUsuario; //TODO Email do usuario

  final _daoUser = UserDao();
  final _daoEmpresa = EmpresaDao();

  _drawerSide() {
    //TODO verifica token
    VerificaTokenUser().then((value) {
      if (value == false) {
        //TODO: Deletando todos os usuario.
        _daoUser.deletaUsuarioLogado();

        //TODO: Deletando todas as empresas do usuario.
        _daoEmpresa.deleteEmpresa();

        //TODO: Indo para a tela de loginpage
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));

        //TODO: MSG de usuario desconectado
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('A sessão de autenticada expirou.'),
          ),
        );
      }
    });

    //TODO: Dados do usuario logado
    _daoUser.findUsuario().then((valor) => setState(() {
          nomeUsuario = valor.nome;
          emailUsuario = valor.email;
    }));
  }

  void initState() {
    super.initState();
    setState(() {});

    //TODO: Verifica o status da conecção
    StreamSubscription<ConnectivityResult> _connectivitySubscription;
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        setState(() => _connectionStatus = result.toString());
        print('conects: $_connectionStatus');
        if (_connectionStatus == "ConnectivityResult.none") {
          print('sem internet $_connectionStatus');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaWidth / 1.25,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: MediaHeight / 3.8,
              child: DrawerHeader(
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        //color: Colors.red,
                        child: Row(
                          children: [
                            //TODO BLOCO LOGO DA EMPRESA
                            Expanded(
                              flex: 4,
                              child: Container(
                                // color: Colors.blue,
                                height: MediaHeight / 3,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(0.0),
                                      decoration: BoxDecoration(
                                          // color: Colors.white,
                                          ),
                                      child: ClipRRect(
                                        child: GestureDetector(
                                          child: Image.asset(
                                            'logo_emporiofloriano.png',
                                            height: MediaWidth < 400 //TODO: Se a tela for maior que 600
                                                ? MediaWidth / 4.5
                                                : MediaWidth / 5,
                                          ),
                                          onTap: () {
                                            DropdownButtonEmpresas();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //TODO: BLOCO INFO DO USER LOGADO
                            Expanded(
                              flex: 5,
                              child: Container(
                                padding: EdgeInsets.only(top: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$nomeUsuario',
                                      style: TextStyle(
                                          color: Colors.white,
                                        fontSize: MediaWidth < 400
                                            ? MediaWidth / 27
                                            : MediaWidth / 33
                                      ),
                                    ),
                                    Text(
                                      '$emailUsuario',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize:MediaWidth < 400
                                              ? MediaWidth / 30
                                              : MediaWidth / 35
                                      ),
                                    ),
                                    // Text('104.388.799.70', style: TextStyle(color: Colors.white),),
                                    //TODO Informativo se esta conectado a uma internet
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //TODO: CONECT
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Icon(
                                            _connectionStatus != 'ConnectivityResult.none'
                                                ? Icons.wifi
                                                : Icons.wifi_off,
                                            size: MediaHeight / 60,
                                            color:
                                            _connectionStatus != 'ConnectivityResult.none'
                                                ? Colors.lightGreen
                                                : Colors.redAccent,
                                          ),
                                        ),
                                        Text(
                                          _connectionStatus !=
                                                  'ConnectivityResult.none'
                                              ? 'Conectado'
                                              : 'Desconectado',
                                          style: TextStyle(
                                              color: _connectionStatus !=
                                                      'ConnectivityResult.none'
                                                  ? Colors.lightGreen
                                                  : Colors.redAccent,
                                              fontSize: MediaHeight / 65),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //TODO EMPRESA SELECIONADA
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white10,
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonEmpresas(),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    //color: Color.fromRGBO(3, 41, 102, 20),
                    gradient: LinearGradient(
                  // begin: Alignment.topRight,
                  // end: Alignment.bottomLeft,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(36, 82, 108, 1),
                    Color.fromRGBO(36, 82, 108, 100),
                  ],
                )),
              ),
            ),
            //Todo DashBoard
            ListTile(
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Icon(Icons.apps,
                        color: Colors.black54,
                      size: MediaWidth < 400
                          ? MediaWidth / 14
                          : MediaWidth / 16,
                    ),
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: MediaWidth < 400
                            ? MediaWidth / 20
                            : MediaWidth / 25,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            //Todo: Catálogo
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Icon(Icons.view_list,
                        color: Colors.black54,
                      size: MediaWidth < 400
                          ? MediaWidth / 14
                          : MediaWidth / 16,
                    ),
                  ),
                  Text(
                    'Catálogo',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaWidth < 400
                          ? MediaWidth / 20
                          : MediaWidth / 25,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Catalogo()));
              },
            ),
            //Todo: Ralatórios e comissões
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Icon(
                      Icons.bar_chart_sharp,
                      color: Colors.black54,
                      size: MediaWidth < 400
                          ? MediaWidth / 14
                          : MediaWidth / 16,
                    ),
                  ),
                  Text(
                    'Relatórios e comissões',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaWidth < 400
                          ? MediaWidth / 20
                          : MediaWidth / 25,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ScreenTeste()));
              },
            ),
            //TODO: Caixa e Banco
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Icon(Icons.monetization_on,
                        color: Colors.black54,
                        size: MediaWidth < 400
                          ? MediaWidth / 14
                          : MediaWidth / 16,),
                  ),
                  Text(
                    'Caixas e Bancos',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaWidth < 400
                          ? MediaWidth / 20
                          : MediaWidth / 25,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaixaBanco(),
                  ),
                );
              },
            ),
            //TODO: Configuração
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Icon(
                      Icons.settings,
                      color: Colors.black54,
                      size: MediaWidth < 400
                          ? MediaWidth / 14
                          : MediaWidth / 16,
                    ),
                  ),
                  Text(
                    'Configurações',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaWidth < 400
                          ? MediaWidth / 20
                          : MediaWidth / 25,
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
            //TODO Desconectar
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Icon(
                      Icons.logout,
                      color: Colors.black54,
                        size: MediaWidth < 400
                            ? MediaWidth / 14
                            : MediaWidth / 16,
                    ),
                  ),
                  Text(
                    'Desconectar',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: MediaWidth < 400
                          ? MediaWidth / 20
                          : MediaWidth / 25,
                    ),
                  ),
                ],
              ),
              onTap: () async {
                //TODO: Deletando todos os usuario.
                _daoUser.deletaUsuarioLogado();

                //TODO: Deletando todas as empresas do usuario.
                _daoEmpresa.deleteEmpresa();

                //TODO: Indo para a tela de loginpage
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            //TODO token
            ListTile(
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Icon(Icons.vpn_key_outlined,
                        color: Colors.black54,
                        size: MediaWidth < 400
                            ? MediaWidth / 14
                            : MediaWidth / 16
                    ),
                  ),
                  Text(
                    'Verificar token',
                    style: TextStyle(
                        color: Colors.black54,
                      fontSize: MediaWidth < 400
                          ? MediaWidth / 20
                          : MediaWidth / 25,
                    ),
                  ),
                ],
              ),
              onTap: () async {
                VerificaTokenUser();
              },
            ),
            //TODO Ultima sincronização
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: Icon(Icons.autorenew,
                            color: Colors.black26, size: MediaWidth < 400
                                ? MediaWidth / 14
                                : MediaWidth / 16
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Ultima sincronização: ',
                            style: TextStyle(
                                color: Colors.black26,
                              fontSize: MediaWidth < 400
                                  ? MediaWidth / 20
                                  : MediaWidth / 25,
                            ),
                          ),
                          Text(
                            '01/05/2021',
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: MediaWidth < 400
                                    ? MediaWidth / 20
                                    : MediaWidth / 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
