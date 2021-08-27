import 'package:appmestre/screens/detalhesdoitem.dart';
import 'package:flutter/material.dart';

//TODO Bloco card do produto
CardProduto (context, mediaWidth){
  return Column(
    children: [
      GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height:mediaWidth < 400
                ? mediaWidth / 3.3
                : mediaWidth / 4.3,
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
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      //TODO: Bloco IMG do Produto
                      Expanded(
                        flex: 4,
                        // child: Icon(
                        //   Icons.image_not_supported_outlined,
                        //   color: Colors.black12,
                        //   size: mediaWidth / 5,
                        // ),
                        child: Container(
                          //color: Colors.blue,
                            child: Image.asset('images/note-acer.png')
                        ),
                      ),

                      //TODO info do produto
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                //TODO: Bloco nome do produto
                                Container(
                                  height: mediaWidth < 400
                                      ? mediaWidth / 6
                                      : mediaWidth / 7,
                                 // color:Colors.white,
                                  child: Container(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 9.0),
                                      child: Text(
                                        'Nome do Produto',
                                        //'Essa é uma descrição grande do produto, fim é bem grande mesmo',
                                        overflow: TextOverflow.fade,
                                        // overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: mediaWidth < 400
                                              ? mediaWidth / 22
                                              : mediaWidth / 27
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
                                                fontSize: mediaWidth < 400
                                                    ? mediaWidth / 24
                                                    : mediaWidth / 28
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
                                              size: mediaWidth < 400
                                                  ? mediaWidth / 25
                                                  : mediaWidth / 30
                                            ),
                                          ),
                                          Text(
                                            '10',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: mediaWidth < 400
                                                    ? mediaWidth / 25
                                                    : mediaWidth / 30
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
            context, MaterialPageRoute(
              builder: (context) => DetalhesDoItem(),
            ),
          );
        },
      ),
    ],
  );
}