import 'package:crafty_bay/Widgets/ItemViewStyles/CategoryItemView.dart';
import 'package:flutter/material.dart';

class HomePageCategory extends StatefulWidget {
  const HomePageCategory({Key? key}) : super(key: key);

  @override
  State<HomePageCategory> createState() => _HomePageCategoryState();
}

class _HomePageCategoryState extends State<HomePageCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
        itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: CategoryItemView(),
            );
          }),
    );
  }
}
