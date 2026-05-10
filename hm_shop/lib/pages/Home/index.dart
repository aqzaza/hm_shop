import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/Category.dart';
import 'package:hm_shop/components/Home/Hot.dart';
import 'package:hm_shop/components/Home/MoreList.dart';
import 'package:hm_shop/components/Home/Silder.dart';
import 'package:hm_shop/components/Home/Suggestion.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  //获取滚动容器的内容
  List<Widget> _getScrollChildren(){
    return [
      // 包裹普通widget的sliver组件
      SliverToBoxAdapter(child: HmSlider()),
      //分类组件   slivergrid和sliverlist只能纵向排列，横向得用listview
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      SliverToBoxAdapter(child: HmCategory()),
      //推荐组件
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      SliverToBoxAdapter(child: HmSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      SliverToBoxAdapter(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:
      Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: HmHot()),
          SizedBox(width: 10,),
          Expanded(child: HmHot()),
        ],
        ),)
      ),
      //无限滚动列表
      SliverToBoxAdapter(child: SizedBox(height: 10,)),
      HmMoreList()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren(),);
  }
}