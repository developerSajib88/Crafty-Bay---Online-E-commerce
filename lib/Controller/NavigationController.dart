import 'package:crafty_bay/Controller/WishListController/UserWishListController.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController{

  RxInt navigationIndex = 0.obs;

  UserWishListController userWishListController = Get.put(UserWishListController());

  homeNavigationIndex(){
    navigationIndex = 0.obs;
    update();
  }

  categoryNavigationIndex(){
    navigationIndex = 1.obs;
    update();
  }

  cartNavigationIndex(){
    navigationIndex = 2.obs;
    update();
  }

  wishNavigationIndex(){
    navigationIndex = 3.obs;
    userWishListController.setUserWishList();
    update();
  }



}