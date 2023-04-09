import 'package:crafty_bay/Controller/UserController.dart';
import 'package:crafty_bay/Styles/ButtonStyles.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/CreateReveiwController.dart';
import '../Styles/Colors.dart';
import '../Styles/FontStyles.dart';
import '../Styles/TextFormStyles.dart';
import '../Widgets/BackBar.dart';

class CreateReview extends StatefulWidget {
  int productId;
  CreateReview({
    Key? key,
    required this.productId
  }) : super(key: key);

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {

  bool loading = false;

  GlobalKey<FormState> reviewKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  CreateReviewController createReviewController = Get.put(CreateReviewController());


  Future reviewHandler()async{
    if(reviewKey.currentState!.validate()){
      loading = true;
      setState(() {});
      bool getResponse = await createReviewController.createReview(reviewController.text, widget.productId);
      if(getResponse){
        loading = false;
        Get.back();
        setState(() {});
      }else{
        loading = false;
        setState(() {});
      }
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserController().getUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BackBar(backName: "Create Review", onPressed: ()=> Get.back(),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                  child: Form(
                    key: reviewKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: firstNameController,
                          cursorWidth: 3,
                          cursorColor: customTopaze,
                          style: subtitleAndFormTextStyles,
                          decoration: customInputDecoration("First Name"),
                          validator: (value){
                            if(value!.isEmpty)return "Enter your First Name";
                          },
                        ),

                        const SizedBox(height: 20,),

                        TextFormField(
                          controller: lastNameController,
                          cursorWidth: 3,
                          cursorColor: customTopaze,
                          style: subtitleAndFormTextStyles,
                          decoration: customInputDecoration("Last Name"),
                          validator: (value){
                            if(value!.isEmpty)return "Enter your Last Name";
                          },
                        ),

                        const SizedBox(height: 20,),


                        TextFormField(
                          controller: reviewController,
                          cursorWidth: 3,
                          cursorColor: customTopaze,
                          style: subtitleAndFormTextStyles,
                          decoration: customInputDecoration("Write Review"),
                          maxLines: 10,
                          validator: (value){
                            if(value!.isEmpty || value.length <10)return "Enter your comment minimum 10 character";
                          },
                        ),


                        const SizedBox(height: 20,),



                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: reviewHandler,
                            child: Visibility(
                              visible: loading == false,
                                replacement: SizedBox(width: 20,height: 20,child: CircularProgressIndicator(color: Colors.white,),),
                                child: Text("Submit",style: buttonTextStyles,)),
                            style: customButtonStyle,
                          ),
                        ),

                      ],
                    ),
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
