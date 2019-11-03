import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyNavigate2 extends StatefulWidget {
  @override
  _MyNavigate2State createState() => _MyNavigate2State();
}

class _MyNavigate2State extends State<MyNavigate2> {

  List<WordPair> _checks = List();

  static int recordcont = 4;
  List<WordPair> items = generateWordPairs()
      .take(recordcont).toList();

  List<Widget> _rendorRows(){

    int index = 0;

    Iterable<Widget> listTiles = items.map((wordpair){
      index++;
      if(index == items.length){
        return new ListTile(
          title: new Text("load more",
            style: new TextStyle(
                color: Colors.blueAccent
            ),),
          onTap: (){
            setState(() {
              items.addAll(generateWordPairs().take(recordcont));
            }); //要改變視窗要記得佳setState
          },
        );
      }

      var isExist = _checks.contains(wordpair); //要有一個值去判斷他是否有選取到

      ListTile item = new ListTile(
        leading: new Icon(isExist ? Icons.check_box : Icons.check_box_outline_blank), // if else 的用法
        title: new Text(wordpair.asPascalCase),
        onTap: (){
          setState(() {
            if(isExist){
              _checks.remove(wordpair);
            }else{
              _checks.add(wordpair);
            }
            print(_checks);
          });

        },
      );
      return item;
    });
    return listTiles.toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("app Bar"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: (){

            Iterable<Widget> items = _checks.map((wordpair){
              return new Text(wordpair.asPascalCase, style: new TextStyle(fontSize: 30));
            }); // 這邊要再讀一次

            var route = new MaterialPageRoute(builder: (BuildContext context){
              return new Scaffold(
                appBar: new AppBar(
                  title: new Text("app bar"),
                ),
                body: new Center(
                 child: new Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: items.toList()
                 ),
                ),
              );
            });

            Navigator.of(context).push(route);
          })
        ],
      ),
      body: new Container(
        child: new ListView(
            children: _rendorRows()//一個集合
        ),
      ),
    );
  }
}
