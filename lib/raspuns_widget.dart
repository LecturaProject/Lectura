import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lectura/quizz.dart';
import 'lista_intrebari.dart';
List<Widget>ListaIntrebariWidget = new List<Widget>();
bool globalpressed = false;
int indice_intrebare;
int score;
class raspuns_widget extends StatefulWidget {
  String answer;
  bool is_corect;
  sInt thisSet;
  bool pressed = false;
  Color culoare = Color.fromRGBO(40, 53, 234, 1);
  raspuns_widget({this.answer, this.is_corect,this.thisSet});
  @override
  _raspuns_widgetState createState() => _raspuns_widgetState();
}

class _raspuns_widgetState extends State<raspuns_widget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(widget.is_corect == true && globalpressed == false)
          {
            globalpressed = true;
            widget.culoare = Colors.green;
            score ++;
            indice_intrebare ++;
            setState(() {
              widget.culoare;
            });
            Timer(Duration(seconds:2), () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => quizz_game(thisSet: widget.thisSet,)),
              );
            }
            );
          }
        else if(globalpressed == false)
        {
          globalpressed = true;
          widget.culoare = Colors.red;
          indice_intrebare ++;
          setState(() {
            widget.culoare;
          });
        }
      },
      child: Container(
        width: 350,
        height: 80,
        color: widget.culoare,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 5),
        child: Text(
            widget.answer,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Julius',
              fontSize: 17,
            )
          ,
        ),
      ),
    )
    ;
  }
}
