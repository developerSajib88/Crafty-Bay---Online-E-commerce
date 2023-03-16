import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../../Model/Product/PopularProductList.dart';

class PopularProductController extends GetxController{

  PopularProductList? popularProductList;

  
  Future<PopularProductList?> getPopularProductList()async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/ListProductByRemark/popular"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"]  == "success"){
      print("===================================================");
      print(getMap);
      print("===================================================");
      return popularProductListFromJson(response.body);
    }
  }

  setPopularProduct()async{
    popularProductList = await getPopularProductList();
    update();
  }
  
}