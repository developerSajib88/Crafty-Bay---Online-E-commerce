import 'package:crafty_bay/Controller/ProductController/ReviewsListByProductController.dart';
import 'package:crafty_bay/Controller/UserController.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/View/CreateReview.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:crafty_bay/Widgets/ItemViewStyles/ReviewItemView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/BackBar.dart';

class ReviewPage extends StatefulWidget {
   int productId;
   ReviewPage({
    Key? key,
     required this.productId
   }) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {

  ReviewByProductController reviewByProductController = Get.put(ReviewByProductController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserController().getUserData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      reviewByProductController.setReviewData(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              BackBar(backName: "Reviews", onPressed: ()=>Get.back(),),


              Expanded(
                  child: GetBuilder<ReviewByProductController>(
                    builder: (context){
                      return Visibility(
                        visible: reviewByProductController.loading == false,
                        replacement: Center(child: CircularProgressIndicator(color: customTopaze,),),
                        child: Visibility(
                          visible: reviewByProductController.getReviewsByProduct?.data.length != 0,
                          replacement: const Center(child: Text("Empty"),),
                          child: ListView.builder(
                              itemCount: reviewByProductController.getReviewsByProduct?.data.length ?? 0,
                              itemBuilder: (context,index){
                                return ReviewItemView(
                                  userName: "${reviewByProductController.getReviewsByProduct?.data[index].profile.firstName ?? ""} ${reviewByProductController.getReviewsByProduct?.data[index].profile.lastName ?? ""}",
                                  userReview: reviewByProductController.getReviewsByProduct?.data[index].description ?? "",
                                );
                              }
                          ),
                        ),
                      );
                    },
                  ),
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
                          Get.to(CreateReview(productId: widget.productId,),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
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
