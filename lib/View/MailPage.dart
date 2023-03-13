import 'package:crafty_bay/View/MainPage/HomePage.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Styles/ButtonStyles.dart';
import '../Styles/Colors.dart';
import '../Styles/FontStyles.dart';
import '../Styles/TextFormStyles.dart';

class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png",width: 90,height: 100,),
              const SizedBox(height: 20,),
              Text("Complete Profile",style: textStyle5,),
              Text("Get started with us with your details ",style: subtitleAndFormTextStyles,),
              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                child: TextFormField(
                  cursorWidth: 3,
                  cursorColor: customTopaze,
                  style: subtitleAndFormTextStyles,
                  decoration: customInputDecoration("Email"),
                ),
              ),


              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: ElevatedButton(
                  onPressed: (){
                    Get.to(const HomePage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                  },
                  child: Text("Next",style: buttonTextStyles,),
                  style: customButtonStyle,
                ),
              ),


              const SizedBox(height: 50.0,)

            ],
          ),
        ),
      ),
    );
  }
}
