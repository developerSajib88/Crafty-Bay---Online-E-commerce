import 'dart:async';

import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/View/MailPage.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Styles/ButtonStyles.dart';
import '../Styles/FontStyles.dart';

class PinVerificationPage extends StatefulWidget {
  const PinVerificationPage({Key? key}) : super(key: key);

  @override
  State<PinVerificationPage> createState() => _PinVerificationPageState();
}

class _PinVerificationPageState extends State<PinVerificationPage> {

  final TextEditingController pinController = TextEditingController();
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 20,),
            Image.asset("assets/images/logo.png",width: 90,height: 100,),
            const SizedBox(height: 20,),
            Text("Enter OTP Code",style: textStyle5,),
            Text("A 4 Digit OTP Code has been Sent",style: subtitleAndFormTextStyles,),
            const SizedBox(height: 20,),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 40,
                  fieldWidth: 40,
                  activeColor: customTopaze,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: customTopaze,
                  //selectedFillColor: Colors.white,
                  selectedColor: customTopaze,
                ),
                animationDuration: Duration(milliseconds: 300),
               // backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: pinController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                   // currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                appContext: context,
              ),
            ),


            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: ElevatedButton(
                onPressed: (){
                  Get.to(const MailPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                },
                child: Text("Next",style: buttonTextStyles,),
                style: customButtonStyle,
              ),
            ),


            const SizedBox(height: 10,),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("This code will expire in",style: subtitleAndFormTextStyles,),
                const SizedBox(width: 5,),
                Text("120s",style: categoryTextStyles,),
              ],
            ),

            TextButton(
                onPressed: (){},
                child: Text("Resend Code",style: categoryTextStyles,),

            )
            

      ],
        ),
      ),
    );
  }
}
