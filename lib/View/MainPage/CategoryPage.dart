import 'package:crafty_bay/Controller/CategoryController/CategoryController.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../Controller/NavigationController.dart';
import '../../Widgets/BackBar.dart';
import '../../Widgets/ItemViewStyles/CategoryItemView.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Column(
          children: [
            BackBar(backName: "Category", onPressed: () {
              Get.put(NavigationController()).homeNavigationIndex();
            },),
            Expanded(
              child: GridView.builder(
                  itemCount: categoryController.categoryList?.data.length??0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: 10/13
                  ),
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context,index){
                    return CategoryItemView(
                      id: categoryController.categoryList?.data[index].id ?? 0,
                      imagLink: categoryController.categoryList?.data[index].categoryImg??"",
                      cateGoryName: categoryController.categoryList?.data[index].categoryName??"",
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

