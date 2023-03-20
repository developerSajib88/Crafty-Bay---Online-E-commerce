import 'package:crafty_bay/Controller/WishListController/UserWishListController.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/NavigationController.dart';
import '../../Widgets/BackBar.dart';
import '../../Widgets/ItemViewStyles/WishItemView.dart';

class WishPage extends StatefulWidget {
  const WishPage({Key? key}) : super(key: key);

  @override
  State<WishPage> createState() => _WishPageState();
}

class _WishPageState extends State<WishPage> {

  UserWishListController userWishListController = Get.put(UserWishListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Column(
          children: [
            BackBar(backName: "Wish List", onPressed: () {
              Get.put(NavigationController()).homeNavigationIndex();
            },),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<UserWishListController>(
                  builder: (context){
                    return GridView.builder(
                        itemCount: userWishListController.userWishList?.data.length??0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 8/11
                        ),
                        itemBuilder: (context,index){
                          return WishItemView(
                              wishId: userWishListController.userWishList?.data[index].id??0,
                              wishProductId: userWishListController.userWishList?.data[index].productId??0,
                              wishProductImg: userWishListController.userWishList?.data[index].product.image??"",
                              wishProductTitle: userWishListController.userWishList?.data[index].product.title??"",
                              wishProductPrice: userWishListController.userWishList?.data[index].product.price??"",
                              wishProductRating: userWishListController.userWishList?.data[index].product.star??0.0
                          );
                        }
                    );
                  },
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
