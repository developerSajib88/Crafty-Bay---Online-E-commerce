import 'dart:async';
import 'dart:math';

import 'package:crafty_bay/Controller/UserController.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/View/CreateAccount.dart';
import 'package:crafty_bay/View/MailPage.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Styles/ButtonStyles.dart';
import '../Styles/FontStyles.dart';

class PinVerificationPage extends StatefulWidget {
  String getEmail;
  PinVerificationPage({Key? key,required this.getEmail}) : super(key: key);

  @override
  State<PinVerificationPage> createState() => _PinVerificationPageState();
}

class _PinVerificationPageState extends State<PinVerificationPage> {

  ValueNotifier<int> pinTime = ValueNotifier(120);
  bool Loading = false;

  UserController userController = Get.put(UserController());

  final TextEditingController pinController = TextEditingController();
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();


  Future timeCountDown()async{
    Timer getTime = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(pinTime.value == 0){
        timer.cancel();
      }else{
        pinTime.value--;
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeCountDown();
  }

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
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                appContext: context,
                onChanged: (String value) {  },
              ),
            ),


            Container(
              width: double.infinity,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: ElevatedButton(
                onPressed: ()async{
                  if(pinController.text.length == 4 && pinTime.value > 0) {

                    Loading = true;
                    setState(() {});

                    bool getResponse = await userController.pinVerification(widget.getEmail, pinController.text);
                    if(getResponse == true){
                      Get.to(const CreateAccount(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                      Loading = false;
                      setState(() {});
                    }else{
                      Loading = false;
                      setState(() {});
                    }
                  }
                },
                child: Visibility(
                  visible: Loading == false,
                    replacement:const SizedBox(width: 20, height: 20,child: CircularProgressIndicator(color: Colors.white,)),
                    child: Text("Next",style: buttonTextStyles,)),
                style: customButtonStyle,
              ),
            ),


            const SizedBox(height: 10,),
            
            
            ValueListenableBuilder(
                valueListenable: pinTime,
                builder: (context,index,_){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("This code will expire in",style: subtitleAndFormTextStyles,),
                      const SizedBox(width: 5,),
                      Text("${pinTime.value.toString()}s",style: categoryTextStyles,),
                    ],
                  );
                }
            ),

            TextButton(
                onPressed: (){
                  pinController.clear();
                  pinTime.value = 120;
                  timeCountDown();
                  userController.userEmailVerify(widget.getEmail);
                },
                child: Text("Resend Code",style: categoryTextStyles,),

            )
            

      ],
        ),
      ),
    );
  }
}
