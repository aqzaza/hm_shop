import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(   //用来包裹container，不然会报错，二者不共存
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                height: 260,
                child: Text('轮播图',style: TextStyle(fontSize: 30,color: Colors.white)),
              )
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10,)
            ),
            SliverPersistentHeader(delegate: _StickyCategory(),
            pinned: true,   //固定吸顶
            ),  
            SliverToBoxAdapter(
              child: SizedBox(height: 10,)
            ),   //粘性组件，需要声明
            SliverGrid.count(  //多行多列
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: List.generate(50, (index){
                return Container(
                  height: 100,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child:Text('列表项${index+1}',style: TextStyle(color: Colors.white,fontSize: 20)),
                );
              }),
            ),



            // 一列：SliverList.separated(
            //   itemCount: 50, 
            //   itemBuilder: (context, index){
            //     return Container(
            //       height: 100,
            //       color: Colors.blue,
            //       alignment: Alignment.center,
            //       child:Text('列表项${index+1}',style: TextStyle(color: Colors.white,fontSize: 20)),
            //     );
            //   }, 
            //   separatorBuilder: (context, index){
            //     return SizedBox(height: 10,);
            //   },),
          ],
        )
      )
    );
  }
}

class _StickyCategory extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    // throw UnimplementedError();
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: 30,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
        return Container(
          // height: 60,
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('分类${index+1}',style: TextStyle(color: Colors.white)),
        );
      }),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 80;   //最大展开区高度

  @override
  // TODO: implement minExtent
  double get minExtent => 30;   //最小收起区高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {    //是否需要重新构建
    // TODO: implement shouldRebuild
    return false; //不重新构建，因为没有变化
  }
  
}