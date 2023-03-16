import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/ProductController/PopularProductController.dart';
import 'ItemViewStyles/MainItemView.dart';

class PopulerProduct extends StatefulWidget {
  const PopulerProduct({Key? key}) : super(key: key);

  @override
  State<PopulerProduct> createState() => _PopulerProductState();
}

class _PopulerProductState extends State<PopulerProduct> {

  PopularProductController popularProductController = Get.put(PopularProductController());

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<PopularProductController>(
      builder: (context) {
        return SizedBox(
          height: 175,
          child: ListView.builder(
              itemCount: popularProductController.popularProductList?.data.length??0,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainItemView(
                    productId: popularProductController.popularProductList?.data[index].id ?? 0,
                    productImg: popularProductController.popularProductList?.data[index].image ?? "",
                    productTitle: popularProductController.popularProductList?.data[index].title??"",
                    productPrice: popularProductController.popularProductList?.data[index].price ?? "",
                    productRatings: popularProductController.popularProductList?.data[index].star ?? 0.00,
                  ),
                );
              }
          ),
        );
      }
    );

  }
}
