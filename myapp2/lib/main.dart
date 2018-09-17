import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget{
  MyAppBar({this.title});//构造方法？

  final Widget title;
  @override
  Widget build(BuildContext context){
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      decoration: new BoxDecoration(color:Colors.red[600]),
      child: new Row(
        children:<Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      child: new Column(
        children:<Widget>[
          new MyAppBar(
            title:new Text(
              "事例标题",
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child:new Text('Hello,world'),
            ),
          ),
        ],
      ),
    );
  }
}

void main(){
  runApp(new MaterialApp(
    title:"My App2",
    home:new MyScaffold(),
  ));
}
