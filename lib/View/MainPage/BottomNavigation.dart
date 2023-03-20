import 'package:crafty_bay/Controller/CategoryController/CategoryController.dart';
import 'package:crafty_bay/Controller/NavigationController.dart';
import 'package:crafty_bay/Controller/ProductController/NewProductListController.dart';
import 'package:crafty_bay/Controller/ProductController/PopularProductController.dart';
import 'package:crafty_bay/Controller/ProductController/SpecialProductController.dart';
import 'package:crafty_bay/Controller/SliderImageListController.dart';
import 'package:crafty_bay/Controller/UserController.dart';
import 'package:crafty_bay/Controller/WishListController/UserWishListController.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/View/MailPage.dart';
import 'package:crafty_bay/View/MainPage/CartPage.dart';
import 'package:crafty_bay/View/MainPage/CategoryPage.dart';
import 'package:crafty_bay/View/MainPage/HomePage.dart';
import 'package:crafty_bay/View/MainPage/WishPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  CategoryController categoryController = Get.put(CategoryController());
  UserController userController = Get.put(UserController());
  PopularProductController popularProductController = Get.put(PopularProductController());
  SpecialProductController specialProductController = Get.put(SpecialProductController());
  NewProductListController newProductListController = Get.put(NewProductListController());
  SliderImageListController sliderImageListController = Get.put(SliderImageListController());
  UserWishListController userWishListController = Get.put(UserWishListController());

  NavigationController navigationController = Get.put(NavigationController());
  List myPage = [const HomePage(),const CategoryPage(),const CartPage(),const WishPage()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userController.getUserData();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      categoryController.setCategoryList();
      popularProductController.setPopularProduct();
      specialProductController.setSpecialProduct();
      newProductListController.setNewProductList();
      sliderImageListController.setSliderImageList();
      userWishListController.setUserWishList();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder<NavigationController>(
        builder: (_) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: myPage[navigationController.navigationIndex.value],
          );
        }
      ),

      bottomNavigationBar: Container(
        width: double.infinity,
        height: 68,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius:3,
              spreadRadius: 1,
              color: transparentTopaze
            )
          ]
        ),
        child: GetBuilder<NavigationController>(
          builder: (_){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Home option
                InkWell(
                  onTap: (){
                    navigationController.homeNavigationIndex();
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/home_ic.png",
                        width: 24,
                        height: 24,
                        color: navigationController.navigationIndex == 0? customTopaze:customGrey,
                      ),

                      const SizedBox(height: 5,),

                      Text("Home",style: navigationController.navigationIndex == 0? textStyle2Topaze:  textStyle2,)


                    ],
                  ),
                ),


                //Category option
                InkWell(
                  onTap: (){
                    navigationController.categoryNavigationIndex();
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/menu_ic.png",
                        width: 24,
                        height: 24,
                        color: navigationController.navigationIndex == 1? customTopaze:customGrey,
                      ),

                      const SizedBox(height: 5,),

                      Text("Category",style: navigationController.navigationIndex == 1? textStyle2Topaze:  textStyle2,)



                    ],
                  ),
                ),


                //Cart Option
                InkWell(
                  onTap: (){
                    if(userController.userProfileComplete == true){
                      navigationController.cartNavigationIndex();
                    }else{
                      Get.to(const MailPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500),);
                    }
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/cart_ic.png",
                        width: 24,
                        height: 24,
                        color: navigationController.navigationIndex == 2? customTopaze:customGrey,
                      ),

                      const SizedBox(height: 5,),

                      Text("Cart",style: navigationController.navigationIndex == 2? textStyle2Topaze:  textStyle2,)



                    ],
                  ),
                ),

                //Wish option
                InkWell(
                  onTap: (){
                    if(userController.userProfileComplete == true){
                      navigationController.wishNavigationIndex();
                    }else{
                      Get.to(const MailPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500),);
                    }
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/wish_ic.png",
                        width: 24,
                        height: 24,
                        color: navigationController.navigationIndex == 3? customTopaze:customGrey,
                      ),

                      const SizedBox(height: 5,),

                      Text("Wish",style: navigationController.navigationIndex == 3? textStyle2Topaze:  textStyle2,)



                    ],
                  ),
                ),
              ],
            );
          },
        )
      ),
    );
  }
}
