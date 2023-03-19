import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class UserController extends GetxController{


  //User Email Verification
  Future<bool> userEmailVerify(String getEmail)async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/UserLogin/$getEmail"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      Get.snackbar("Success", getMap["data"],duration: const Duration(seconds: 3));
      return true;
    }else{
      Get.snackbar("Failed", getMap["data"],duration: const Duration(seconds: 3));
      return false;
    }
  }

  //User Pin Verification
  Future<bool> pinVerification(String email,pinCode)async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/VerifyLogin/$email/$pinCode"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      Get.snackbar("Successfull", "Pin Verification is Successfull");
      return true;
    }else{
      Get.snackbar("Failed", getMap["data"]);
      return false;
    }
  }

  
}