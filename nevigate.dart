import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyNavigate extends StatefulWidget {
  @override
  _MyNavigateState createState() => _MyNavigateState();
}

class _MyNavigateState extends State<MyNavigate> {

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

      ListTile item = new ListTile(
        title: new Text(wordpair.asPascalCase),
        onTap: (){
          print(wordpair.asPascalCase);

          var route = new MaterialPageRoute(builder: (BuildContext context){
            return new Scaffold(
              appBar: new AppBar(
                title: new Text("app bar"),
              ),
              body: new Center(
                child: new Text(wordpair.asPascalCase, style: new TextStyle(
                  fontSize: 40.0,
                  color: Colors.amberAccent
                ),),
              ),
            );
          });

          Navigator.of(context).push(route);

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
      ),
      body: new Container(
        child: new ListView(
            children: _rendorRows()//一個集合
        ),
      ),
    );
  }
}
