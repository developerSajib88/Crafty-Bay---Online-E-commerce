import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:crafty_bay/Model/Product/ListProductByCategoryModel.dart';
import 'package:crafty_bay/View/MainPage/ListProductByCategoryPage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class ListProductByCategoryController extends GetxController{

  ListProductByCategoryModel? listProductByCategoryModel;
  bool Loading = true;
  
  Future<ListProductByCategoryModel?> getProductListByCategoryWise(int getId)async{
    
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/ListProductByCategory/$getId"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      Loading = false;
      update();
      return listProductByCategoryModelFromJson(response.body);
    }
    
  }

  setListProductByCategroy(int id) async {
    listProductByCategoryModel = await getProductListByCategoryWise(id);
    update();
  }


}