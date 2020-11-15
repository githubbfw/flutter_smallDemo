import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    Widget redDivider = Divider(color: Colors.red);
    Widget blueDivider = Divider(color: Colors.blue);
    return MaterialApp(
        home: Scaffold(
          body: Scrollbar(
            child: Center(
                child: ListView.separated(
                  itemCount: 50,
                  separatorBuilder: (BuildContext context, int index){
                    return index % 2 == 0 ? redDivider:blueDivider;
                  },
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(title: Text("我是列表$index"),);
                  },
                )
            ),
          ),
        )
    );
  }
}
