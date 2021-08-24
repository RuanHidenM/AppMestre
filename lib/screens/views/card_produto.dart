import 'package:appmestre/screens/detalhesdoitem.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

//TODO Bloco card do produto
CardProduto (context, mediaWidth){
  return Column(
    children: [
      GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: mediaWidth / 3.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(1.0, 1.0,),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      //TODO: Bloco IMG do Produto
                      Expanded(
                        flex: 3,
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.black12,
                          size: mediaWidth / 5,
                        ),
                      ),

                      //TODO info do produto
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                //TODO: Bloco nome do produto
                                Container(
                                  height: mediaWidth / 6,
                                  //color:Colors.red,
                                  child: Container(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 9.0),
                                      child: Text(
                                        'Nome do Produto',
                                        overflow: TextOverflow.fade,
                                        // overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: mediaWidth / 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                //TODO Bloco valor e estoque do produto
                                Container(
                                  //color:Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      //TODO:Valor do Produto
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'R\$: 100,00',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: mediaWidth / 24
                                            ),
                                          ),
                                        ],
                                      ),

                                      //TODO: Estoque do produto
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.widgets,
                                              color: Color.fromRGBO(36, 82, 108, 60),
                                              size: mediaWidth/ 25,
                                            ),
                                          ),
                                          Text(
                                            '10',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: mediaWidth / 25
                                            ),
                                          ),
                                        ],
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
                )
              ],
            ),
          ),
        ),
        onDoubleTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetalhesDoItem()));
        },
      ),
    ],
  );
}