import 'package:crafty_bay/Controller/NavigationController.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
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

  NavigationController navigationController = Get.put(NavigationController());
  List myPage = [const HomePage(),const CategoryPage(),const CartPage(),const WishPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: myPage[navigationController.navigationIndex.value],
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
        child: Row(
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
                navigationController.cartNavigationIndex();
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
                navigationController.wishNavigationIndex();
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
        ),
      ),
    );
  }
}
