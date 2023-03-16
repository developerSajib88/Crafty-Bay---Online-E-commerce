import 'package:crafty_bay/Controller/ProductController/SpecialProductController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ItemViewStyles/MainItemView.dart';

class SpecialProduct extends StatefulWidget {
  const SpecialProduct({Key? key}) : super(key: key);

  @override
  State<SpecialProduct> createState() => _SpecialProductState();
}

class _SpecialProductState extends State<SpecialProduct> {

  SpecialProductController specialProductController = Get.put(SpecialProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialProductController>(
      builder: (context) {
        return SizedBox(
          height: 175,
          child: ListView.builder(
              itemCount: specialProductController.specialProductList?.data.length ?? 0,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MainItemView(
                      productId: specialProductController.specialProductList?.data[index].id ?? 0,
                      productImg: specialProductController.specialProductList?.data[index].image??"",
                      productTitle: specialProductController.specialProductList?.data[index].title??"",
                      productPrice: specialProductController.specialProductList?.data[index].price??"",
                      productRatings: specialProductController.specialProductList?.data[index].star??"",
                  ),
                );
              }
          ),
        );
      }
    );
  }
}
