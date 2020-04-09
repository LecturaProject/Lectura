import 'intrebare.dart';
List<sInt> intrebari=new List<sInt>();
class sInt{
  List<Intrebare>lint = new List<Intrebare>();
  String titlu;
  sInt findSintByTitle(String title)
  {
    for(int i = 0; i < intrebari.length ; i ++)
    {
      if(intrebari[i].titlu == title)
        return intrebari[i];
    }
  }
}
