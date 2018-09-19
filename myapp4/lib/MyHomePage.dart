import 'package:flutter/material.dart';
import 'MySecondPage.dart';

class MyHomePage extends StatefulWidget{
  MyHomePage({
    Key key,
    this.title,
    this.count,
    this.decrementCounter,
    this.incrementCounter
  });
  final String title;
  final int count;      
  final ValueChanged<void>decrementCounter;//这种是什么写法
  final ValueChanged<void>incrementCounter;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  void _onPressed(){
    widget.incrementCounter(null);
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title:new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('你点击了这个按钮很多次了'),
            new Text(
              widget.count.toString(),
              style:Theme.of(context).textTheme.display1,
            ),
            new RaisedButton(
              child: new Text('Next Screen'),
              onPressed: (){
                // Navigator.push(context, route)
                Navigator.push(
                  context, 
                  new MaterialPageRoute(
                    builder: (context) => new MySecondPage(
                      widget.decrementCounter,
                      title:'My Second Page',
                      counter:widget.count,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton:new FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}