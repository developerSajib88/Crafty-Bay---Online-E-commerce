import 'package:crafty_bay/Controller/UserController.dart';

class ApiResource{


  String requestUri = "https://craftybay.teamrabbil.com/api";
  Map<String,String> getRequestHeader(String token){
    var requestHeader = {'Content-Type': 'application/json','token':"$token"};
    return requestHeader;
  }


}