import 'package:appmestre/modelos/usuario.dart';
import 'package:appmestre/screens/views/card_produto.dart';
import 'package:appmestre/screens/views/drawerside.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Catalogo extends StatefulWidget {
  @override
  _catalogo createState() => _catalogo();
}

class _catalogo extends State<Catalogo> {
  get MediaWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return CardProduto(MediaWidth);
    //   DefaultTabController(
    //   initialIndex: 1,
    //   length: 3,
    //   child: Scaffold(
    //     resizeToAvoidBottomInset: false,
    //
    //     //enddrawer:DrawerSide(),
    //     appBar: AppBar(
    //       title: const Text('Catalogo'),
    //       backgroundColor: Color.fromRGBO(36, 82, 108, 55),
    //     ),
    //     body: Column(
    //       children: [
    //         GestureDetector(
    //           child: Padding(
    //             padding: const EdgeInsets.all(5),
    //             child: Container(
    //               height: MediaWidth / 3.3,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(5),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.grey,
    //                     offset: const Offset(1.0, 1.0,),
    //                     blurRadius: 5.0,
    //                     spreadRadius: 1.0,
    //                   ),
    //                 ],
    //               ),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.all(5),
    //                     child: Row(
    //                       children: [
    //                         //TODO: Bloco IMG do Produto
    //                         Expanded(
    //                           flex: 3,
    //                           child: Icon(
    //                             Icons.image_not_supported_outlined,
    //                             color: Colors.black12,
    //                             size: MediaWidth / 5,
    //                           ),
    //                         ),
    //
    //                         //TODO mais informações do produto
    //                         Expanded(
    //                           flex: 7,
    //                           child: Padding(
    //                             padding: const EdgeInsets.all(5),
    //                             child: Container(
    //                               child: Column(
    //                                 crossAxisAlignment: CrossAxisAlignment.stretch,
    //                                 //mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                                 children: [
    //
    //                                   //TODO: Bloco nome do produto
    //                                   Container(
    //                                       height:
    //                                           MediaQuery.of(context).size.height / 11,
    //                                       //color:Colors.red,
    //                                       child: Container(
    //                                         child: Padding(
    //                                           padding:
    //                                               const EdgeInsets.only(bottom: 9.0),
    //                                           child: Text(
    //                                             'Nome do Produto',
    //                                             overflow: TextOverflow.fade,
    //                                             // overflow: TextOverflow.ellipsis,
    //                                             style: TextStyle(
    //                                               color: Colors.black54,
    //                                               fontSize: MediaQuery.of(context).size.height / 48,
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //
    //                                   //TODO Bloco valor e estoque do produto
    //                                   Container(
    //                                     //color:Colors.blue,
    //                                     child: Row(
    //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                       crossAxisAlignment: CrossAxisAlignment.end,
    //                                       children: [
    //
    //                                         //TODO:Valor do Produto
    //                                         Row(
    //                                           crossAxisAlignment: CrossAxisAlignment.end,
    //                                           children: [
    //                                             Text(
    //                                               'R\$: 100,00',
    //                                               style: TextStyle(
    //                                                 color: Colors.green,
    //                                                 fontSize: MediaQuery.of(context).size.height / 45),
    //                                             ),
    //                                           ],
    //                                         ),
    //
    //                                         //TODO: Estoque do produto
    //                                         Row(
    //                                           children: [
    //                                             Padding(
    //                                               padding:
    //                                                   const EdgeInsets.only(right: 5),
    //                                               child: Icon(
    //                                                 Icons.widgets,
    //                                                 color: Color.fromRGBO(
    //                                                     36, 82, 108, 60),
    //                                                 size: MediaQuery.of(context)
    //                                                         .size
    //                                                         .height /
    //                                                     44,
    //                                               ),
    //                                             ),
    //                                             Text(
    //                                               '10',
    //                                               style: TextStyle(
    //                                                   color: Colors.black54),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ],
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //           onDoubleTap: () {},
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
