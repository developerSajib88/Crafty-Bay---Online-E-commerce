import 'dart:convert';

import 'package:crafty_bay/Controller/UserController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'Api_Resource/Api_Resource.dart';

class CreateReviewController extends GetxController{

  UserController userController = Get.put(UserController());

  Future<bool>createReview(String getReview, int productId)async{
    print("==================================${userController.token} unothor==================================");
    http.Response response = await http.post(
        Uri.parse("${ApiResource().requestUri}/CreateProductReview"),
        headers: ApiResource().getRequestHeader("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJVc2VyRW1haWwiOiJtZHNhamliaG9zc2FpbnRhbHVrZGVyQGdtYWlsLmNvbSIsImlhdCI6MTY4MDc1OTExMiwibmJmIjoxNjgwNzU5MTE1LCJleHAiOjE2ODA4NDU1MTJ9.YcWlptrTYbi7wTACIrFUDXhL40tjPWZrfQSN9h3B94I"),
        body: jsonEncode({
          "description":getReview,
          "product_id": productId
        })
    );

    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      Get.snackbar("Successful", "Review send successful!");
      return true;
    }else{
      Get.snackbar("Failed", "Review ${getMap["data"]}]");
      return false;
    }

  }

}