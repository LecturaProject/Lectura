import 'package:flutter/material.dart';
import 'book_manager.dart';
class bookCard extends StatefulWidget {
  String title;
  String author;
  void update(String newtitle) {
    title = newtitle;
  }

  bookCard({this.title ,this.author});
  @override
  _bookCardState createState() => new _bookCardState();
}

class _bookCardState extends State<bookCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Colors.white,
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title ,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontSize: 35,
                  fontFamily: 'Julius',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.author,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                  fontSize: 20,
                  fontFamily: 'Julius',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
              icon: Icon(
                Icons.library_add,
                color: Color.fromRGBO(40, 234, 221, 1),
                size: 40,
              ),
              onPressed: ()
              {
                lastbook =  bm.findByTitle(widget.title);
              }
          )
        ],
      ),
    );
  }
}