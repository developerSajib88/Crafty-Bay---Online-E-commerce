import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/Controller/SliderImageListController.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/View/MainPage/ProductView.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CaroselSlider extends StatefulWidget {
  const CaroselSlider({Key? key}) : super(key: key);

  @override
  State<CaroselSlider> createState() => _CaroselSliderState();
}

class _CaroselSliderState extends State<CaroselSlider> {

  ValueNotifier<int> carouselIndex = ValueNotifier(0);
  SliderImageListController sliderImageListController = Get.put(SliderImageListController());


  @override
  Widget build(BuildContext context) {
     return GetBuilder<SliderImageListController>(
      builder: (context) {
        int lenght = sliderImageListController.sliderImageList?.data.length ?? 0;
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CarouselSlider(
                  items: [
                    for(int i =0; i<lenght; i++)
                      Container(
              width: double.infinity,
              height: 100,
              color: customTopaze,
              child: Row(
              children: [

              const SizedBox(width: 15,),

              Expanded(
              child: Image.network(sliderImageListController.sliderImageList?.data[i].image??"",width: 175,height: 130,),
              ),

              Expanded(
              child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(sliderImageListController.sliderImageList?.data[i].title??"",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 17),),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Get.to(ProductView(prouductId: sliderImageListController.sliderImageList?.data[i].id??0),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                },
                child: Container(
                width: 95,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(6.0),
                ),
                child: const Text(
                'Buy Now',
                style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 9,
                color: const Color(0xff07aeaf),
                ),
                textAlign: TextAlign.center,
                softWrap: false,
                ),
                ),
              )
              ],
              ),
              )
              ),

              const SizedBox(width: 15,),

              ],
              ),
              )

                  ],
                  options: CarouselOptions(
                    height: 165,
                    aspectRatio: 16/9,
                    viewportFraction: 1,
                    initialPage: 3,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index,_){
                      carouselIndex.value = index;
                    }


                  )
              ),
            ),

            const SizedBox(height: 5,),

            ValueListenableBuilder(
                valueListenable: carouselIndex,
                builder: (context,index,_){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i=0; i<lenght; i++)
                        Container(
                          width: 13,
                          height: 13,
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: carouselIndex.value == i? customTopaze : null,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: customGrey)
                          ),
                        )
                    ],
                  );
                }
            ),
          ],
        );
      }
    )
    ;
  }
}
