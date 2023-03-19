import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/CreateAccount.dart';
import 'View/MainPage/BottomNavigation.dart';
import 'View/MainPage/ProductView.dart';
import 'View/ReviewPage.dart';
import 'View/SplashScreen.dart';

void main(){

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
