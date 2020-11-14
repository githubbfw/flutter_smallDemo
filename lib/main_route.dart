
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
   int _currentIndex = 0;
   final _widgetOptions =[
     Text('1111'),
     Text('2222'),
     Text('3333'),
     Text('4444'),
   ];
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
          child: Center(
            child: _widgetOptions.elementAt(_currentIndex),
          ),
        ),
        floatingActionButton:FloatingActionButton(
          elevation: 0,//阴影效果。
          child: Icon(Icons.add),
            onPressed:(){ // 这就是定向的跳转了
              Navigator.pushNamed(context, '/other');
            }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index){
            setState(() {
              _currentIndex = index;
            });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  title:  Text('首页'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.merge_type),
                title:  Text('路牌'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.merge_type),
                title:  Text('11111'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.merge_type),
                title:  Text('4444'),
              ),
            ]
        ),
        drawer:Drawer(
//        elevation: 0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              otherAccountsPictures: <Widget>[
                Icon(Icons.camera_alt),
                Icon(Icons.camera_alt),
              ],
                accountName: Text("Teddy"),
                accountEmail: Text("12152455@qq.com"),
                decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/picture.png'),
                  fit: BoxFit.cover)
                ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/17.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员'),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员'),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员'),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('会员'),
            ),
            AboutListTile( // 这个点击可以弹框。
              icon: Icon(Icons.ac_unit),
              child: Text('关于'),
              applicationName: '天之大',
              applicationVersion: '1',
            )
          ],
        ),
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














