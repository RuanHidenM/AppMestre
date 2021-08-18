import 'dart:async';
import 'package:appmestre/http/webclient.dart';
import 'package:appmestre/screens/home.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:appmestre/components/alert/alert_small_title_icon.dart';
import 'package:appmestre/canvas/canvas_screen-login.dart';
import 'package:appmestre/components/button/button_small_title_icon_color.dart';
import 'package:appmestre/components/button/circular_button_medium_title_color_icon.dart';
import 'package:appmestre/components/progress.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailUser = TextEditingController();
  final _senhaUser  = TextEditingController();

  bool _loadding = false;
  String _connectionStatus = 'UnkNown';
  final Connectivity _connectivity = new Connectivity();
  get MediaWidth => MediaQuery.of(context).size.width;
  String connectionStatus = '';

  @override
  void initState() {
    super.initState();
    initConnectivity();
    StreamConnectivityResult();
  }

  //TODO: Verifica o status da conecção.
  StreamConnectivityResult(){
  StreamSubscription<ConnectivityResult>_connectivitySubscription;
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
        setState((){
          _connectionStatus = result.toString();
        });
        print('conectss: ${_connectionStatus}');
        if(_connectionStatus == "ConnectivityResult.none"){
          AlertaConectInternet();
        }
      },
    );
  }

  //TODO: Verifica o status da conecção
  Future<Null> initConnectivity() async {
    _connectionStatus = (await _connectivity.checkConnectivity().toString());
    setState(() {
      _connectionStatus = connectionStatus;
    });
  }

  //TODO: Alerta de aviso que esta sem internet
  void AlertaConectInternet(){
    alertaSimples(
        context,
        'Conexão com a Internet',
        'Para efetuar o login, o dispositivo deve estar conectado a uma internet',
        Icons.wifi_off,
        Colors.red
    );
  }

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      //TODO: Permitindo que a tela se arrume quando o teclado for chamado.
      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Stack(
            //physics: NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.indigo,
                  child: CustomPaint(
                    //TODO: Efeito de canvas login
                    painter: BackgroundSignIn(),
                    child: Column(
                      children: [
                        //TODO BLOCO DA LOGO
                        Expanded(
                          flex: 3,
                          child: Container(
                            //color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, bottom: 10, left: 70, right: 70),
                              child: Container(
                                child: Image.asset('images/Logo_Mestre_-_Completo.png'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              //TODO Bloco TextField e button 'Entrar'
                              Expanded(
                                flex: 5,
                                child: Container(
                                  //color: Colors.indigo,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, bottom: 10),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Center(
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                    fontSize: MediaWidth / 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromRGBO(3, 72, 102, 1)
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        //TODO: Antigo TextForm

                                        Padding(
                                          padding: const EdgeInsets.only(top: 8, bottom: 3, left: 3, right: 3),
                                          child: Container(
                                            color: Color.fromRGBO(155, 155, 155, 210),
                                            child: TextField(
                                              obscureText: false,
                                              controller: _emailUser,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                ),
                                                 labelStyle: TextStyle(
                                                   color: Colors.black54,
                                                 ),
                                                labelText: 'E-mail',
                                                //errorText: _verificaNomeEmpty ? 'Este campo é obrigatório' : null,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8, bottom: 3, left: 3, right: 3),
                                          child: Container(
                                            color: Color.fromRGBO(155, 155, 155, 210),
                                            child: TextField(
                                              obscureText: false,
                                              controller: _senhaUser,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                ),
                                                labelStyle: TextStyle(
                                                    fontSize: MediaWidth / 22
                                                ),
                                                labelText: 'Senha',
                                                //errorText: _verificaNomeEmpty ? 'Este campo é obrigatório' : null,
                                              ),
                                            ),
                                          ),
                                        ),

                                        GestureDetector(
                                          child: buttonSmallTitleIconColor(
                                              name: 'Entrar',
                                              iconDoButton:
                                              Icons.arrow_forward_ios,
                                              corDoBotao:
                                              Colors.deepOrangeAccent,
                                              corDoIcon: Colors.white,
                                              corDoTexto: Colors.white
                                          ),
                                          onTap: () async {


                                            //TODO; VERIFICA SE TEM INTERNET
                                            if(_connectionStatus == 'ConnectivityResult.none'){
                                              AlertaConectInternet();
                                            }else {
                                              //TODO; VERIFICA SE TODOS OS CAMPOS ESTÃO PREECHIDOS
                                              if (
                                                _emailUser.text == null ||
                                                _senhaUser.text == null ||
                                                _emailUser.text.isEmpty ||
                                                _emailUser.text.isEmpty)
                                              {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content:
                                                  Text('Todos os campos deven ser informados !'),));
                                              } else {
                                                setState(() => _loadding = true); //TODO: Ligando loadding
                                                setState(() => _loadding = false); //TODO: Desligando loadding
                                              }
                                            }
                                           // print('Em-mail: ${_emailUser.text.toString()}, senha: ${_senhaUser.text.toString()}');

                                            findUser(
                                                '${_emailUser.text.toString()}',
                                                '${_senhaUser.text.toString()}'
                                            ).then((value){

                                              if(value){
                                                setState(()=> _loadding = true);

                                                Future.delayed(Duration(seconds:1)).then((value) {
                                                  setState(() => _loadding = false);

                                                  Navigator.push(
                                                      context, MaterialPageRoute(
                                                      builder: (context) => HomePage(),
                                                    ),
                                                  );
                                                  }
                                                );

                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: Text('Bem-vindo ao Mestre Sistemas App'),)
                                                );
                                              }else{
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content:
                                                Text('E-mail ou senha invalida!'),));
                                              }
                                            });

                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //TODO Bloco circular button
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        circularButtonMediunTitleColorIcon(
                                            corDobotao:
                                            Color.fromRGBO(36, 82, 108, 1),
                                            iconDoBotao: Icons.web,
                                            corDoIcon: Colors.white),
                                        circularButtonMediunTitleColorIcon(
                                            corDobotao:
                                            Color.fromRGBO(36, 82, 108, 1),
                                            iconDoBotao: Icons.message,
                                            corDoIcon: Colors.white),
                                        circularButtonMediunTitleColorIcon(
                                            corDobotao:
                                            Color.fromRGBO(36, 82, 108, 1),
                                            iconDoBotao: Icons.vpn_key_outlined,
                                            corDoIcon: Colors.white),
                                        circularButtonMediunTitleColorIcon(
                                            corDobotao:
                                            Color.fromRGBO(36, 82, 108, 1),
                                            iconDoBotao: Icons.create,
                                            corDoIcon: Colors.white),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            child: Center(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Progress(),
              ),
            ),
            visible: _loadding,
          ),
        ],
      ),
    );
  }
}