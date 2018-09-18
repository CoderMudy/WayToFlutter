import 'package:flutter/material.dart';

import 'ghflutter.dart';
import 'strings.dart';

void main() => runApp(new GHFlutterApp());

class GHFlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: Strings.appTile,
      theme: new ThemeData(primaryColor:Colors.green.shade800),//新主题
      home: new GHFlutter(),
    );
  }
}




