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

  // 定义数组。
  List list = List();
  // 上拉加载更多，就要监听listview这个控件的滑动
  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    list = List.generate(Random().nextInt(20) + 15, (i) => 'Item $i');
  // 可以进去就去加载跟刷新一样的数据
    _onRefrsh();

    // 监听滚动
    scrollController = ScrollController()..addListener(() {
       if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
         _loadMore();
       }
    });


  }
  
  // 加载更多
 Future<void> _loadMore()async{
     await Future.delayed(Duration(seconds: 2),(){
       setState(() {
         list.addAll(List.generate(Random().nextInt(5)+1, (index) => 'more Item $index'));

       });
     });
  }
  
  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  scrollController.dispose();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新'),
      ),
    body: Center(
         child: RefreshIndicator(
           displacement: 40, // 下拉多远才触发，默认是40
             child: list == null || list.isEmpty
             ? Center(
               child: CircularProgressIndicator(),
             )
             :ListView.builder(
               controller: scrollController,
                 itemCount: list?.length+1,
                 itemBuilder:(BuildContext context, int index){
                    if(index == list.length){
                      return Center(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Text('加载更多'),
                            ],
                          ),
                        )
                      );
                    }
                   return  ListTile(title: Text(list[index])) ;
                 }),
             onRefresh: _onRefrsh),
      )
    );
  }

//下拉刷新list数据 模拟网络过程。
  Future<void>_onRefrsh() async{
  await Future.delayed(Duration(seconds: 3),(){
    setState(() {
      list = List.generate(Random().nextInt(20) + 15, (index) => 'refresh item $index');

    });
  });
}

}
