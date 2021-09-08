import 'package:appmestre/database/dao/card_produto.dart';
import 'package:appmestre/database/dao/empresa_dao.dart';
import 'package:appmestre/modelos/produto.dart';
import 'package:appmestre/modelos/produto_card.dart';
import 'package:appmestre/screens/home.dart';
import 'package:appmestre/screens/views/card_produto.dart';
import 'package:appmestre/screens/views/drawer_filtro_catalogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Catalogo extends StatefulWidget {
  @override
  _catalogo createState() => _catalogo();
}

class _catalogo extends State<Catalogo> {
  get MediaWidth => MediaQuery.of(this.context).size.width;

  final _cardProdutoDao = CardProdutoDao();
  var listaProdutos;


  void initState(){
    super.initState();
    buscaProdutos();
  }

  void buscaProdutos() {
    listaProdutos = _cardProdutoDao.findCardProduto();
  }

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

      body:Text('teste'),
      // produtos == null ? CircularProgressIndicator():
      // FutureBuilder<List<ProdutoCard>>(
      // initialData: [],
      //     future: produtos,
      //     builder: (context, snapshot) {
      //       switch(snapshot.connectionState){
      //         case ConnectionState.none:
      //           break;
      //         case ConnectionState.waiting:
      //           return Center(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 CircularProgressIndicator(),
      //                 Text('Carregando...'),
      //               ],
      //             ),
      //           );
      //           break;
      //         case ConnectionState.active:
      //           break;
      //         case ConnectionState.done:
      //           return ListView.builder(
      //             itemBuilder: (context, idenx) {
      //               final ProdutoCard produtoCard = produtos[idenx];
      //               return Text('${produtoCard.estoque}');
      //             },
      //             itemCount: produtos.length,
      //           );
      //           break;
      //       }
      //       return Text('Erro na pagina');
      //     }
      // ),

        //TODO: CARD DO PRODUTO
        //CardProduto(context, MediaWidth),

      ),
    );
  }
}