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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新'),
      ),
    // CircularProgressIndicator 这个控件，不知道为什么，直接运行完，不会转圈，ctrl+s 热加载之后，会转圈。
    body: Center(
       child: Container(
         child: CircularProgressIndicator(),
       ) ,
    ),
    );
  }



}
