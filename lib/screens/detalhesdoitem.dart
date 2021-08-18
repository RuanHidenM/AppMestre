import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalhesDoItem extends StatefulWidget {
  @override
  _detalhesDoItem createState() => _detalhesDoItem();
}

class _detalhesDoItem extends State<DetalhesDoItem> {
  get MediaWidth => MediaQuery.of(context).size.width;
  String dropdownvalue = 'Tabela avulsos';
  var items =  ['Tabela avulsos','Banana','Grapes','Orange','watermelon','Pineapple'];
  bool produtoativo = true;//TODO: Estado do produto, ativo = true ou desativo = false !
  bool produtoFavorito = false; //TODO: Estado do favorito do produto, ativo = true ou desativo = false !
  final List<String> imgList = [
    'images/cap.png',
    'images/comp-live.png',
    'images/logo_emporiofloriano.png',
    'images/note-lenovo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Computador Live ZE INTEL', style: TextStyle(fontWeight: FontWeight.w700),)),
          backgroundColor: Color.fromRGBO(36, 82, 108, 55),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                //TODO: Bloco Title do Produto.
                // Container(
                //   width: double.infinity,
                //   height: MediaWidth / 10,
                //   //color: Colors.black12,
                //   child: Center(
                //     child: Text(
                //       'Computador Live ZE INTEL',
                //       style: TextStyle(
                //           fontSize: MediaWidth / 19,
                //           color: Colors.black87,
                //           fontWeight: FontWeight.w400),
                //     ),
                //   ),
                // ),

                //TODO: Bloco codigo do produto e favorito.
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text('Cód:1558'),
                        ],
                      ),
                      produtoFavorito == true ?
                      //TODO: Estrela de favorito (ativo)
                      GestureDetector(
                          child: Icon(
                            Icons.star, color: Colors.orange,size: 25,
                          ),
                        onTap: (){
                            setState(() {
                              produtoFavorito = false;
                            });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                children: [
                                  Text('Produto removido do Favoritos.  '),
                                  Icon(Icons.star, color: Colors.orange,),
                                ],
                              ),
                            )
                          );
                        },
                      )
                      :

                      //TODO: Estrela de favorito (desativo)
                      GestureDetector(
                        child: Icon(
                          Icons.star_border, color: Colors.grey,size: 25,
                        ),
                        onTap: (){
                          setState(() {
                            produtoFavorito = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  children: [
                                    Text('Produto adicionado ao favoritos.  '),
                                    Icon(Icons.star, color: Colors.orange,),
                                  ],
                                ),
                              )
                          );
                        },
                      ),
                    ],
                  ),
                ),

                //TODO: Bloco img do Produto.
                Container(
                    width: double.infinity,
                    height: MediaWidth / 1.8,
                    //color: Colors.orange.shade100,
                    child: CarouselSlider(
                      options: CarouselOptions(height: 400.0),
                      items: imgList.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 35, right: 35),
                          child: Container(
                            child: Center(
                              child: Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: 1000,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )),

                //TODO: Bloco valor e estoque.
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  width: double.infinity,
                  height: MediaWidth / 11,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'R\$: 1.800,99',
                            style: TextStyle(
                                fontSize: MediaWidth / 20,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '88 un',
                            style: TextStyle(
                                fontSize: MediaWidth / 22,
                                fontWeight: FontWeight.w300,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //TODO: Descrição do Produto.
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                        //color: Colors.blueGrey,
                        border: Border(
                            bottom:
                                BorderSide(width: 0.2, color: Colors.black))),
                    child: Text(
                      'Computador Live ZE intel windows ULN3350430W DUAL core N3350 4GB SSD 30GB HDMI USB REDE WINDOWS 10',
                      style: TextStyle(
                          fontSize: MediaWidth / 21, color: Colors.black54),
                    ),
                  ),
                ),

                //TODO Texto de 'Detalhes do Produto'.
                Container(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(' - Detalhes do produto', style: TextStyle(fontSize: 19, color: Colors.black54, fontWeight: FontWeight.w700),),
                ),

                //TODO: Mais detalhes do produto.
                Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade200,
                            child: Text('Familia', style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade300,
                            child: Text('Equipamento ', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
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
                            height: 40,
                            color: Colors.grey.shade300,
                            child: Text('Estoque ', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade200,
                            child: Text('10.0 ', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
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
                            height: 40,
                            color: Colors.grey.shade200,
                            child: Text('NCM ', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade300,
                            child: Text('8471.50.10 ', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
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
                            height: 40,
                            color: Colors.grey.shade300,
                            child: Text('Ref ', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade200,
                            child: Text('2084', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
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
                            height: 40,
                            color: Colors.grey.shade200,
                            child: Text('Medida', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade300,
                            child: Text('Unidade', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
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
                            height: 40,
                            color: Colors.grey.shade300,
                            child: Text('Grupo ', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade200,
                            child: Text('Grupo01', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
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
                            height: 40,
                            color: Colors.grey.shade200,
                            child: Text('SubGrupo', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade300,
                            child: Text('SubGrupo01', style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
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
                            height: 40,
                            color: Colors.grey.shade300,
                            child: Text('Tabela Preco', style: TextStyle(
                                fontSize: 19,
                              fontWeight: FontWeight.w400,
                                color: Colors.black54
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: 40,
                            color: Colors.grey.shade200,
                            child:
                            DropdownButton<String>(
                              underline: SizedBox(),
                              value: dropdownvalue,
                              icon: Icon(Icons.keyboard_arrow_down, color: Colors.orange, size: 30,),
                              items: items.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value, style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                      color: Colors.black54
                                )),
                                );
                              }).toList(),
                              onChanged: (value) {
                                //dropdownvalue = value!;
                                //dropdownvalue = value!;
                              },
                            )
                            // Text('-----', style: TextStyle(
                            //     fontSize: 19,
                            //     fontWeight: FontWeight.w400
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ],
                  ),

                //TODO: Bloco de espaçamento em branco.
                Container(
                  width: double.infinity,
                  height: 30,
                )
              ],
            ),
        ),
    );
  }
}