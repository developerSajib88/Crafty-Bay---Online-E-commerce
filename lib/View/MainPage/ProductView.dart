
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/Widgets/BackBar.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  ValueNotifier<int> productIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xffF3F3F3),
          child: Column(
            children: [
              BackBar(backName: "Product Details"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CarouselSlider(
                            items: [
                              Container(width: double.infinity,height: 250,color: Colors.red,),
                              Container(width: double.infinity,height: 250,color: Colors.blue,),
                              Container(width: double.infinity,height: 250,color: Colors.green,),
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

                        Positioned(
                          bottom: 10,
                          child: ValueListenableBuilder(
                              valueListenable: productIndex,
                              builder: (context,index,_){
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for(int i=0; i<3; i++)
                                      Container(
                                        width: 13,
                                        height: 13,
                                        margin: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: productIndex.value == i? customTopaze : null,
                                            borderRadius: BorderRadius.circular(100),
                                            border: Border.all(color: Colors.white)
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
                            child: Text("Happy New Year Special Deal Save 30%",style: productTitleStyles,)
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
                        Text("4.5",style: textStyle6,),
                        const SizedBox(width: 15,),
                        Text("Reviews",style: categoryTextStyles,),
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
                    )
                    

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
