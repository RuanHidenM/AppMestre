import 'package:flutter/material.dart';
loaddingMestre(String msgText){
  return Scaffold(
    backgroundColor: Colors.white,
    body: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 135,
                child: Image.asset(
                  'images/Logo_Mestre_-_Completo.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    CircularProgressIndicator(
                        color: Colors.orange
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        '${msgText}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey,
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    ),
  );
}
