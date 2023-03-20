import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:crafty_bay/Controller/UserController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Model/UserDataModel/WishListModel.dart';

class UserWishListController extends GetxController{

  UserWishList? userWishList;
  
  UserController userController = Get.put(UserController());
  
  Future<UserWishList?> getUserWishList()async{
    http.Response response = await http.get(
      Uri.parse("${ApiResource().requestUri}/ProductWishList"),
      headers: ApiResource().getRequestHeader(userController.token)
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      return userWishListFromJson(response.body);
    }

    
  }


  setUserWishList()async{
    userWishList = await getUserWishList();
    update();
  }

  
  
}