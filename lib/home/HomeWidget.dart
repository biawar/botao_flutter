import'package:flutter/material.dart';

class HomeWidget extends StatefulWidget{
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>{

  Stream<String> verifica;
  var filter = (x) => true;

  Widget _Button(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: MaterialButton(
        color: Colors.pink,
        child: Text("Button"),
        textColor: Colors.white,
        shape: StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        onPressed: () => verifica.listen((x){
          print(x);}),
      ),
    );
  }


  Widget build (BuildContext context){
    
    filter = (x) => x % 5 == 0;
    verifica = countStream(100).where((x) => filter(x)).map((x) => transfString(x));

    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple of 5 verification"),
      ),
      body: ListView(
        children: <Widget>[
          _Button(),
        ],
      ),
    );
  }

  Stream<int> countStream(int max) async*{
    for(var i = 1; i<max; i++){
     	await new Future.delayed(const Duration(seconds : 1));
      yield i;
    }
	}

  String transfString(int i){
    return "$i - Eh multiplo de 5.";   
  }


}

