import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:crafty_bay/Model/Product/ProductDetails.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductDetailsController extends GetxController{

  ProductDetails? productDetails;

  Future<ProductDetails?> getProductDetails(int getProductId)async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/ProductDetailsById/$getProductId"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      return productDetailsFromJson(response.body);
    }
  }

  setProductDetails(int productId) async {
    productDetails = await getProductDetails(productId);
    update();
  }



}