import 'dart:math';

import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = List.generate(Random().nextInt(10)+1, (index){
   return 'Item ${index}';
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listview reorder'),
      ),
      body: ReorderableListView(
          children: list.map((e) => ListTile(key: ObjectKey(e),title:Text(e) ,)).toList(), 
          onReorder: _onReorder),
    );
  }

  // 这个是重新排布的位置 排布
  _onReorder(int oldIndex, int newIndex){
    print('oldIndex: $oldIndex, newIndex: $newIndex');
    setState(() {
      if(newIndex == list.length){
        newIndex = list.length-1;
      }
      var item = list.removeAt(oldIndex);
      list.insert(newIndex, item);

    });

  }
}
