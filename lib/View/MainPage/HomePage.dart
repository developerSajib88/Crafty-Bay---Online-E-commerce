import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/Controller/NavigationController.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/View/MainPage/CategoryPage.dart';
import 'package:crafty_bay/Widgets/CaroselSlider.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/HomePageAppBar.dart';
import '../../Widgets/HomePageCategory.dart';
import '../../Widgets/ItemViewStyles/MainItemView.dart';
import '../../Widgets/NewProduct.dart';
import '../../Widgets/PopularProduct.dart';
import '../../Widgets/SpecialProduct.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [

              const HomePageAppBar(),
              const SizedBox(height: 10,),
              TextFormField(
                cursorColor: customTopaze,
                cursorWidth: 3,
                style: subtitleAndFormTextStyles,
                decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    focusColor: customGrey,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Image.asset("assets/icons/search_ic.png",width: 17,height: 17,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,width: 0),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white,width: 0),
                      borderRadius: BorderRadius.circular(8),

                    )

                ),
                onChanged: (value){
                  print(value);
                },
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      const SizedBox(height: 8,),

                      const CaroselSlider(),

                      Row(
                        children: [
                          Text("All Categories",
                              style: GoogleFonts.poppins(
                                  color: customBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)
                          ),

                          const Spacer(),

                          TextButton(
                              onPressed:(){
                                controller.categoryNavigationIndex();
                              },
                              child: Text("See All",style: categoryTextStyles,)
                          )

                        ],
                      ),

                      HomePageCategory(),

                      Row(
                        children: [
                          Text("Popular",
                              style: GoogleFonts.poppins(
                                  color: customBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)
                          ),

                          const Spacer(),

                          TextButton(
                              onPressed:(){
                              },
                              child: Text("See All",style: categoryTextStyles,)
                          )

                        ],
                      ),

                      PopulerProduct(),

                      Row(
                        children: [
                          Text("Special",
                              style: GoogleFonts.poppins(
                                  color: customBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)
                          ),

                          const Spacer(),

                          TextButton(
                              onPressed:(){
                              },
                              child: Text("See All",style: categoryTextStyles,)
                          )

                        ],
                      ),

                      SpecialProduct(),

                      Row(
                        children: [
                          Text("New",
                              style: GoogleFonts.poppins(
                                  color: customBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)
                          ),

                          const Spacer(),

                          TextButton(
                              onPressed:(){
                              },
                              child: Text("See All",style: categoryTextStyles,)
                          )

                        ],
                      ),

                      NewProduct(),




                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
