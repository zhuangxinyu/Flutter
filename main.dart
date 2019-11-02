import 'package:flutter/material.dart';
import 'package:myflutter/lessons/mylistview/listview.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(new MyAPP());
}
class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "my flutter",
      home: new MyListView(),
    );
  }
}
