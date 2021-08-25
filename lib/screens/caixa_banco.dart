import 'package:appmestre/components/calculaporcentagementredoisvalores.dart';
import 'package:appmestre/screens/views/card_caixa_banco.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaixaBanco extends StatefulWidget{
  _caixaBanco createState() => _caixaBanco();
}

class _caixaBanco extends State<CaixaBanco> {
  get MediaWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //TODO: Cor top bar
        backgroundColor: Color.fromRGBO(36, 82, 108, 25),
        title: Text('Caixa e banco'),
      ),
      body: Column(
        children: [
          CardCaixaBanco(context, MediaWidth),
        ],
      )
    );
  }
}