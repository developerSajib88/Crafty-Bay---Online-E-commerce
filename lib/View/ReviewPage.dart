import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/View/CreateReview.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:crafty_bay/Widgets/ItemViewStyles/ReviewItemView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/BackBar.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              BackBar(backName: "Reviews",),


              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (context,index){
                        return ReviewItemView();
                      }
                  )
              ),


              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: transparentTopaze,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Text("Reviews (1000)",style: textStyle6,),
                    const Spacer(),
                    SizedBox(
                      width: 43,
                      height: 43,
                      child: FloatingActionButton(
                        onPressed: (){
                          Get.to(const CreateReview(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                        },
                        child: const Icon(Icons.add),
                        backgroundColor: customTopaze,
                      ),
                    ),
                  ],
                ),

              )





            ],
          ),
        ),
      ),

    );
  }
}
