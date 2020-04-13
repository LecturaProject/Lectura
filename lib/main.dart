import 'package:flutter/material.dart';
import 'Biblioteca.dart';
import 'bookWidget.dart';
import 'Progres.dart';
import 'file_utils.dart';
import 'book_manager.dart';
import 'dart:io';
import 'books.dart';
import 'toWidget.dart';
import 'intrebare.dart';
import 'lista_intrebari.dart';
import 'intrebari.dart';
import 'package:lectura/IntrebariWidget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'lecTUra';
  void init() async {
    String aux = await FileUtils.getFilePath;
    String data=await getFileData('assets/recomandate.txt');
    int ind=0,nr=0;
    new Directory('$aux/books').create().then((Directory directory) {
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
    if(bm.unfinishedBooks.length > 0)
      lastbook = bm.unfinishedBooks[0];
    else
      lastbook = new Book.fromEmpty();

    while(ind<data.length && data.codeUnitAt(ind)>='0'.codeUnitAt(0) && data.codeUnitAt(ind)<='9'.codeUnitAt(0)){
      nr=nr*10+data.codeUnitAt(ind)-'0'.codeUnitAt(0);
      ind++;
    }
    for(int i=1;i<=nr;i++){
      String aux="",aux2="";
      while(ind<data.length && data.codeUnitAt(ind)!='"'.codeUnitAt(0))
        ind++;
      ind++;
      while(ind<data.length && data.codeUnitAt(ind)!='"'.codeUnitAt(0)) {
        aux+=data[ind];
        ind++;
      }
      ind++;
      while(ind<data.length && data.codeUnitAt(ind)!='"'.codeUnitAt(0))
        ind++;
      ind++;
      while(ind<data.length && data.codeUnitAt(ind)!='"'.codeUnitAt(0)) {
        aux2+=data[ind];
        ind++;
      }
      ind++;
      sInt a=new sInt();
      a.titlu=aux;
      a.autor=aux2;
      print(a.titlu);
      print(a.autor);
      aux=aux.replaceAll(" ", "");
      String d1=await getFileData('assets/${aux}_intrebari.txt');
      a.lint=getQuestions(d1);
      intrebari.add(a);
      Book helperbook = bm.findByTitle(a.titlu);
      ListaRecomandari.add(intrebareWidget(title: a.titlu, author: a.autor, read_pages: helperbook.readPages, total_pages: helperbook.pages,));
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

TextStyle stil20 = new TextStyle(
  fontSize: 20,
  fontFamily: 'Julius',
  fontWeight: FontWeight.bold,
);

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: stil20,
        ),
        backgroundColor: Color.fromRGBO(40, 53, 234, 1),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
        'Asistentul tau personal in materie de carti.',
        style: stil20,
              textAlign: TextAlign.center,
      ),
          )),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'lecTUra',
                style: new TextStyle(
                  fontSize: 35,
                  fontFamily: 'Julius',
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(40, 234, 221, 1),
              ),
            ),
            ListTile(
              title: Text(
                'Biblioteca',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Biblioteca()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Intrebari',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Intrebari()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Progres',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Progres()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }*/

  ///de aici am adaugat notif
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  new FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid;
  var initializationSettingsIOS;
  var initializationSettings;

  void _showNotification() async {
    await _showDailyAtTime();
  }

  String _toTwoDigitString(int value) {
    return value.toString().padLeft(2, '0');
  }

  Future<void> _showDailyAtTime() async {
    var time = Time(17, 0,  0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'test ticker'
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Nu uita sa citesti!',
        'lecTUra te asteapta',
        time,
        platformChannelSpecifics);
  }

  @override
  void initState() {
    _showNotification();
    // TODO: implement initState
    super.initState();
    initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('Notification payload: $payload');
    }
    Navigator.canPop(context);
    await Navigator.push(context,
        new MaterialPageRoute(builder: (context) => Progres()));
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.canPop(context);
                await Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Progres()),
                );
              },
            )
          ],
        ));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LecTUra',
          style: stil20,
        ),
        backgroundColor: Color.fromRGBO(40, 53, 234, 1),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Asistentul tau personal in materie de carti.',
              style: stil20,
              textAlign: TextAlign.center,
            ),
          )),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'lecTUra',
                style: new TextStyle(
                  fontSize: 35,
                  fontFamily: 'Julius',
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(40, 234, 221, 1),
              ),
            ),
            ListTile(
              title: Text(
                'Biblioteca',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Biblioteca()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Intrebari',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Intrebari()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Progres',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Progres()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LecTUra',
          style: stil20,
        ),
        backgroundColor: Color.fromRGBO(40, 53, 234, 1),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Asistentul tau personal in materie de carti.',
              style: stil20,
              textAlign: TextAlign.center,
            ),
          )),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'lecTUra',
                style: new TextStyle(
                  fontSize: 35,
                  fontFamily: 'Julius',
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(40, 234, 221, 1),
              ),
            ),
            ListTile(
              title: Text(
                'Biblioteca',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Biblioteca()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Intrebari',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Intrebari()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Progres',
                style: stil20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.fade,
                      child: Progres()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
