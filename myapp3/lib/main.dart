import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'strings.dart';

void main() => runApp(new GHFlutterApp());

class GHFlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: Strings.appTile,
      home: new GHFlutter(),
    );
  }
}

class GHFlutter extends StatefulWidget{
  @override
  createState() => new GHFlutterState();
}

//GHFlutterState使用GHFlutter的参数扩展状态。
class GHFlutterState extends State<GHFlutter>{
  var _members = [];
  final _biggerFont = const TextStyle(fontSize:18.0);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Strings.appTile),
      ),
      body: new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _members.length,
        itemBuilder: (BuildContext context,int position){
          return _buildRow(position);
        },
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    _loadData();
  }

  _loadData() async{
    String dataUrl = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataUrl);
    setState((){
      _members = json.decode(response.body);
    });
  }

  Widget _buildRow(int i){
    return new ListTile(
      title: new Text("${_members[i]["login"]}",style: _biggerFont),
    );
  }
}