import 'file_utils.dart';
import 'dart:io';
import 'dart:async';
class Notita{
    String titlu="";
    String content="";
}

void addNotita(String carte,String titlu,String content)async{
  String aux = await FileUtils.getFilePath;
  int ind=0,nr=0;
  new Directory('$aux/books/$carte').create().then((Directory directory) {
  });
  String data=await FileUtils.readFromFile('books/$carte/notite.txt');
  String rez="";
  while(ind<data.length && data.codeUnitAt(ind)>='0'.codeUnitAt(0) && data.codeUnitAt(ind)<='9'.codeUnitAt(0)){
      nr=nr*10+data.codeUnitAt(ind)-'0'.codeUnitAt(0);
      ind++;
  }
  rez+=(nr+1).toString()+'\n';
  for(int i=1;i<=nr;i++){
      while(ind<data.length && data.codeUnitAt(ind)!='"'.codeUnitAt(0))
          ind++;
      ind++;
      String straux="";
      while(ind<data.length && data.codeUnitAt(ind)!='"'.codeUnitAt(0)) {
        straux+=data[ind];
        ind++;
      }
      ind++;
      rez+='\"$straux\"\n';
  }
  var date=new DateTime.now();
  rez+="\"${date.toString()}\"";
  saveText('books/$carte/notite.txt',rez);
  saveText('books/$carte/${date.toString()}.txt', '"$titlu"\n'+content);
}

Future<List<Notita>> getNotite(String carte)async{

  String data=await FileUtils.readFromFile('books/$carte/notite.txt');
  List<Notita>rez=new List<Notita>();
  int nr=0,ind=0;
  print(data);
  while(ind<data.length && data.codeUnitAt(ind)>='0'.codeUnitAt(0) && data.codeUnitAt(ind)<='9'.codeUnitAt(0)){
    nr=nr*10+data.codeUnitAt(ind)-'0'.codeUnitAt(0);
    ind++;
  }
  for(int i=1;i<=nr;i++){
    while(ind<data.length && data.codeUnitAt(ind)!='"'.codeUnitAt(0))
      ind++;
    ind++;
    String straux="";
    while(ind<data.length && data.codeUnitAt(ind)!='"'.codeUnitAt(0)) {
      straux+=data[ind];
      ind++;
    }
    ind++;
    String data1=await FileUtils.readFromFile('books/$carte/${straux}.txt');
    int k=0;
    Notita helperNotita=new Notita();
    while(k<data1.length && data1.codeUnitAt(k)!='"'.codeUnitAt(0))
      k++;
    k++;
    while(k<data1.length && data1.codeUnitAt(k)!='"'.codeUnitAt(0)) {
      helperNotita.titlu+=data1[k];
      k++;
    }
    k++;
    k++;
    while(k<data1.length){
      helperNotita.content+=data1[k];
      k++;
    }

    rez.add(helperNotita);
  }
  return rez;
}