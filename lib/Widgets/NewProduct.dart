import 'package:crafty_bay/Controller/ProductController/NewProductListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ItemViewStyles/MainItemView.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {

  NewProductListController newProductListController = Get.put(NewProductListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewProductListController>(
      builder: (context) {
        return SizedBox(
          height: 175,
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainItemView(
                      productId: newProductListController.newProductList?.data[index].id??0,
                      productImg: newProductListController.newProductList?.data[index].image ?? "",
                      productTitle: newProductListController.newProductList?.data[index].title ?? "",
                      productPrice: newProductListController.newProductList?.data[index].price ?? "",
                      productRatings: newProductListController.newProductList?.data[index].star ?? ""
                  )
                );
              }
          ),
        );
      }
    );
  }
}
