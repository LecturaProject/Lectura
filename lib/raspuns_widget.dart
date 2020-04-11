import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lectura/quizz.dart';
import 'lista_intrebari.dart';
import 'package:page_transition/page_transition.dart';
List<Widget> ListaIntrebariWidget = new List<Widget>();
bool globalpressed = false;
int indice_intrebare;
int score;

class raspuns_widget extends StatefulWidget {
  String answer;
  bool is_corect;
  sInt thisSet;
  bool pressed = false;
  Color culoare = Color.fromRGBO(40, 53, 234, 1);
  raspuns_widget({this.answer, this.is_corect, this.thisSet});
  @override
  _raspuns_widgetState createState() => _raspuns_widgetState();
}

class _raspuns_widgetState extends State<raspuns_widget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.is_corect == true && globalpressed == false) {
          globalpressed = true;
          widget.culoare = Colors.green;
          score++;
          indice_intrebare++;
          setState(() {
            widget.culoare;
          });
          Timer(Duration(milliseconds: 500), () {
            if(indice_intrebare != widget.thisSet.lint.length) {
              Navigator.pushReplacement(
                context,
                PageTransition(type: PageTransitionType.fade,
                    child: quizz_game(
                      thisSet: widget.thisSet,
                    )),
              );
            }
            else
            {
              Navigator.pushReplacement(
                context,
                PageTransition(type: PageTransitionType.fade,
                    child: quizz_results(corecte : score , totale : widget.thisSet.lint.length),
                ),
              );
            }
          });
        }
        else if (globalpressed == false) {
          globalpressed = true;
          widget.culoare = Colors.red;
          indice_intrebare++;
          setState(() {
            widget.culoare;
          });
          Timer(Duration(milliseconds: 500), () {
            if(indice_intrebare != widget.thisSet.lint.length) {
              Navigator.pushReplacement(
                context,
                PageTransition(type: PageTransitionType.fade,
                    child: quizz_game(
                      thisSet: widget.thisSet,
                    )),
              );
            }
            else
            {
              Navigator.pushReplacement(
                context,
                PageTransition(type: PageTransitionType.fade,
                  child: quizz_results(corecte : score , totale : widget.thisSet.lint.length),
                ),
              );
            }
          });
        }
      },
      child: Container(
        width: 350,
        height: 80,
        color: widget.culoare,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(
          widget.answer,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Julius',
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
class quizz_results extends StatelessWidget {
  int corecte;
  int totale;
  quizz_results({this.corecte,this.totale});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        "Test de lectura",
        style: stil20,
    ),
    backgroundColor: Color.fromRGBO(40, 53, 234, 1),
    ),
    body: Center(
      child: Text(
        'Ai obtinut un scor de ' +(corecte.toDouble() / totale.toDouble() * 100).toStringAsPrecision(3) + '%',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Julius',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    )
    );
    }
}
