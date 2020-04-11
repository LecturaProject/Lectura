import 'package:flutter/material.dart';
import 'package:lectura/raspuns_widget.dart';
import 'book_manager.dart';
import 'quizz.dart';
import 'books.dart';
import 'lista_intrebari.dart';
import 'package:page_transition/page_transition.dart';
class intrebareWidget extends StatelessWidget {
  String title;
  String author;
  int total_pages;
  int read_pages;
  intrebareWidget({this.title, this.author, this.read_pages, this.total_pages});
  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.white,
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Julius',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                author,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Julius',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.book),
            onPressed: () {
              sInt helper2 = intrebari[0].findSintByTitle(title);
              print(helper2.titlu);
              indice_intrebare = 0;
              score = 0;
              Navigator.push(
                context,
                PageTransition(type: PageTransitionType.fade,
                    child: quizz_game( thisSet: helper2,)),
              );
            },
          ),
        ],
      ),
    );
  }
}
