import 'package:flutter/material.dart';
import 'Biblioteca.dart';
import 'Intrebari.dart';
import 'bookWidget.dart';
import 'Progres.dart';
import 'file_utils.dart';
import 'book_manager.dart';
import 'dart:io';
import 'books.dart';
import 'toWidget.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  final appTitle = 'lecTUra';
  void init() async {
    String aux = await FileUtils.getFilePath;
    new Directory('$aux/books').create().then((Directory directory) {
      print(directory.path);
    });
    bm = new bookManager();
    int k = 0, nb = 0;
    String books = await FileUtils.readFromFile("books.txt");
    while (k < books.length &&
        books.codeUnitAt(k) >= '0'.codeUnitAt(0) &&
        books.codeUnitAt(k) <= '9'.codeUnitAt(0)) {
      nb = nb * 10 + books.codeUnitAt(k) - '0'.codeUnitAt(0);
      k++;
    }
    print(nb);
    for (int i = 1; i <= nb; i++) {
      String nume = "";
      while (k < books.length && books.codeUnitAt(k) != '"'.codeUnitAt(0)) k++;
      k++;
      while (k < books.length && books.codeUnitAt(k) != '"'.codeUnitAt(0)) {
        nume += books[k];
        k++;
      }
      k++;
      String content = await FileUtils.readFromFile('books/$nume.txt');
      bm.addBook(newBook(content));
    }
    lastbook = bm.unfinishedBooks[0];
    bm.printAll();
  }

  @override
  Widget build(BuildContext context) {
    init();
    bm.printAll();


    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('lecTUra'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Biblioteca'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Biblioteca()),
                );
              },
            ),
            ListTile(
              title: Text('Intrebari'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Intrebari()),
                );
              },
            ),
            ListTile(
              title: Text('Progres'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Progres()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
