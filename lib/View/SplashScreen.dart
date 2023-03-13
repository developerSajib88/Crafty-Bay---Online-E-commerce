import 'dart:async';

import 'package:crafty_bay/Styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:get/get.dart';

import 'MainPage/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Get.off(const HomePage(),transition: Transition.cupertino,duration: const Duration(seconds: 1));
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset("assets/images/logo.png",width: 150,height: 160,),
            const Spacer(),
            SizedBox(
              width: 30,
                height: 30,
                child: CircularProgressIndicator(color: customTopaze,)),
            const SizedBox(height: 30,),
            Text("Version 1.0",style: textStyle3,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
