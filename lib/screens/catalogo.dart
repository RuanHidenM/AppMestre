import 'package:appmestre/screens/home.dart';
import 'package:appmestre/screens/views/card_produto.dart';
import 'package:appmestre/screens/views/drawer_filtro_catalogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Catalogo extends StatefulWidget {
  @override
  _catalogo createState() => _catalogo();
}

class _catalogo extends State<Catalogo> {
  get MediaWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        endDrawer: drawerFiltroCatalogo(),
        appBar: AppBar(
          //TODO: Botão de returno
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
          ),
          title: const Text(
            'Catalogo',
            style: TextStyle(

            ),
          ),
          backgroundColor: Color.fromRGBO(36, 82, 108, 55),
        ),
        body: CardProduto(context, MediaWidth),
      ),
    );
  }
}