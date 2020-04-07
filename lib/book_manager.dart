import 'books.dart';
import 'bookWidget.dart';
import 'package:flutter/material.dart';
import 'file_utils.dart';
Book lastbook = new Book.fromEmpty();
bookManager bm = new bookManager();
List<Widget> listawid = new List<Widget>();
List<Widget> listagata = new List<Widget>();
int min(int a,int b){
  if(a<b)
    return a;
  return b;
}
class bookManager{
  int ad=0;
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
  void deleteBookByTitle(String title){
      for(int i=0;i<finishedBooks.length;i++)
          if(title==finishedBooks[i].name){
              finishedBooks.removeAt(i);
              listawid.removeAt(i);
              return;
          }
      for(int i=0;i<unfinishedBooks.length;i++)
          if(title==unfinishedBooks[i].name){
            unfinishedBooks.removeAt(i);
            listagata.removeAt(i);
            return;
          }
  }
  void resetProgress(Book b){
      b.readPages=0;
      flush();
  }
  void addProgress(Book b,int newPages){
    b.readPages=min(b.pages,b.readPages+newPages);
    if(b.readPages==b.pages) {
        deleteBookByTitle(b.name);
        bm.addBook(b);
    }
    changed.add(b);
    flush();
  }
  void addBook(Book nb){
    Book aux=findByTitle(nb.name);
    if(aux.name==nb.name)
      return;
      ad++;
    changed.add(nb);
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
  void flush()async {
    for (int i = 0; i < changed.length; i++) {
        Book cur = changed[i];
        String titlu = cur.name,
        author = cur.author;
        int id = cur.id,
        pages = cur.pages,
        readPages = cur.readPages;
        FileUtils.saveToFile(
          'books/$titlu.txt', '$id\n"$titlu"\n"$author"\n$pages\n$readPages');
    }
    changed.clear();
    if (ad >= 1) {
      int nr = unfinishedBooks.length + finishedBooks.length;
      String rez = "$nr\n";
      for (int i = 0; i < unfinishedBooks.length; i++) {
        String aux = unfinishedBooks[i].name;
        rez += "\"$aux\"\n";
      }
      for (int i = 0; i < finishedBooks.length; i++) {
        String aux = finishedBooks[i].name;
        rez += "\"$aux\"\n";
      }
      saveText('books.txt', rez);
      printAll();
      print("AAAAAAAAA");
      print(await FileUtils.readFromFile('books.txt'));
      print(rez);
      ad = 0;
    }
  }
}