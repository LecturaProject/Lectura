
class Intrebare{
  String question;
  List<String>answers;
  int correct;
  Intrebare.fromEmpty(){
    question="";
    answers=new List<String>();
    correct=0;
  }
}

List<Intrebare> getQuestions(String content){
    List<Intrebare>auxras=new List<Intrebare>();
    int ind=0,n=0;
    while(ind<content.length && (content.codeUnitAt(ind)>="0".codeUnitAt(0) && content.codeUnitAt(ind)<="9".codeUnitAt(0))){
      n=n*10+content.codeUnitAt(ind)-"0".codeUnitAt(0);
      ind++;
    }
    for(int i=1;i<=n;i++){
        Intrebare question=new Intrebare.fromEmpty();
        question.question="";
        int aux=0;
        while(ind<content.length && content.codeUnitAt(ind)!="'".codeUnitAt(0)) {
            ind++;
        }
        ind++;
        while(ind<content.length && content.codeUnitAt(ind)!="'".codeUnitAt(0)) {
          question.question +=content[ind];
          ind++;
        }
        ind++;
        while(ind<content.length && (content.codeUnitAt(ind)<"0".codeUnitAt(0) || content.codeUnitAt(ind)>"9".codeUnitAt(0))){
            ind++;
        }
        while(ind<content.length && (content.codeUnitAt(ind)>="0".codeUnitAt(0) && content.codeUnitAt(ind)<="9".codeUnitAt(0))){
            aux=aux*10+content.codeUnitAt(ind)-"0".codeUnitAt(0);
            ind++;
        }
        for(int j=1;j<=aux;j++){
          String rasp="";
          while(ind<content.length && content.codeUnitAt(ind)!="'".codeUnitAt(0)){
            ind++;
          }
          ind++;
          while(ind<content.length && content.codeUnitAt(ind)!="'".codeUnitAt(0)) {
            rasp+=content[ind];
            ind++;
          }
          ind++;
          question.answers.add(rasp);
          int aux2=0;
        }
        while(ind<content.length && (content.codeUnitAt(ind)<"0".codeUnitAt(0) || content.codeUnitAt(ind)>"9".codeUnitAt(0))){
          ind++;

        }
        int aux2=0;
        while(ind<content.length && (content.codeUnitAt(ind)>="0".codeUnitAt(0) && content.codeUnitAt(ind)<="9".codeUnitAt(0))){
          aux2=aux2*10+content.codeUnitAt(ind)-"0".codeUnitAt(0);
          ind++;
        }
        question.correct=aux2;
        auxras.add(question);
    }
    return auxras;
}