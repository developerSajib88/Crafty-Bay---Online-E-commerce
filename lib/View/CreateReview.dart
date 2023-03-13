import 'package:crafty_bay/Styles/ButtonStyles.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';

import '../Styles/Colors.dart';
import '../Styles/FontStyles.dart';
import '../Styles/TextFormStyles.dart';
import '../Widgets/BackBar.dart';

class CreateReview extends StatefulWidget {
  const CreateReview({Key? key}) : super(key: key);

  @override
  State<CreateReview> createState() => _CreateReviewState();
}

class _CreateReviewState extends State<CreateReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BackBar(backName: "Create Review",),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorWidth: 3,
                        cursorColor: customTopaze,
                        style: subtitleAndFormTextStyles,
                        decoration: customInputDecoration("First Name"),
                      ),

                      const SizedBox(height: 20,),

                      TextFormField(
                        cursorWidth: 3,
                        cursorColor: customTopaze,
                        style: subtitleAndFormTextStyles,
                        decoration: customInputDecoration("First Name"),
                      ),

                      const SizedBox(height: 20,),


                      TextFormField(
                        cursorWidth: 3,
                        cursorColor: customTopaze,
                        style: subtitleAndFormTextStyles,
                        decoration: customInputDecoration("First Name"),
                        maxLines: 10,
                      ),


                      const SizedBox(height: 20,),



                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text("Submit",style: buttonTextStyles,),
                          style: customButtonStyle,
                        ),
                      ),

                    ],
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
