import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    //定义数据，根据数据渲染4个导航
  final List<Map<String, String>> _tablist = [{
    "icon": "lib/assets/ic_public_home_normal.png", //正常显示
    "active_icon": 'lib/assets/ic_public_home_active.png',  //选中显示
    "text":"首页",
  },{
    "icon": "lib/assets/ic_public_pro_normal.png", //正常显示
    "active_icon": 'lib/assets/ic_public_pro_active.png',  //选中显示 
    "text":"分类",
  },{
    "icon": "lib/assets/ic_public_cart_normal.png", //正常显示
    "active_icon": 'lib/assets/ic_public_cart_active.png',  //选中显示
    "text":"购物车",
  },{
    "icon": "lib/assets/ic_public_my_normal.png", //正常显示
    "active_icon": 'lib/assets/ic_public_my_active.png',  //选中显示
    "text":"我的",
  },
  ]; 
  int _currentIndex = 0;

  List<BottomNavigationBarItem> _getTableBarWidget(){
    return List.generate(_tablist.length, (int index){
      return BottomNavigationBarItem(
        icon: Image.asset(_tablist[index]["icon"]!,width: 30,height: 30,),
        activeIcon: Image.asset(_tablist[index]["active_icon"]!,width: 30,height: 30,),
        label: _tablist[index]["text"]!,
      );
    });
  }

  List<Widget> _getChildren(){
    return [HomeView(),CategoryView(),CartView(),MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: IndexedStack(
            index: _currentIndex,
            children: _getChildren(),
          )
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        onTap: (int index){
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items: _getTableBarWidget()
        ),
    );
  }
}