import 'package:crafty_bay/Styles/ButtonStyles.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/Styles/TextFormStyles.dart';
import 'package:crafty_bay/View/MainPage/HomePage.dart';
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

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController shippingAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
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
                      controller: firstNameController,
                      cursorWidth: 3,
                      cursorColor: customTopaze,
                      style: subtitleAndFormTextStyles,
                      decoration: customInputDecoration("First Name"),
                      validator: (value){
                        if(value!.isEmpty)return "Enter Your First Name";
                      },
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                    child: TextFormField(
                      controller: lastNameController,
                      cursorWidth: 3,
                      cursorColor: customTopaze,
                      style: subtitleAndFormTextStyles,
                      decoration: customInputDecoration("Last Name"),
                      validator: (value){
                        if(value!.isEmpty)return "Enter Your Last Name";
                      },                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                    child: TextFormField(
                      controller: mobileController,
                      cursorWidth: 3,
                      keyboardType: TextInputType.phone,
                      cursorColor: customTopaze,
                      style: subtitleAndFormTextStyles,
                      decoration: customInputDecoration("Mobile"),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter Your First Name";
                        }else if(value.length < 11){
                          return "Your phone number is not Valid";
                        }
                      },
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                    child: TextFormField(
                      controller: cityController,
                      cursorWidth: 3,
                      cursorColor: customTopaze,
                      style: subtitleAndFormTextStyles,
                      decoration: customInputDecoration("City"),
                      validator: (value){
                      if(value!.isEmpty)return "Enter Your City";
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 30),
                    child: TextFormField(
                      controller: shippingAddressController,
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

                        if(formkey.currentState!.validate()){
                          Get.to(const HomePage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                        }
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
      ),
    );
  }
}
