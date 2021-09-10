import 'dart:math';

import 'package:appmestre/screens/charts/chart_caixa_banco.dart';
import 'package:appmestre/screens/charts/produtos_destaque.dart';
import 'package:appmestre/screens/views/card_produto.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class dashboardHome extends StatefulWidget {
  _dashboardHome createState() => _dashboardHome();
}

class _dashboardHome extends State<dashboardHome> {
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
            padding: const EdgeInsets.only(left: 15, right: 15),
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
                      textStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: MediaWidth / 15,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mestre Sistemas',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: MediaWidth / 13,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          '$formattedDate',
                          style: TextStyle(
                            color: Colors.black26,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          //Todo Bloco Grafico caixa e banco
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              //height: 290,
              //color: Colors.yellow,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(19),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
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
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'R\$: 307.105,90',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
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
                    padding: const EdgeInsets.only(
                        right: 15, top: 10, left: 12, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(36, 82, 108, 10),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mais detalhes',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
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
              ),
            ),
          ),

          //TODO Bloco Produto
          // Padding(
          //   padding:
          //       const EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 40),
          //   child: Container(
          //     padding: EdgeInsets.only(bottom: 10),
          //     //height: 290,
          //     //color: Colors.yellow,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(19),
          //       ),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black87,
          //           offset: const Offset(
          //             1.0,
          //             1.0,
          //           ),
          //           blurRadius: 9.0,
          //           spreadRadius: 0.2,
          //         ),
          //       ],
          //       // gradient: LinearGradient(
          //       //   begin: Alignment.topCenter,
          //       //   end: Alignment.bottomLeft,
          //       //   colors: [
          //       //     Color.fromRGBO(36, 82, 108, 10),
          //       //     //TODO AZUL 3/4. BRANCO 1/4
          //       //     Color.fromRGBO(36, 82, 108, 25),
          //       //     //TODO AZUL 2/4, BRANCO 2/4
          //       //     Color.fromRGBO(36, 82, 108, 45),
          //       //     //TODO AZUL 1/4, BRANCO 3/4
          //       //     Color.fromRGBO(36, 82, 108, 70),
          //       //     //TODO BRANCO 4/4
          //       //     Color.fromRGBO(36, 82, 108, 80),
          //       //   ],
          //       // ),
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(15.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 'Produto',
          //                   style: TextStyle(
          //                       color: Colors.black54,
          //                       fontSize: 21,
          //                       fontWeight: FontWeight.w700,
          //                   ),
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Padding(
          //                     padding: const EdgeInsets.only(bottom: 2),
          //                     child: Text(
          //                       'Total:  ',
          //                       style: TextStyle(
          //                           color: Colors.black54,
          //                           fontSize: 12,
          //                           fontWeight: FontWeight.w300,
          //                       ),
          //                     ),
          //                   ),
          //                   Text(
          //                     '1.585 ',
          //                     style: TextStyle(
          //                       color: Colors.black54,
          //                       fontSize: 22,
          //                       fontWeight: FontWeight.w600,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             //TODO MAIS VENDIDO
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(left: 20),
          //                   child: Row(
          //                     children: [
          //                       Text(
          //                         'Produtos mais vendido',
          //                         style: TextStyle(
          //                           color: Colors.black54,
          //                           fontSize: MediaWidth / 22
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: const EdgeInsets.only(left: 5),
          //                         child: Icon(Icons.show_chart, color: Colors.green, size: MediaWidth / 15,),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.all(10),
          //                   child: Container(
          //                     width: double.infinity,
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         ProdutoDestaque(),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             //TODO BARRA BRANCA
          //             Padding(
          //               padding: const EdgeInsets.only(bottom: 10, top: 10),
          //               child: Container(
          //                 height: 0.2,
          //                 color: Colors.black,
          //               ),
          //             ),
          //             //TODO MENOS VENDIDO
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(left: 20),
          //                   child: Row(
          //                     children: [
          //                       Text(
          //                         'Produtos menos vendido',
          //                         style: TextStyle(
          //                           color: Colors.black54,
          //                             fontSize: MediaWidth / 22
          //                         ),
          //                       ),
          //                       Padding(
          //                         padding: const EdgeInsets.only(left: 5),
          //                         child: Icon(Icons.show_chart, color: Colors.red, size: MediaWidth / 15,),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.all(5),
          //                   child: Container(
          //                     padding: EdgeInsets.all(10),
          //                     width: double.infinity,
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         //TODO: Lista de destque produtos dashboard
          //                         ProdutoDestaque(),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             //TODO BOTÃO MAIS DETALHES RELATORIO DO PRODUTO
          //             Padding(
          //               padding: const EdgeInsets.only(top: 10,bottom: 10  , left: 10, right: 10),
          //               child: Container(
          //                 decoration: BoxDecoration(
          //                   color:  Color.fromRGBO(36, 82, 108, 10),
          //                   borderRadius: BorderRadius.all(
          //                     Radius.circular(15),
          //                   ),
          //                 ),
          //                 height: 40,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Text(
          //                       'Relatórios do produto',
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.w700,
          //                         fontSize: 15,
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 5),
          //                       child: Icon(
          //                         Icons.arrow_forward_ios_outlined,
          //                         size: 16,
          //                         color: Colors.white,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          //TODO Title: Detalhes do Produtos

          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //height: 100,
                  //color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25, bottom: 0, left: 15, right: 15),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      width: MediaWidth,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 0.3, color: Colors.black))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Produto',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: MediaWidth / 14,
                              ),
                            ),
                          ),
                          Text(
                            'Detalhes dos Produtos',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: MediaWidth / 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          'Produtos mais vendido',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ),
                      Icon(
                        Icons.show_chart,
                        color: Colors.green,

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: ProdutoDestaque(),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(bottom: 5),
                //         child: Text('Produtos menos vendido', style: TextStyle(
                //           fontSize: 20,
                //           color: Colors.black54
                //         ),
                //         ),
                //       ),
                //       Icon(Icons.show_chart, color: Colors.red,),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                //   child: ProdutoDestaque(),
                // ),

                Container(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ' - Dados Gerais',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w700,
                        fontSize: MediaWidth < 400
                            ? MediaWidth / 24
                            : MediaWidth / 28,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade200,
                      child: Text(
                        'Produtos cadastrados:',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade300,
                      child: Text(
                        '98495',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade300,
                      child: Text(
                        'Produtos em estoque: ',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade200,
                      child: Text(
                        '25893',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade200,
                      child: Text(
                        'Custo liquido: ',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade300,
                      child: Text(
                        'R\$: 509,0',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade300,
                      child: Text(
                        'Custo Fornecedor: ',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade200,
                      child: Text(
                        'R\$: 2.030,0',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade200,
                      child: Text(
                        'Custo Medio: ',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.centerLeft,
                      width: MediaWidth / 2.2,
                      height: MediaWidth < 400 ? 40 : 50,
                      color: Colors.grey.shade300,
                      child: Text(
                        'R\$: 1.000,0',
                        style: TextStyle(
                            fontSize: MediaWidth / 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
