import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController{

  var token = "";
  String userFirstName = "";
  String userLastName = "";
  String userMobile = "";
  String userCity = "";
  String userShippingAddress = "";

  bool userProfileComplete = false;

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
      token = getMap["data"];
      update();
      return true;
    }else{
      Get.snackbar("Failed", getMap["data"]);
      return false;
    }
  }
  
  
  //Create Profile
 Future<bool> CreateProfile(
     String firstName,lastName,mobile,city,shippinAddress
     )async{
    http.Response response = await http.post(Uri.parse("${
        ApiResource().requestUri}/CreateProfile"),
      headers: ApiResource().getRequestHeader(token),
      body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "mobile": mobile,
          "city": city,
          "shippingAddress": shippinAddress
        }),
    );

    userFirstName = firstName;
    userLastName = lastName;
    userMobile = mobile;
    userCity = city;
    userShippingAddress = shippinAddress;
    update();

    Map<String,dynamic> getMap = jsonDecode(response.body);

    if(response.statusCode == 200 && getMap["msg"] == "success"){
      setUserData();
      Get.snackbar("Successfull", "Your account is updated!");
      return true;
    }else{
      Get.snackbar("Failed", "Try again!");
      return false;
    }

 }


 setUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("userProfileComplete", true);
    sharedPreferences.setString("userToken", token);
    sharedPreferences.setString("userFirstName", userFirstName);
    sharedPreferences.setString("userLastName", userLastName);
    sharedPreferences.setString("userMobile", userMobile);
    sharedPreferences.setString("userCity", userCity);
    sharedPreferences.setString("userShippingAddress", userShippingAddress);
 }

 getUserData()async{
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   userProfileComplete = sharedPreferences.getBool("userProfileComplete")??false;
   token = sharedPreferences.getString("userToken")??"";
   userFirstName = sharedPreferences.getString("userFirstName")??"";
   userLastName = sharedPreferences.getString("userLastName")??"";
   userMobile = sharedPreferences.getString("userMobile")??"";
   userCity = sharedPreferences.getString("userCity")??"";
   userShippingAddress = sharedPreferences.getString("userShippingAddress")??"";
 }


  
}