import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget{
  MyAppBar({this.title});
  final Widget title;

  @override
  Widget build(BuildContext context){
    return new Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      decoration: new BoxDecoration(color:Colors.red[500]),//这个颜色后边的中括号是干嘛的

      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigatio menu',
            onPressed: null,//null 会禁用button
          ),

          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
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
      child: Column(
        children:<Widget>[
          new MyAppBar(
            title:new Text(
              'title',
              style:Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child:new Text('hellodede')
            ),
          ),
        ],
      ),
    );

  }
}

void main(){
  runApp(new MaterialApp(
    title:'myapp2',
    home:new MyScaffold(),
  ));
}