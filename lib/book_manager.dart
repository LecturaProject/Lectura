import 'books.dart';
import 'bookWidget.dart';
import 'package:flutter/material.dart';
import 'file_utils.dart';
Book lastbook = new Book.fromEmpty();
bookManager bm = new bookManager();
List<Widget> listawid = new List<Widget>();
List<Widget> listagata = new List<Widget>();
class bookManager{
  List<Book>changed=new List<Book>();
  List<Book>finishedBooks=new List<Book>(),unfinishedBooks=new List<Book>();
  Book findByTitle(String title){
    for(int i = 0 ; i < unfinishedBooks.length ; i ++)
      {
        if(unfinishedBooks[i].name == title)
          {
            return unfinishedBooks[i];
          }
      }
    for(int i = 0 ; i < finishedBooks.length ; i ++)
    {
      if(finishedBooks[i].name == title)
      {
        return finishedBooks[i];
      }
    }
    return new Book.fromEmpty();
  }
  void deleteBook(Book b){

  }
  void resetProgress(Book b){
      b.readPages=0;
  }
  void addProgress(Book b,int newPages){
    b.readPages+=newPages;
    changed.add(b);
    flush();
  }
  void addBook(Book nb){
    print(nb.name);
    print(nb.author);
    if(nb.pages==nb.readPages) {
      finishedBooks.add(nb);
      listagata.add(
        bookCard(
          title: nb.name,
        ),
      );
    }
      else {
      unfinishedBooks.add(nb);
      listawid.add(
        bookCard(
          title: nb.name,
        ),
      );
    }
    flush();
  }

  void printAll(){
     print('unfinished');
      for(int i=0;i<unfinishedBooks.length;i++){
          print(unfinishedBooks[i].name);
      }
  }
  void flush(){
    for(int i=0;i<changed.length;i++){
      Book cur=changed[i];
      String titlu=cur.name,author=cur.author;
      int id=cur.id,pages=cur.pages,readPages=cur.readPages;
      FileUtils.saveToFile('books/$titlu.txt','$id\n"$titlu"\n"$author"\n$pages\n$readPages');
    }
    changed.clear();
  }
}