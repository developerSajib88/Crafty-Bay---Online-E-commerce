
import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Model/Product/ReviewListBytProduct.dart';

class ReviewByProductController extends GetxController{

  GetReviewsByProduct? getReviewsByProduct;
  bool loading = true;

  Future getReview(int id)async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/ListReviewByProduct/$id"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      print("=======================================$getMap====================================");
      loading = false;
      update();
      return getReviewsByProductFromJson(response.body);
    }else{
      loading = false;
      update();
    }
  }


  setReviewData(int id)async{
    getReviewsByProduct = await getReview(id);
    print("=======================================$loading====================================");
    update();
  }


}