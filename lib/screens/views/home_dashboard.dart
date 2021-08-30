
import 'package:appmestre/screens/charts/chart_caixa_banco.dart';
import 'package:appmestre/screens/views/card_produto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class dashboardHome extends StatefulWidget{
  _dashboardHome createState() => _dashboardHome();
}

class _dashboardHome extends State<dashboardHome>{
  get MediaWidth => MediaQuery.of(context).size.width;

  //TODO: Data Atual
  var now = new DateTime.now();
  var formatter = new DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    //TODO: Aplicando o filtro na data
    String formattedDate = formatter.format(now);

    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15, right: 15),
            child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
              // color: Colors.blue,
              //TODO: Text Dashboard e nome da empresa
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard,',
                    style: GoogleFonts.lato(
                      textStyle:TextStyle(
                        color: Colors.black26,
                        fontSize: MediaWidth / 15,
                      )
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mestre Sistemas',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.black87,
                            fontSize: MediaWidth / 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('$formattedDate', style: TextStyle(color: Colors.black26, fontWeight: FontWeight.w700, fontSize: 14),),
                      ),
                    ],
                  ),
                ],
              )
            ),
          ),

          //Todo Bloco Grafico caixa e banco
          Padding(
            padding: const EdgeInsets.only(left:5, right: 5),
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              //height: 290,
              //color: Colors.yellow,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(19),
                ),
                gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomLeft,
                  colors: [
                    //TODO Azul 4/4
                    Color.fromRGBO(36, 82, 108, 10),
                    //TODO AZUL 3/4. BRANCO 1/4
                    Color.fromRGBO(36, 82, 108, 25),
                    //TODO AZUL 2/4, BRANCO 2/4
                    Color.fromRGBO(36, 82, 108, 45),
                    //TODO AZUL 1/4, BRANCO 3/4
                    Color.fromRGBO(36, 82, 108, 70),
                    //TODO BRANCO 4/4
                    Color.fromRGBO(36, 82, 108, 80),
                  ],
                ),
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Caixa Banco',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaWidth / 17,
                              fontWeight: FontWeight.w700
                          )
                        ),

                        Text(
                          'R\$: 307.105,90',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaWidth / 20,
                              fontWeight: FontWeight.w400
                          )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13, left: 5, right: 20),
                      child: Container(
                        //color: Colors.yellow,
                        child: LineChartSample2(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      height: 40,
                      width: 150,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mais detalhes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                fontSize: 15
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:5),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                    ),
                  ),
                ],
              )
            ),
          ),

          //TODO Bloco Produto
          Padding(
            padding: const EdgeInsets.only(top: 15, left:5, right: 5, bottom: 40),
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              //height: 290,
              //color: Colors.yellow,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(19),
                ),
                gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomLeft,
                  colors: [
                    //TODO Azul 4/4
                    Color.fromRGBO(36, 82, 108, 10),
                    //TODO AZUL 3/4. BRANCO 1/4
                    Color.fromRGBO(36, 82, 108, 25),
                    //TODO AZUL 2/4, BRANCO 2/4
                    Color.fromRGBO(36, 82, 108, 45),
                    //TODO AZUL 1/4, BRANCO 3/4
                    Color.fromRGBO(36, 82, 108, 70),
                    //TODO BRANCO 4/4
                    Color.fromRGBO(36, 82, 108, 80),
                  ],
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Produto',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaWidth / 17,
                              fontWeight: FontWeight.w600
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '1.585 ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaWidth / 20,
                                  fontWeight: FontWeight.w600
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                'CADATRADO',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: MediaWidth / 35,
                                    fontWeight: FontWeight.w300
                                )
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Produtos mais vendido',
                          style: TextStyle(
                              color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: CardProduto(context, MediaWidth),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}