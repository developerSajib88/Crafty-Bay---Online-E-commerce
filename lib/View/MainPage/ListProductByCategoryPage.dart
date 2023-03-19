import 'package:crafty_bay/Controller/ProductController/ListProductByCategoryController.dart';
import 'package:crafty_bay/Widgets/BackBar.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:crafty_bay/Widgets/ItemViewStyles/MainItemView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Styles/Colors.dart';

class ListProductByCategory extends StatefulWidget {

  int categoryId;
  String categoryName;
  ListProductByCategory({
    Key? key,
    required this.categoryId,
    required this.categoryName,
  }) : super(key: key);

  @override
  State<ListProductByCategory> createState() => _ListProductByCategoryState();
}

class _ListProductByCategoryState extends State<ListProductByCategory> {


  ListProductByCategoryController listProductByCategoryController = Get.put(ListProductByCategoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listProductByCategoryController.setListProductByCategroy(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Column(
          children: [
            BackBar(
                backName: widget.categoryName,
                onPressed: () {
                  Get.back();
                }
            ),

            Expanded(
              child: GetBuilder<ListProductByCategoryController>(
                builder: (context) {
                  return Visibility(
                    visible: listProductByCategoryController.Loading == false,
                    replacement: Center(child: CircularProgressIndicator(color: customTopaze,),),
                    child: Visibility(
                      visible: listProductByCategoryController.listProductByCategoryModel?.data.length != 0,
                      replacement: const Center(child: Text("Empty"),),
                      child: GridView.builder(
                          padding: const EdgeInsets.only(top: 5,left: 10,right: 10,bottom: 10),
                          itemCount: listProductByCategoryController.listProductByCategoryModel?.data.length??0,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 8/11.5
                          ),
                          itemBuilder: (context,index){
                            return MainItemView(
                                productId: listProductByCategoryController.listProductByCategoryModel?.data[index].id ?? 0,
                                productImg: listProductByCategoryController.listProductByCategoryModel?.data[index].image??"",
                                productTitle: listProductByCategoryController.listProductByCategoryModel?.data[index].title??"",
                                productPrice: listProductByCategoryController.listProductByCategoryModel?.data[index].price??"",
                                productRatings: listProductByCategoryController.listProductByCategoryModel?.data[index].star??""
                            );
                          }
                      ),
                    ),
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
