import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdutoDestaque extends StatefulWidget {
  _produtoDestaque createState() => _produtoDestaque();
}

class _produtoDestaque extends State<ProdutoDestaque> {
  CarouselController buttonCarouselControllerItem = CarouselController();

  get MediaWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaWidth / 2,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 500.0),
            items: [2].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Column(
                              children: [
                                //TODO IMG E NOME
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      //TODO IMG PRODUTO
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Image.asset(
                                              'images/comp-live.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      //todo nome
                                      Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Container(
                                            padding: EdgeInsets.only(),
                                            height: double.infinity,
                                            child: Center(
                                              child: Text(
                                                'Nome do produto grande, para exemplificar ',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //TODO: 'TOTAL VENDIDOS'
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '12.456 vendido no ultimos 15 dias',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),

                                //TODO: 'IR PARA O PRODUTO'
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                      left: 5,
                                      bottom: 10,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(36, 82, 108, 55),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Ir para o produto',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        // child: Icon(
                        //   Icons.looks_one,
                        //   color: Colors.orange,
                        // ),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.orange,
                          child: Text(
                            i.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
