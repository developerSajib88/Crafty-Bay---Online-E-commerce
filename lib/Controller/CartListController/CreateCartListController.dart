import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:crafty_bay/Controller/UserController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class CreateCartListController extends GetxController{

  UserController userController = Get.put(UserController());

  Future<bool> createCartList(int productId, String color,size)async{
    http.Response response = await http.put(
        Uri.parse("${ApiResource().requestUri}/CreateCartList"),
        headers: ApiResource().getRequestHeader(userController.token),
        body: jsonEncode(
          {
            "product_id":productId,
            "color":color,
            "size":size
          }
        ),
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      Get.snackbar("Success", "Your Item is Added");
      return true;
    }else{
      print("method is called===========================================");
      Get.snackbar(getMap["msg"], getMap["data"]);
      return false;
    }

  }

}