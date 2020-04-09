import 'package:flutter/material.dart';
import 'books.dart';
import 'book_manager.dart';
import 'lista_intrebari.dart';
import 'package:lectura/IntrebariWidget.dart';
class quizz_game extends StatefulWidget {
  sInt thisSet;
  Book quizz_book;
  quizz_game({this.quizz_book,this.thisSet});
  @override
  _quizz_gameState createState() => new _quizz_gameState();
}
TextStyle stil20 = new TextStyle(
  fontSize: 20,
  fontFamily: 'Julius',
  fontWeight: FontWeight.bold,
);
class _quizz_gameState extends State<quizz_game> {
  @override
  Widget build(BuildContext context) {
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
                  widget.quizz_book.name,
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
                  widget.quizz_book.author,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: Text(
                  widget.thisSet.lint[0].question,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Julius',
                  )
                    ,
                ),
              ),
            )
          ],
        )
      ],
    ),
    );
  }
}
