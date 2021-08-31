import 'package:appmestre/database/dao/user_dao.dart';
import 'package:appmestre/screens/views/drawerside.dart';
import 'package:appmestre/screens/views/home_atalhos.dart';
import 'package:appmestre/screens/views/home_dashboard.dart';
import 'package:appmestre/screens/views/home_home.dart';
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

  void initState(){
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            drawer:DrawerSide(),
            drawerScrimColor: Colors.black26,
            appBar: AppBar(
              //TODO: Cor top bar
              backgroundColor: Color.fromRGBO(36, 82, 108, 25),
              //TODO: Title
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dashboard',
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: MediaWidth < 400
                          ? MediaWidth / 20
                          : MediaWidth / 23,
                    ),
                  ),
                ],
              ),
              //TODO: Top bar menu home page
              bottom: const TabBar(
                indicatorColor: Colors.orangeAccent,
                tabs: [
                  Tab(icon: Icon(Icons.bar_chart),),
                  Tab(icon: Icon(Icons.work),),
                  Tab(icon: Icon(Icons.view_module_rounded),)
                ],
              ),
            ),
            //TODO Atalhos do top bat menu home page
            body: TabBarView(
              children: [
                dashboardHome(),
                homeHome(),
                homeAtalhos(),
              ],
            ),
          ),
        ),
      );
  }
}

