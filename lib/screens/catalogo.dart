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
  List<ProdutoCard> listaProdutos = [];


  void initState(){
    super.initState();
    _cardProdutoDao.findCardProduto().then(
        (value){
          setState((){
            listaProdutos = value;
          });
        }
    );
  }

  // void buscaProdutos() {
  //   listaProdutos = _cardProdutoDao.findCardProduto();
  // }

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
      //Todo: Listando os produot
      body:
      Container(
        child: FutureBuilder<List<ProdutoCard>>(
          future: _cardProdutoDao.findCardProduto(),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...'),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                return Container(
                  child: ListView.builder(
                    itemCount: listaProdutos.length,
                      itemBuilder: (context, index){
                        return Container(
                          //Todo: Enviando valores para a view card produto.

                          child: CardProduto(
                              context,
                              MediaWidth,
                              listaProdutos[index].nome,
                              listaProdutos[index].valor,
                              listaProdutos[index].estoque,
                              listaProdutos[index].imagem,
                              listaProdutos[index].produtoId
                          ),
                        );
                      }
                  ),
                );
                break;
            }
            return Text('Algo deu errado  :C ');
          }
        ),
      )

      // Container(
      //   child: SizedBox(
      //     child: ListView.builder(
      //       itemCount: listaProdutos.length,
      //         itemBuilder: (context, index){
      //           return Container(
      //             child: Text(listaProdutos[index].nome),
      //           );
      //         }
      //     ),
      //   ),
      // )


        //TODO: CARD DO PRODUTO
        //CardProduto(context, MediaWidth),
      ),
    );
  }
}