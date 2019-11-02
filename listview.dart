import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  static int recordcont = 20;

  List<WordPair> items = generateWordPairs()
      .take(recordcont)
      .toList(); //一開始的List作為一個容器去接他，後面take是代表要拿幾筆資料，tolist是作為要接一個iterator

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("app bar"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(50.0),
        decoration: new BoxDecoration(
          color: Colors.green
        ),// decoratioin可以用來調整整個container的背景顏色或其他東西等
        child: new ListView.builder(
            itemBuilder: (BuildContext Context, int index) {
              print("index: $index"); // =print("index: "+index.toString())
              if(index > items.length-1){
                items.addAll( generateWordPairs()
                    .take(recordcont));
              } //因為items的大小最大只要到20，所以當index增加的時候會有拿完的現象，因此要用if來判斷
              return new Text(items[index].asPascalCase,
              style: new TextStyle(
                fontSize: 24.0,
                color:  Colors.amberAccent
              ),
              );

            }
        ),
      ),
    );
  }

}
