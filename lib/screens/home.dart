import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/http/http_verifica_token.dart';
import 'package:appmestre/screens/views/drawerside.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  _homePage createState() => _homePage();
}

class _homePage extends State<HomePage>{
  get MediaWidth => MediaQuery.of(context).size.width;
  var snapshots;
  String EmailIdentificado = '';
  var resultado;
  var userLogadoEmail;
  final _userDao = UserDao();


  //Todo: img do home page
  final List<String> imgList = [
    'images/Logo_Mestre_-_Completo.png',
    'images/logo_emporiofloriano.png',
  ];

  void initState(){
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        drawer:DrawerSide(),
        drawerEdgeDragWidth: MediaWidth / 3 ,
        drawerScrimColor: Colors.black26,
        appBar: AppBar(
          shadowColor: Color.fromRGBO(36, 82, 108, 250),
          //Todo: cor da borda shadow, para ficar mesclado com o widget de filtro a baixo
          backgroundColor: Color.fromRGBO(36, 82, 108, 25),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Dashboard', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        body: Column(
          children: [
            //TODO: Bloco Slide show do homePage
            Container(
                width: double.infinity,
                height: MediaWidth / 1.8,
                //color: Colors.orange.shade100,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: imgList.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Container(
                        child: Center(
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: 1000,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )),
          ],
        ),
      );
  }
}

