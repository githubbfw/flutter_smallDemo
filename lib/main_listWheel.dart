import 'package:flutter/material.dart';

void main() {
  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:HomePage(),
      ),
    );;
  }
}






class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var images  = [
    'images/picture.png',
    'images/picture.png',
    'images/picture.png',
    'images/picture.png',
    'images/picture.png',
    'images/picture.png',
    'images/picture.png',
    'images/picture.png',
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: '动画',
      home: Scaffold(
        appBar: AppBar(
          title: Text('1212'),
        ),
        body:Center(
          child: ListWheelScrollView(
            perspective: 0.003,
            diameterRatio: 2.0,
            itemExtent: screenWidth,
            children: images.map((e) => Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(e,fit: BoxFit.cover,),
                  Positioned(
                    bottom: 30.0,
                    left: 30.0,
                    child: Text(
                      '天之道',
                      style: TextStyle(
                          color: Color(0xffffffff), fontSize: 30.0),
                    ),
                  )
                ],
              ),
            )).toList(),

          ),
        )
      ),
    );
  }
}


