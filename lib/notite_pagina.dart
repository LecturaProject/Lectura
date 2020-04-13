import 'package:flutter/material.dart';
import 'notite.dart';

class pagina_notite extends StatefulWidget {
  List<Notita> listaNotite;
  List<Widget> listaWidgeturi = new List<Widget>();
  String title;
  void init() {
    listaWidgeturi.clear();
    for (int i = 0; i < listaNotite.length; i++) {
      listaWidgeturi.add(Card(
          elevation: 8,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Text(
                listaNotite[i].titlu,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Julius',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              child: Text(listaNotite[i].content,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Julius',
                  fontWeight: FontWeight.bold,
                ),),
            ),
          )));
    }
  }

  pagina_notite({this.listaNotite, this.title});
  @override
  _pagina_notiteState createState() => _pagina_notiteState();
}

TextStyle stil20 = new TextStyle(
  fontSize: 20,
  fontFamily: 'Julius',
  fontWeight: FontWeight.bold,
);

class _pagina_notiteState extends State<pagina_notite> {
  @override
  Widget build(BuildContext context) {
    widget.init();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Notite pentru " + widget.title,
            style: stil20,
          ),
          backgroundColor: Color.fromRGBO(40, 53, 234, 1),
        ),
        body: ListView(
          children: widget.listaWidgeturi,
        ));
  }
}
