import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body:HomePage(),
      ),
    );
  }

}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;


    return Container(
            height:size/2,
      color:Colors.lightBlueAccent
    );
  }
}




//class HomePage extends StatelessWidget {
//
//  @override
//
//  Widget build(BuildContext context) {
//
//    var size = MediaQuery.of(context).size.height;
//
//    return Container(
//      height:size/2,
//      color:Colors.lightBlueAccent,
//
//    );
//  }
//
//}