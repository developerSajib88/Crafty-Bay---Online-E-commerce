import 'package:get/get.dart';

class TotalProductController extends GetxController{
  RxInt totalProduct = 1.obs;

  void incrementProduct(){
    totalProduct++;
  }

  void decrementProduct(){
    if(totalProduct > 1) totalProduct--;
  }



}