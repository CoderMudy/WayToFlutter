import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var title = 'Web images';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar:AppBar(
          title: Text(title),
        ),
        body: Image.network('https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true'),
      ),
    );
  }
}