import 'dart:math';

import 'package:appmestre/globals.dart';
import 'package:flutter/material.dart';

class drawerFiltroCatalogo extends StatefulWidget{
  @override
  _drawerFiltroCatalogo createState() => _drawerFiltroCatalogo();
}


class _drawerFiltroCatalogo extends State<drawerFiltroCatalogo> {

  get MediaWidth => MediaQuery.of(context).size.width;
  String dropdownValueFamilia = 'Selecione uma Familia';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaWidth / 1.45,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: MediaWidth / 2.5,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white70,
                          size: MediaWidth / 16,
                        ),
                        Text(
                          'Filtro Catalogo',
                          style: TextStyle(
                              color: Colors.white, fontSize: MediaWidth / 20),
                        ),
                      ],
                    ),
                    Text(
                      'Selecione uma das opções para efetuar o filtro no catalogo.',
                      style: TextStyle(
                          color: Colors.white70, fontSize: MediaWidth / 29),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromRGBO(36, 82, 108, 1),
                      //TODO Azul 4/4
                      Color.fromRGBO(36, 82, 108, 15),
                      //TODO AZUL 3/4. BRANCO 1/4
                      Color.fromRGBO(36, 82, 108, 30),
                      //TODO AZUL 2/4, BRANCO 2/4
                      Color.fromRGBO(36, 82, 108, 45),
                      //TODO AZUL 1/4, BRANCO 3/4
                      Color.fromRGBO(36, 82, 108, 50),
                      //TODO BRANCO 4/4
                    ],
                  ),
                ),
              ),
            ),  //TODO: Top bar da barra lateral filtro

            //TODO: Filtrando direto pelo nome TextField
            Container(
                color: Color.fromARGB(100, 234, 234, 234),
                child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 0.1,
                                color: Colors.black54
                            ),
                          )
                      ),

                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(Icons.sort,
                              size: MediaWidth / 14,
                              color: Colors.black54,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Filtro direto',
                              style: TextStyle(
                                  fontSize: MediaWidth / 23,
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                        //controller: _senhaUser,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black54,
                          ),
                          labelText: 'Nome do produto',
                        ),
                      ),
                    )
                )
            ),
            //TODO: Filtro por Ordenar Catalogo
            Container(
                color: Color.fromARGB(100, 234, 234, 234),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 0.1,
                              color: Colors.black54
                          ),
                        )
                    ),

                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.art_track,
                            size: MediaWidth / 12,
                            color: Colors.black54,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Ordenar Catalogo',
                            style: TextStyle(
                                fontSize: MediaWidth / 23,
                                color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 10,
                                      ),
                                      child:
                                      filtroCatalogoOrdenarEstoque == true ?
                                      Icon(
                                          Icons.filter_list_rounded,
                                          color: Colors.black54,
                                          size: MediaWidth / 13
                                      )
                                          :
                                      Transform.rotate(
                                        angle: 180 * pi / 180,
                                        child: Icon(Icons.filter_list_rounded,
                                            color: Colors.black54,
                                            size: MediaWidth / 13),
                                      )
                                  ),
                                  filtroCatalogoOrdenarEstoque == true
                                      ? Text('Maior Estoque')
                                      : Text('Menor Estoque'),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_left_outlined,
                              color: Colors.orange,
                            )
                          ],
                        ),
                        onTap: () {
                          filtroCatalogoOrdenarEstoque == true
                            ? setState((){filtroCatalogoOrdenarEstoque = false;})
                            : setState((){filtroCatalogoOrdenarEstoque = true;});
                        },
                      ),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 10,
                                      ),
                                      child: filtroCatalogoOrdenarValor == true
                                          ? Icon(
                                          Icons.filter_list_rounded,
                                          color: Colors.black54,
                                          size: MediaWidth / 13
                                      )
                                          : Transform.rotate(
                                            angle: 180 * pi / 180,
                                            child: Icon(Icons.filter_list_rounded,
                                            color: Colors.black54,
                                            size: MediaWidth / 13),
                                      )
                                  ),
                                  filtroCatalogoOrdenarValor == true
                                      ? Text('Maior Valor')
                                      : Text('Menor Valor'),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_left_outlined,
                              color: Colors.orange,
                            )
                          ],
                        ),
                        onTap: () {
                          filtroCatalogoOrdenarValor == true
                              ? setState((){filtroCatalogoOrdenarValor = false;})
                              : setState((){filtroCatalogoOrdenarValor = true;});
                        },
                      ),
                    ],
                  ),
                )
            ),
            //TODO: Filtro por Familia
            Padding(
              padding: const EdgeInsets.only(top:5),
              child: Container(
                color: Color.fromARGB(100, 234, 234, 234),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title:  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(Icons.auto_awesome_motion,
                            size: MediaWidth / 17,
                            color: Colors.black54 ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Familia',
                          style: TextStyle(
                              fontSize: MediaWidth / 21,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  subtitle:
                  Container(
                    width: double.infinity,
                    child: Center(
                      child: DropdownButton<String>(
                        value: dropdownValueFamilia,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 18
                        ),
                        underline: Container(
                          height: 0,
                        ),
                        // onChanged: (String newValue) {
                        //   setState(() {
                        //     dropdownValueFamilia = newValue;
                        //   });
                        // },

                        items: <String>['Selecione uma Familia','One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}