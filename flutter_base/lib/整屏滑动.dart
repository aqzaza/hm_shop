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
  PageController _pagecontroller = PageController();
  int _currentIndex = 0;  //当前选中的索引

  void _changeIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  void _changePage(int index){
    _pagecontroller.jumpToPage(index);
  }

  void _changeScroll(int index){
    _controller.jumpTo(index * 200);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [    //滑动组件
            SliverToBoxAdapter(   //用来包裹container，不然会报错，二者不共存
              child: Stack(
                children: [              
                Container(
                color: Colors.blue,
                alignment: Alignment.center,
                height: 260,
                child: PageView.builder(    //实现轮播图效果
                controller: _pagecontroller,
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Container(
                      child: Text('轮播图${index+1}',style: TextStyle(fontSize: 30,color: Colors.white)),
                      alignment: Alignment.center,
                    );
                  },
                  )
              ),
              Positioned(
                left: 0,bottom: 0, right: 0,height: 20,
                child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(10, (index){
                    return GestureDetector(
                      onTap: (){
                        //切换到相应page
                        // _pagecontroller.jumpToPage(index);
                        _pagecontroller.animateToPage(index,duration: Duration(seconds: 1),curve: Curves.linear);
                        setState(() {   //实时更新
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                      margin: EdgeInsets.only(left: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _currentIndex == index ? Colors.red : Colors.white,
                      ),
                    )
                    );
                  })
                )
                ),),
              ],
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
  double get maxExtent => 100;   //最大展开区高度

  @override
  // TODO: implement minExtent
  double get minExtent => 80;   //最小收起区高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {    //是否需要重新构建
    // TODO: implement shouldRebuild
    return false; //不重新构建，因为没有变化
  }
  
}