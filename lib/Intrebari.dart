import 'package:flutter/material.dart';
import 'package:lectura/IntrebariWidget.dart';
TextStyle stil20 = new TextStyle(
  fontSize: 20,
  fontFamily: 'Julius',
  fontWeight: FontWeight.bold,
);
class Intrebari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Intrebari",style: stil20,),
        backgroundColor: Color.fromRGBO(40, 53, 234, 1),
      ),
      body:
        Column(
          children: <Widget>[
            Expanded(
              child:
              ListView(
                children: ListaRecomandari,
              ),
            ),
          ],
        )
    );
  }
}
List <Widget> ListaRecomandari= new List<Widget>();