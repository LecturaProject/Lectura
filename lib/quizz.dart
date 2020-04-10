import 'package:flutter/material.dart';
import 'books.dart';
import 'book_manager.dart';
import 'lista_intrebari.dart';
import 'package:lectura/IntrebariWidget.dart';
import 'raspuns_widget.dart';
class quizz_game extends StatefulWidget {
  sInt thisSet;
  quizz_game({this.thisSet});
  @override
  _quizz_gameState createState() => new _quizz_gameState();
}
TextStyle stil20 = new TextStyle(
  fontSize: 20,
  fontFamily: 'Julius',
  fontWeight: FontWeight.bold,
);
class _quizz_gameState extends State<quizz_game> {
  void init()
  {
    ListaIntrebariWidget.clear();
    for(int i = 0 ; i < widget.thisSet.lint[indice_intrebare].answers.length ; i ++)
      {
        ListaIntrebariWidget.add( raspuns_widget(answer : widget.thisSet.lint[indice_intrebare].answers[i], is_corect : (widget.thisSet.lint[indice_intrebare].correct == i), thisSet: widget.thisSet,));
        print(widget.thisSet.lint[indice_intrebare].answers[i]);
        print((widget.thisSet.lint[indice_intrebare].correct == i));
      }
  }
  @override
  Widget build(BuildContext context) {
    init();
    globalpressed = false;
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Test de lectura",
          style: stil20,
        ),
        backgroundColor: Color.fromRGBO(40, 53, 234, 1),
      ),
    body: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
              child: Text(
                  widget.thisSet.titlu,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Julius',
                  )
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
              child: Text(
                  widget.thisSet.autor,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Julius',
                  )
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Text(
                  widget.thisSet.lint[0].question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Julius',
                    fontWeight: FontWeight.bold,
                  )
                    ,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
              ListaIntrebariWidget
        ),
      ],
    ),
    );
  }
}
