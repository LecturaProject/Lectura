import 'package:flutter/material.dart';
import 'books.dart';
import 'book_manager.dart';
class Progres extends StatefulWidget {
  @override
  _ProgresState createState() => new _ProgresState();
}

class _ProgresState extends State<Progres> {
  @override
  TextEditingController pageController = new TextEditingController();
  int NumberOfPages = lastbook.pages;
  final _formKey = GlobalKey<FormState>();
  int mynumber = lastbook.readPages;
  String bookTitle = lastbook.name;
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Progres'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height:30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  bookTitle,
                style: new TextStyle(
                  fontSize: 30,
                  fontFamily: 'Julius',
                ),
              ),
            ],
          ),
          SizedBox(
            height:30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 150,
                backgroundColor: Colors.deepPurple[900],
                child: Text(
                  '    ' + (mynumber / NumberOfPages * 100).toStringAsPrecision(3) + ' %' + '\n' + '\n' + mynumber.toString() + ' din ' + NumberOfPages.toString(),
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Julius'
                  ),
                ),
              ),
            ],
          ),
       SizedBox(
           height: 30,
       ),
       FloatingActionButton(
         onPressed: () {
           showDialog(
               context: context,
               builder: (BuildContext context) {
                 return AlertDialog(
                   content: Form(
                     key: _formKey,
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         Padding(
                           padding: EdgeInsets.symmetric(vertical: 0 , horizontal: 10),
                           child: TextFormField(
                             controller: pageController,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: RaisedButton(
                             child: Text("Am citit!"),
                             onPressed: () {
                               if (_formKey.currentState.validate()) {
                                 _formKey.currentState.save();
                               }
                               mynumber = min(lastbook.pages,mynumber+int.parse(pageController.text));
                               bm.addProgress(lastbook ,int.parse(pageController.text) );
                               Navigator.pop(context);
                               setState(() {
                                 mynumber;
                               });
                             },
                           ),
                         )
                       ],
                     ),
                   ),
                 );
               });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
        ],
      ),
    );
  }
}
