import 'package:appmestre/canvas/canvas_screen-login.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class homeHome extends StatefulWidget {
  _homeHome createState() => _homeHome();
}

class _homeHome extends State<homeHome> {
  get MediaWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    width: 250,
                    child: Image.asset('images/Logo_Mestre_-_Completo.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Color.fromRGBO(249, 249, 249, 1),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('Um pouco da nossa história',style: TextStyle(
                            color: Color.fromRGBO(0,68,101,1),
                            fontWeight: FontWeight.bold,
                            fontSize: 23
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text('A Mestre Sistemas iniciou suas atividades no ano de 1995, tendo como fundador Valmir'
                            ' Maestri que após vários anos de experiência em uma grande empresa buscou desenvolver soluções '
                            'para o comércio e serviços.', style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text('Hoje a Mestre se propõe a auxiliar empresas de diferentes portes e segmentos a efetuar um tratamento eficaz da informação, que acreditamos ser essencial para o desenvolvimento e crescimento empresarial.', style: TextStyle(
                          fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300
                        ),),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text('Disponibilizamos para o mercado um sistema de gestão comercial. Este sistema foi desenvolvido com conceitos comerciais e financeiros universalmente reconhecidos e aplicados, fundamentada na essência destes conceitos que propulsionam os negócios da atualidade, respeitando na íntegra as determinações legais dos órgãos governamentais competentes.', style: TextStyle(
                          fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text('A Mestre acompanha de perto todas as suas implantações. Nos comprometemos e auxiliamos com a análise dos processos de nossos clientes e sua automatização, enumerando etapas e apresentando soluções para uma melhor administração empresarial.', style: TextStyle(
                          fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w300
                        ),),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('26 ', style: TextStyle(color: Colors.orange, fontSize: 25, fontWeight: FontWeight.w700),),
                                Text(' anos', style: TextStyle(color: Colors.orange, fontSize: 25),),
                              ],),
                              Text('de mercado', style: TextStyle(color: Colors.black54, fontSize: 15),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('60 ', style: TextStyle(color: Color.fromRGBO(0,68,101,1), fontSize: 25, fontWeight: FontWeight.w700),),
                                  Text('cidades', style: TextStyle(color: Color.fromRGBO(0,68,101,1), fontSize: 25),),
                                ],
                              ),

                              Text(' com clientes', style: TextStyle(color: Colors.black54, fontSize: 15),)
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 0.2,
                          width: double.infinity,
                          color: Colors.black54,
                        ),
                      ), //TODO Linha sinza
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('3600 ', style: TextStyle(color: Color.fromRGBO(0,68,101,20), fontSize: 25, fontWeight: FontWeight.w700),),
                                  Text('usuário', style: TextStyle(color: Color.fromRGBO(0,68,101,1), fontSize: 25),),
                                ],
                              ),

                              Text('utilizando nosso sistema', style: TextStyle(color: Colors.black54, fontSize: 15),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text('500 ', style: TextStyle(color: Colors.orange, fontSize: 25, fontWeight: FontWeight.w700),),
                                Text('empresas', style: TextStyle(color: Colors.orange, fontSize: 25),),
                              ],),
                              Text('mais de 500 empresas', style: TextStyle(color: Colors.black54, fontSize: 15),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
