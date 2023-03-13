import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:flutter/material.dart';

class CaroselSlider extends StatefulWidget {
  const CaroselSlider({Key? key}) : super(key: key);

  @override
  State<CaroselSlider> createState() => _CaroselSliderState();
}

class _CaroselSliderState extends State<CaroselSlider> {

  ValueNotifier<int> carouselIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CarouselSlider(
              items: [
                Container(width: double.infinity,height: 100,color: Colors.red,),
                Container(width: double.infinity,height: 100,color: Colors.blue,),
                Container(width: double.infinity,height: 100,color: Colors.green,),
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
                  for(int i=0; i<3; i++)
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
    )
    ;
  }
}
