import 'package:appmestre/components/calculaporcentagementredoisvalores.dart';
import 'package:flutter/material.dart';

//TODO Bloco card do produto
CardCaixaBanco (context, MediaWidth){
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      children: [
        //TODO: Bloco
        //TODO NOME, TIPO e Saldo
        Container(
          height: MediaWidth / 3.5,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    // Container(
                    //   //color: Colors.red,
                    //     height: double.infinity,
                    //     child: Column(
                    //       children: [
                    //           Expanded(
                    //             child: charts.PieChart(
                    //               _seriesPieData,
                    //               animate: true,
                    //               animationDuration:
                    //               Duration(seconds: 1),
                    //               defaultRenderer: new charts
                    //                   .ArcRendererConfig(
                    //                 arcWidth: 7, //TODO: rosca
                    //                 //arcRendererDecorators: [
                    //                 // new charts.ArcLabelDecorator(
                    //                 //     labelPosition: charts.ArcLabelPosition.inside,
                    //                 //     insideLabelStyleSpec: charts.TextStyleSpec(
                    //                 //       fontSize: 6,
                    //                 //     )
                    //                 // )
                    //                 //]
                    //               ),
                    //             ),
                    //           ),
                    //       ],
                    //     )),

                    Center(
                      child: Icon(
                          Icons.circle,
                          size: MediaWidth / 4,
                          color: Colors.green.shade100
                      ),
                    ),
                    //TODO BLOCO Porcentagem
                    Center(
                      child: Text(
                        '${calcularPorcentagemEntreDoisValores(subValor: 150.00, total: 1500.00)}%',
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            fontSize: MediaWidth / 25),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                          width: 0.2,
                          color: Colors.black54),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        //TODO BLOCO nome do caixa e banco
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Nome do Caixa ou do Banco',
                              style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                //TODO: Tipo:  caixa ou banco (img)
                                Row(
                                  children: [
                                    Container(
                                      height: MediaWidth / 14.5,
                                      width: MediaWidth / 3.7,
                                      child: Text('tipo 1 ou 2'),
                                      // decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //         image: MemoryImage(bytesImg)
                                      //     )
                                      // )
                                    )
                                  ],
                                ),

                                //TODO: Valor total do Caixa ou Banco
                                Row(
                                  children: [
                                    Text(
                                      ' R\$: 1500,00',
                                      style: TextStyle(
                                        fontSize: MediaWidth / 25,
                                        color: Colors.green,
                                      ),
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
              )
            ],
          ),
        ),
        Container(
          height: 0.5,
          color: Colors.grey,
        )
      ],
    ),
  );
}