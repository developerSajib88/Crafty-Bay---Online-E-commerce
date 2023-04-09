import 'package:crafty_bay/Controller/UserController.dart';
import 'package:crafty_bay/View/PinVerificationPage.dart';
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

  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  UserController userController = Get.put(UserController());

  bool Loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: GetBuilder<UserController>(
          builder: (context) {
            return Container(
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
                    child: Form(
                      key: form,
                      child: TextFormField(
                        controller: emailController,
                        cursorWidth: 3,
                        cursorColor: customTopaze,
                        style: subtitleAndFormTextStyles,
                        decoration: customInputDecoration("Email"),
                        validator: (value){
                          if(value!.length < 6 && value.isEmpty)return "Enter your valid email";
                        },
                      ),
                    ),
                  ),


                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: ElevatedButton(
                      onPressed: ()async{
                        if(form.currentState!.validate()){
                          Loading = true;
                          setState(() {});
                          bool getResponse = await userController.userEmailVerify(emailController.text.trim());
                          if(getResponse == true){
                            Get.to(PinVerificationPage(getEmail: emailController.text.trim(),),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
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
                          replacement: SizedBox(width: 20,height: 20,child: const CircularProgressIndicator(color: Colors.white,)),
                          child: Text("Next",style: buttonTextStyles,)),
                      style: customButtonStyle,
                    ),
                  ),


                  const SizedBox(height: 50.0,)

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
