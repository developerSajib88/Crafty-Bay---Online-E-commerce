import 'dart:convert';

import 'package:crafty_bay/Controller/Api_Resource/Api_Resource.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/SliderImageList.dart';

class SliderImageListController extends GetxController{
  
  SliderImageList? sliderImageList;
  
  Future<SliderImageList?> getSliderImageList()async{
    http.Response response = await http.get(Uri.parse("${ApiResource().requestUri}/ListProductSlider"));
    Map<String,dynamic> getMap = jsonDecode(response.body);
    if(response.statusCode == 200 && getMap["msg"] == "success"){
      return sliderImageListFromJson(response.body);
    }
  }

  setSliderImageList()async{
    sliderImageList = await getSliderImageList();
    update();
  }
  
  
}