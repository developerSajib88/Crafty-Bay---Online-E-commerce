import 'package:crafty_bay/Styles/ButtonStyles.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/Styles/TextFormStyles.dart';
import 'package:crafty_bay/View/PinVerificationPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/CustomStatusBar.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
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
                    decoration: customInputDecoration("First Name"),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                  child: TextFormField(
                    cursorWidth: 3,
                    cursorColor: customTopaze,
                    style: subtitleAndFormTextStyles,
                    decoration: customInputDecoration("Last Name"),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                  child: TextFormField(
                    cursorWidth: 3,
                    keyboardType: TextInputType.phone,
                    cursorColor: customTopaze,
                    style: subtitleAndFormTextStyles,
                    decoration: customInputDecoration("Mobile"),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                  child: TextFormField(
                    cursorWidth: 3,
                    cursorColor: customTopaze,
                    style: subtitleAndFormTextStyles,
                    decoration: customInputDecoration("City"),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                  child: TextFormField(
                    cursorWidth: 3,
                    cursorColor: customTopaze,
                    maxLines: 4,
                    style: subtitleAndFormTextStyles,
                    decoration: customInputDecoration("Shipping Address"),
                  ),
                ),


                Container(
                  width: double.infinity,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: ElevatedButton(
                    onPressed: (){
                      //Get.to(const PinVerificationPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                    },
                    child: Text("Complete",style: buttonTextStyles,),
                    style: customButtonStyle,
                  ),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }
}
