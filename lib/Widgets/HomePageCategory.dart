
import 'package:crafty_bay/Controller/CategoryController/CategoryController.dart';
import 'package:crafty_bay/Widgets/ItemViewStyles/CategoryItemView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageCategory extends StatefulWidget {
  const HomePageCategory({Key? key}) : super(key: key);

  @override
  State<HomePageCategory> createState() => _HomePageCategoryState();
}

class _HomePageCategoryState extends State<HomePageCategory> {

  CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
        itemCount: categoryController.categoryList?.data.length??0,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: CategoryItemView(
                id: categoryController.categoryList?.data[index].id ?? 0,
                imagLink: categoryController.categoryList?.data[index].categoryImg??"",
                cateGoryName: categoryController.categoryList?.data[index].categoryName??"",
              ),
            );
          }),
    );
  }
}
