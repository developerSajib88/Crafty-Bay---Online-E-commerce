
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/Controller/ProductController/ProductDetailsController.dart';
import 'package:crafty_bay/Controller/ProductController/SpecialProductController.dart';
import 'package:crafty_bay/Controller/UserController.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/View/MailPage.dart';
import 'package:crafty_bay/View/ReviewPage.dart';
import 'package:crafty_bay/Widgets/BackBar.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Styles/ButtonStyles.dart';

class ProductView extends StatefulWidget {
  int prouductId;
  ProductView({Key? key,required this.prouductId}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  ValueNotifier<int> productIndex = ValueNotifier(0);
  ValueNotifier<int> productColorSelected = ValueNotifier(0);
  ValueNotifier<int> productSizeBgColor = ValueNotifier(0);

  ProductDetailsController productDetailsController = Get.put(ProductDetailsController());
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productDetailsController.setProductDetails(widget.prouductId);
    });
  }

  @override
  Widget build(BuildContext context) {

    print(widget.prouductId);

    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (context) {
          return CustomStatusBar(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xffF3F3F3),
              child: Column(
                children: [
                  BackBar(backName: "Product Details", onPressed: () {
                    Get.back();
                  },),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [

                                Visibility(
                                  visible: productDetailsController.productDetails?.data.length != null,
                                  replacement: Container(width: double.infinity,height: 250,child: Center(child: CircularProgressIndicator(color: customTopaze,)),),
                                  child: CarouselSlider(
                                      items: [
                                        Container(
                                          width: double.infinity,
                                          height: 250,
                                          color: customWhite,
                                          child: Center(
                                              child: Image.network(
                                                  productDetailsController
                                                          .productDetails
                                                          ?.data[0]
                                                          .img1 ?? "",
                                                  width: 235,
                                                  height: 175,
                                              )
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 250,
                                          color: customWhite,
                                          child: Center(
                                              child: Image.network(
                                                productDetailsController
                                                    .productDetails
                                                    ?.data[0]
                                                    .img2 ?? "",
                                                width: 235,
                                                height: 175,
                                              )
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 250,
                                          color: customWhite,
                                          child: Center(
                                              child: Image.network(
                                                productDetailsController
                                                    .productDetails
                                                    ?.data[0]
                                                    .img3 ?? "",
                                                width: 235,
                                                height: 175,
                                              )
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 250,
                                          color: customWhite,
                                          child: Center(
                                              child: Image.network(
                                                productDetailsController
                                                    .productDetails
                                                    ?.data[0]
                                                    .img4 ?? "",
                                                width: 235,
                                                height: 175,
                                              )
                                          ),
                                        ),
                                      ],
                                      options: CarouselOptions(
                                          height: 250,
                                          aspectRatio: 16/9,
                                          viewportFraction: 1,
                                          initialPage: 3,
                                          enableInfiniteScroll: true,
                                          reverse: false,
                                          autoPlay: false,
                                          autoPlayInterval: Duration(seconds: 3),
                                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          scrollDirection: Axis.horizontal,
                                          onPageChanged: (index,_){
                                            productIndex.value = index;
                                          }


                                      )
                                  ),
                                ),

                                Positioned(
                                  bottom: 10,
                                  child: ValueListenableBuilder(
                                      valueListenable: productIndex,
                                      builder: (context,index,_){
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            for(int i=0; i<4; i++)
                                              Container(
                                                width: 13,
                                                height: 13,
                                                margin: const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    color: productIndex.value == i? customTopaze : Colors.white,
                                                    borderRadius: BorderRadius.circular(100),
                                                ),
                                              )
                                          ],
                                        );
                                      }
                                  ),
                                )

                              ],
                            ),

                            const SizedBox(height: 5,),

                            Row(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Text(productDetailsController.productDetails?.data[0].product.title??"",style: productTitleStyles,)
                                ),

                                Expanded(
                                    flex: 1,
                                    child: Container(),
                                )
                              ],
                            ),

                            const SizedBox(height: 5,),

                            Row(
                              children: [
                                Icon(Icons.star_rate_rounded,color: goldColor,),
                                const SizedBox(width: 3,),
                                Text("${productDetailsController.productDetails?.data[0].product.star??0.0}".toString(),style: textStyle6,),
                                const SizedBox(width: 15,),
                                TextButton(
                                    onPressed: (){

                                      if(userController.userProfileComplete == true){
                                        Get.to(const ReviewPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                                      }else if(userController.userProfileComplete == false){
                                        Get.to(const MailPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                                      }


                                     },
                                    child: Text("Reviews",style: categoryTextStyles,)
                                ),
                                const SizedBox(width: 15,),
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: customTopaze,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Icon(Icons.favorite_border,color: Colors.white,size: 15,),
                                )


                              ],
                            ),

                            const SizedBox(height: 10,),

                            Text("Color",style: textStyle4,),
                            const SizedBox(height: 5,),
                            SizedBox(
                              width: double.infinity,
                              height: 27,
                              child: ValueListenableBuilder(
                                valueListenable: productColorSelected,
                                builder: (BuildContext context, value, Widget? child) {
                                  String getColor = productDetailsController.productDetails?.data[0].color??"";
                                  List<String> productColors = getColor.split(",");
                                  return ListView.builder(
                                      itemCount: productColors.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context,index){
                                        return InkWell(
                                          onTap: (){
                                            productColorSelected.value = index;
                                          },
                                          child: Container(
                                            width: 27,
                                            height: 27,
                                            margin: const EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                              color: Color(int.parse("0xff${productColors[index].replaceAll("#", "")}")),
                                              borderRadius: BorderRadius.circular(100),
                                            ),

                                            child:Center(
                                              child: Visibility(
                                                visible: productColorSelected.value == index,
                                                child: const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),

                                          ),
                                        );
                                      }
                                  );
                                },

                              )
                            ),


                            const SizedBox(height: 10,),
                            Text("Size",style: textStyle4,),
                            const SizedBox(height: 5,),
                            SizedBox(
                                width: double.infinity,
                                height: 27,
                                child: ValueListenableBuilder(
                                  valueListenable: productSizeBgColor,
                                  builder: (BuildContext context, value, Widget? child) {

                                    String getSize = productDetailsController.productDetails?.data[0].size??"";
                                    List<String> productSize = getSize.split(",");

                                    return ListView.builder(
                                        itemCount: productSize.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context,index){
                                          return InkWell(
                                            onTap: (){
                                              productSizeBgColor.value = index;
                                            },
                                            child: Container(
                                              height: 27,
                                              margin: const EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                color: productSizeBgColor.value == index? customTopaze: null,
                                                borderRadius: BorderRadius.circular(100),
                                                border: Border.all(color: customGrey),
                                              ),

                                              child:Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                  child: Text(
                                                    productSize[index],
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                      color: productSizeBgColor.value ==
                                                              index
                                                          ? Colors.white
                                                          : customGrey,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600
                                                    )),
                                                  ),
                                                ),
                                              ),

                                            ),
                                          );
                                        }
                                    );
                                  },

                                )
                            ),


                            const SizedBox(height: 10,),
                            Text("Description",style: textStyle4,),
                            const SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                productDetailsController.productDetails?.data[0].product.shortDes??"",
                                style: descriptionTextStyles,),
                            ),

                            const SizedBox(height: 10,),


                          ],
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                        color: transparentTopaze,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                    ),
                    child: Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Price",style: textStyle2,),
                              Text("\$1000000",style: priceTextStyles,),
                            ],
                          ),

                          const Spacer(),

                          SizedBox(
                            width: 120,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: (){},
                              child: Text("Checkout",style: buttonTextStyles,),
                              style: customButtonStyle,
                            ),

                          )

                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
