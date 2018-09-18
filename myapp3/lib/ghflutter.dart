import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'member.dart';
import 'strings.dart';

class GHFlutter extends StatefulWidget{
  @override
  createState() => new GHFlutterState();
}

//GHFlutterState使用GHFlutter的参数扩展状态。
class GHFlutterState extends State<GHFlutter>{
  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize:18.0);

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Strings.appTile),
      ),
      body: new ListView.builder(
        
        itemCount: _members.length,
        itemBuilder: (BuildContext context,int position){
          //添加分割线
          if(position.isOdd) return new Divider();
          final index = position ~/2;
          return _buildRow(index);
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
      final membersJSON = json.decode(response.body);
      for(var memberJSON in membersJSON){
        final member = new Member(memberJSON["login"],memberJSON["avatar_url"]);
        _members.add(member);
      }
    });
  }

  Widget _buildRow(int i){
    return new ListTile(
      title: new Text("${_members[i].login}",style: _biggerFont),
      leading: new CircleAvatar(
        backgroundColor:Colors.green,
        backgroundImage:new NetworkImage(_members[i].avatarUrl)//当图片没有加载出来的时候，默认显示绿色背景
      ),
    );
  }
}