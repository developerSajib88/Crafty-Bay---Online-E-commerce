import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:crafty_bay/Model/Category/CategoryList.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class CategoryController extends GetxController{

  CategoryList? categoryList;

  Future<CategoryList?> getCategoryList()async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/CategoryList"));
    Map<String,dynamic> checkData = jsonDecode(response.body);
    if(response.statusCode == 200 && checkData["msg"]=="success"){
      return categoryListFromJson(response.body);
    }
  }

  setCategoryList()async{
    categoryList = await getCategoryList();
    update();
  }


}