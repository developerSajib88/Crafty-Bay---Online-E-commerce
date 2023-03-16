import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Model/Product/SpecialProductList.dart';

class SpecialProductController extends GetxController{

  SpecialProductList? specialProductList;

  Future<SpecialProductList?> getSpecialProductList()async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/ListProductByRemark/special"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      return specialProductListFromJson(response.body);
    }

  }

  setSpecialProduct()async{
    specialProductList = await getSpecialProductList();
    update();
  }


}