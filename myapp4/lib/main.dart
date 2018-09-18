import 'package:flutter/material.dart';
import 'MyHomePage.dart';

void main() => runApp(new MyApp());

///状态管理
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp>{
  int counter;
  @override
  void initState(){
    super.initState();
    counter = counter ?? 0;
  }
  void _decrementCounter(_){
    setState(() {
          counter --;
          print('decrement:$counter');
        });
  }
  void _incrementCounter(_){
    setState(() {
          counter++;
          print('increment:$counter');
        });
  }
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Flutter',
      theme: new ThemeData(primarySwatch:Colors.red),
      home: new MyHomePage(
        title:'MyHomePage',
        counter:counter,
        decrementCounter:_decrementCounter,
        incrementCounter: _incrementCounter,

      ),
    );
  

  }
}