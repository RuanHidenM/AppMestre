import 'package:flutter/material.dart';

drawerFiltroCatalogo (mediaWidth){
  return Container(
    width: mediaWidth / 1.45,
    child: Drawer(
      child: ListView(

        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: mediaWidth / 2.5,
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
                        size: mediaWidth / 16,
                      ),
                      Text(
                        'Filtro Catalogo',
                        style: TextStyle(
                            color: Colors.white, fontSize: mediaWidth / 20),
                      ),
                    ],
                  ),
                  Text(
                    'Selecione uma das opções para efetuar o filtro no catalogo.',
                    style: TextStyle(
                        color: Colors.white70, fontSize: mediaWidth / 29),
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
                          size: mediaWidth / 12,
                          color: Colors.black54,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Ordenar Catalogo',
                          style: TextStyle(
                              fontSize: mediaWidth / 21,
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
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 10,
                              ),
                              child: Icon(
                                  Icons.filter_list_rounded,
                                  color: Colors.black54,
                                  size: mediaWidth / 13
                              ),
                          ),
                        ],
                      ),
                      onTap: () {
                      },
                    ),
                  ],
                ),
              )
          ),
          //TODO: Filtro por Ordenar Catalogo

        ],
      ),
    ),
  );
}