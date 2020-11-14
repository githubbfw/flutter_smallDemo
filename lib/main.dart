import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(new MyApp(
    items: new List<String>.generate(20, (i) => "Item ${i + 1}"),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    var ls = ['aaa','bbb','ccc'];
    print(test(ls,(str)=>str*2));

   // 这是是显示flutter，控件布局线条的
//    debugPaintSizeEnabled = true;
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body:  _buildListView ,
      ),
    );
  }

  // 带侧滑效果的listview
  ListView get _buildListView {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          if(index.isOdd){
            return Divider();
          }

          return new Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: new Key(item),
            // We also need to provide a function that will tell our app
            // what to do after an item has been swiped away.
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              items.removeAt(index);

              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away
            background: new Container(
              child:  Center(
                child: Text("删除"),
              ),
                color: Colors.red),
            child: Container(
              child: new ListTile(title: new Text('$item')),
//                decoration: BoxDecoration(
//                    border:Border(bottom: BorderSide(width: 1,color:Color(0xffe5e5e5) ))
//                ),
            ),
          );
        },
      );
  }
}

Widget testTextPan(){
  return RichText(
      text: TextSpan(
        text: '做一家受人尊重的企业',
        style: TextStyle(color: Colors.red,fontSize: 20),
        children: <TextSpan>[
          TextSpan(
            text: '动脑学院',
            style: TextStyle(color: Colors.blue,fontSize: 20),
            recognizer:TapGestureRecognizer()
              ..onTap = () async{
              String url = 'http://www.dongnaoedu.com/';
              if(await canLaunch(url)){
                await launch(url);
              }else{
                throw 'error :$url';
              }
              }
          ),
        ]
      ),
  );
}




List test(List list,String func(str)){
  for(var i = 0;i<list.length;i++){
    list[i] = func(list[i]);
  }
  return list;
}






