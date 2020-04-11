import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'books.dart';
import 'book_manager.dart';
import 'notite.dart';
import 'package:page_transition/page_transition.dart';
class Progres extends StatefulWidget {
  @override
  _ProgresState createState() => new _ProgresState();
}
TextStyle stil20 = new TextStyle(
  fontSize: 20,
  fontFamily: 'Julius',
  fontWeight: FontWeight.bold,
);
class _ProgresState extends State<Progres> {
  @override
  TextEditingController pageController = new TextEditingController();
  TextEditingController pageController2 = new TextEditingController();
  int NumberOfPages = lastbook.pages;
  final _formKey = GlobalKey<FormState>();
  int mynumber = lastbook.readPages;
  String bookTitle = lastbook.name;
  String bookAuthor = lastbook.author;
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(40, 53, 234, 1),
        title: Text('Progres',style : stil20,),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height:30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:1 , horizontal: 10),
                  child: Text(
                    bookTitle,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 25,
                      fontFamily: 'Julius',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:1 , horizontal: 10),
                  child: Text(
                    'de',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 15,
                      fontFamily: 'Julius',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:1 , horizontal: 10),
                  child: Text(
                    bookAuthor,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 25,
                      fontFamily: 'Julius',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height:30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: (){
                    int indice_carte_progres = 0;
                    for(int i = 0 ; i < bm.unfinishedBooks.length ; i ++)
                    {
                      if(bm.unfinishedBooks[i].name == lastbook.name) {
                        indice_carte_progres = i;
                        break;
                      }
                    }
                    if(indice_carte_progres == 0)
                      indice_carte_progres = bm.unfinishedBooks.length;
                    indice_carte_progres --;
                    lastbook = bm.unfinishedBooks[indice_carte_progres];
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type : PageTransitionType.fade,
                        child : Progres(),
                      ),
                    );
                  }
              ),
              CircleAvatar(
                radius: 140,
                backgroundColor: Color.fromRGBO(40, 234, 221, 1),
                child: Text(
                  (mynumber / NumberOfPages * 100).toStringAsPrecision(3) + ' %' + '\n' + '\n' + mynumber.toString() + ' din ' + NumberOfPages.toString(),
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Julius',
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: (){
                    int indice_carte_progres = 0;
                    for(int i = 0 ; i < bm.unfinishedBooks.length ; i ++)
                    {
                      if(bm.unfinishedBooks[i].name == lastbook.name) {
                        indice_carte_progres = i;
                        break;
                      }
                    }
                    if(indice_carte_progres == bm.unfinishedBooks.length - 1)
                      indice_carte_progres = -1;
                    indice_carte_progres ++;
                    lastbook = bm.unfinishedBooks[indice_carte_progres];
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type : PageTransitionType.fade,
                        child : Progres(),
                      ),
                    );
                  }
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                heroTag : 'btn1',
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
                backgroundColor: Color.fromRGBO(40, 53, 234, 0.7),
              ),
              FloatingActionButton(
                heroTag : 'btn2',
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
                                    decoration: new InputDecoration.collapsed(
                                      hintText: 'Titlu notite',hintStyle: stil20,),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 0 , horizontal: 10),
                                  child: Container(
                                    child: TextFormField(
                                      maxLines: 7,
                                      decoration: new InputDecoration.collapsed(
                                        hintText: 'Notite',hintStyle: stil20,),
                                      controller: pageController2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text("Am terminat!"),
                                    onPressed: () async{
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                      }
                                      await addNotita(lastbook.name.replaceAll(" ","").trim(),pageController.text,pageController2.text);
                                      List<Notita>ln=await getNotite('Jhon');
                                      for(int i=0;i<ln.length;i++){
                                        print(ln[i].titlu);
                                        print(ln[i].content);
                                      }
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Icon(Icons.library_books),
                backgroundColor: Color.fromRGBO(40, 53, 234, 0.7),
              ),
            ],
          ),
        ],
      ),
    );
  }
}