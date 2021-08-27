import 'package:appmestre/canvas/canvas_screen-login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dashboardHome extends StatefulWidget{
  _dashboardHome createState() => _dashboardHome();
}

class _dashboardHome extends State<dashboardHome>{
  get MediaWidth => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15, right: 15),
            child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
             // color: Colors.blue,
              //TODO: Text Dashboard e nome da empresa
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard,',
                    style: GoogleFonts.lato(
                      textStyle:TextStyle(
                        color: Colors.black26,
                        fontSize: MediaWidth / 15,
                      )
                    ),
                  ),
                  Text('Mestre Sistemas',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.black87,
                        fontSize: MediaWidth / 13,
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),

          //Todo Bloco Grafico caixa e banco
          Padding(
            padding: const EdgeInsets.only(left:12, right: 12),
            child: Container(
              padding: EdgeInsets.all(15),
              height: 200,
              //color: Colors.yellow,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(19),
                ),
                gradient: LinearGradient(
                  begin:Alignment.topCenter,
                  end:Alignment.bottomLeft,
                  colors: [
                    //TODO Azul 4/4
                    Color.fromRGBO(36, 82, 108, 1),

                    //TODO AZUL 3/4. BRANCO 1/4
                    Color.fromRGBO(36, 82, 108, 15),

                    //TODO AZUL 2/4, BRANCO 2/4
                    Color.fromRGBO(36, 82, 108, 30),

                    //TODO AZUL 1/4, BRANCO 3/4
                    Color.fromRGBO(36, 82, 108, 45),

                    //TODO BRANCO 4/4
                    Color.fromRGBO(36, 82, 108, 50),

                  ],
                ),
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Caixa Banco',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaWidth / 17,
                            fontWeight: FontWeight.w400
                        )
                      ),

                      Text(
                        'R\$: 307.105,90',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaWidth / 20,
                            fontWeight: FontWeight.w400
                        )
                      ),
                    ],
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}