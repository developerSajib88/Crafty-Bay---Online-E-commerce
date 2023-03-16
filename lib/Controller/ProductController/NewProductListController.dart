import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Model/Product/NewProductList.dart';

class NewProductListController extends GetxController{

  NewProductList? newProductList;

  Future<NewProductList?> getNewProductList()async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/ListProductByRemark/new"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      return newProductListFromJson(response.body);
    }
  }

  setNewProductList()async{
    newProductList = await getNewProductList();
    update();
  }

}