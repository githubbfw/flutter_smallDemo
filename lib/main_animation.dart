import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _doubleAnim;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    _doubleAnim = Tween(begin: 100.0, end: 200.0).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '动画',
      home: Scaffold(
        appBar: AppBar(
          title: Text('1212'),
        ),
        body: MyLogo(animation: _doubleAnim),
      ),
    );
  }
}

class MyLogo extends AnimatedWidget {
  // 来一个旋转动画
  final Tween<double> _rotateAnim = Tween(begin: 0.0, end: 45.0);
//  final Tween<double> _scaleAnim = Tween(begin: 10.0, end: 50.0);

  MyLogo({Key key, @required Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _anim = listenable;

    return Transform.rotate(
        angle: _rotateAnim.evaluate(_anim),
        child: Container(
          color: Colors.red,
          child: Center(
            child: FlutterLogo(),
          ),
        ),
    );
    Container(
      color: Colors.red,
      width: _anim.value,
      height: _anim.value,
      child: FlutterLogo(),
    );
  }
}
