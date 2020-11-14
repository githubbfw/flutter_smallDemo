
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   // 这是是显示flutter，控件布局线条的
//    debugPaintSizeEnabled = true;
    return  MaterialApp(
      routes: {'/other':(BuildContext context)=>OtherPage()},
//      initialRoute: '/other', // 有这个设置，项目进入的第一个界面就是它。
      title: "MaterialApp",
      home: Homepage(),
    );
  }

}

  class Homepage extends StatefulWidget {
    @override
    _HomepageState createState() => _HomepageState();
  }

  class _HomepageState extends State<Homepage> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.ac_unit),
          centerTitle: true,
          actions: <Widget>[
            Icon(Icons.search),
            Icon(Icons.more_vert),
          ],
          title: Text('MaterialApp实例'),
        ),
        body: Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[
              RaisedButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('提示'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('是否删除'),
                                  Text('删除后不可恢复'),
                                  Text('删除后不可恢复'),
                                  Text('删除后不可恢复'),
                                  Text('删除后不可恢复'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('确定')),
                              FlatButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('取消')),

                              GestureDetector()

                            ],
                          );

                    });
                  })
            ],
          )
        ),
      );

    }
  }





class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OtherPage'),
      ),
      body: Container(

      ),
    );
  }
}














