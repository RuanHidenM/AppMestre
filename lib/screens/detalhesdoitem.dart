import 'package:appmestre/components/resumo_text.dart';
import 'package:appmestre/screens/views/slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetalhesDoItem extends StatefulWidget {
  @override
  _detalhesDoItem createState() => _detalhesDoItem();
}

class _detalhesDoItem extends State<DetalhesDoItem> {
  get MediaWidth => MediaQuery.of(context).size.width;

  //TODO Valor padrao
  String dropdownvalue = 'Tabela avulsos';

  //TODO Valores do drop
  var items =  ['Tabela avulsos','Banana','Grapes','Orange','watermelon','Pineapple'];

  bool produtoativo = true;//TODO: Estado do produto, ativo = true ou desativo = false !
  bool produtoFavorito = false; //TODO: Estado do favorito do produto, ativo = true ou desativo = false !

  //TODO: Nome do produto
  String textteste = 'Computador Live ZE intel windows ULN3350430W DUAL core N3350 4GB SSD 30GB HDMI USB REDE WINDOWS 10';

  //TODO Lista das img dos produtos
  final List<String> imgList = [
    'images/cap.png',
    'images/comp-live.png',
    'images/logo_emporiofloriano.png',
    'images/note-lenovo.png',
  ];

  CarouselController buttonCarouselControllerItem = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                '${resumoText(3, textteste)}', style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaWidth < 400
                      ? MediaWidth / 20
                      : MediaWidth / 25
                ),
              ),
            ),
          backgroundColor: Color.fromRGBO(36, 82, 108, 55),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: [
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
                          Text('Cód:1558', style: TextStyle(
                            color: Colors.black54
                          ),),
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

                //TODO Slide do produto
                CarouselSliders(MediaWidth, buttonCarouselControllerItem, imgList),

                //TODO: Valor e quantidade do produto
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
                                fontSize: MediaWidth < 400
                                    ? MediaWidth / 20
                                    : MediaWidth / 22,
                                color: Colors.green,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '88 un',
                            style: TextStyle(
                                fontSize: MediaWidth < 400
                                    ? MediaWidth / 22
                                    : MediaWidth / 24,
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
                         color: Colors.black54,
                          fontSize: MediaWidth < 400
                              ? MediaWidth / 21
                              : MediaWidth / 24),
                    ),
                  ),
                ),

                //TODO Texto de 'Detalhes do Produto'.
                Container(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(' - Detalhes do produto',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: MediaWidth < 400
                            ? MediaWidth / 24
                            : MediaWidth / 28,
                    ),
                  ),
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
                            height: MediaWidth < 400
                            ? 40
                            : 50,
                            color: Colors.grey.shade200,
                            child: Text(
                                'Familia',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade300,
                            child: Text(
                                'Equipamento ',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
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
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade300,
                            child: Text(
                                'Estoque ',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade200,
                            child: Text(
                                '10.0 ',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
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
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade200,
                            child: Text(
                                'NCM ',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade300,
                            child: Text(
                                '8471.50.10 ',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
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
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade300,
                            child: Text(
                                'Ref ',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade200,
                            child: Text(
                                '2084',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
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
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade200,
                            child: Text(
                                'Medida',
                                style: TextStyle(
                                  fontSize:MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade300,
                            child: Text(
                                'Unidade',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
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
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade300,
                            child: Text(
                                'Grupo ',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade200,
                            child: Text(
                                'Grupo01',
                                style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
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
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade200,
                            child: Text(
                              'SubGrupo',
                              style: TextStyle(
                                fontSize: MediaWidth / 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade300,
                            child: Text(
                              'SubGrupo01',
                              style: TextStyle(
                                fontSize: MediaWidth / 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54
                              ),
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
                            height: MediaWidth < 400
                                ? 40
                                : 50,
                            color: Colors.grey.shade300,
                            child: Text(
                              'Tabela Preco',
                              style: TextStyle(
                                  fontSize: MediaWidth / 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaWidth / 2.2,
                            height: MediaWidth < 400
                              ? 40
                              : 50,
                            color: Colors.grey.shade200,
                            child:
                            DropdownButton<String>(
                              underline: SizedBox(),
                              value: dropdownvalue,
                              icon: Icon(Icons.keyboard_arrow_down, color: Colors.orange, size: 30,),
                              items: items.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(
                                    value, style: TextStyle(
                                      fontSize: MediaWidth / 25,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54
                                    ),
                                  ),
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
