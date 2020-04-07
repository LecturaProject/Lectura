import 'package:flutter/material.dart';
import 'bookWidget.dart';
import 'book_manager.dart';
import 'toWidget.dart';
import 'books.dart';
class Biblioteca extends StatelessWidget {
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController pageController2 = new TextEditingController();
  TextEditingController pageController3 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Biblioteca"),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Carti neterminate',
                  style: new TextStyle(
                    fontSize: 40,
                    fontFamily: 'Julius',
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: listawid,
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  'Carti terminate',
                  style: new TextStyle(
                    fontSize: 40,
                    fontFamily: 'Julius',
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: listagata,
              ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Form(
                      key: _formKey2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0 , horizontal: 10),
                            child: TextFormField(
                              decoration: new InputDecoration.collapsed(hintText: 'Titlu'),
                              controller: pageController2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0 , horizontal: 10),
                            child: TextFormField(
                              decoration: new InputDecoration.collapsed(hintText: 'Numar de pagini'),
                              controller: pageController3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Am citit!"),
                              onPressed: () {
                                if (_formKey2.currentState.validate()) {
                                  _formKey2.currentState.save();
                                }
                                Book newbook = new Book.fromEmpty();
                                newbook.name = pageController2.text;
                                newbook.pages = int.parse(pageController3.text);
                                bm.addBook(newbook);
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
      ),
    );
  }
}
