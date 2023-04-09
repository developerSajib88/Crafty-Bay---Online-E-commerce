import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:crafty_bay/Controller/UserController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateWishListController extends GetxController{

  UserController userController = Get.put(UserController());

  Future createWishList(int productId)async{
    http.Response response = await http.get(
      Uri.parse("${ApiResource().requestUri}/CreateWishList/$productId"),
      headers: ApiResource().getRequestHeader(userController.token)
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      Get.snackbar("Success", "Added this item in your wishList");
    }else{
      Get.snackbar("Failed", getMap["data"]);
    }

  }

}