import 'package:get/get.dart';

class NavigationController extends GetxController{

  RxInt navigationIndex = 0.obs;

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
    update();
  }



}