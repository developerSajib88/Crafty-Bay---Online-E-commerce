import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemView extends StatefulWidget {
  const CartItemView({Key? key}) : super(key: key);

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Container(
        width: double.infinity,
        height: 105,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x170a5050),
              offset: Offset(0, 1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Image.asset("assets/images/product_img.png",width: 80,height: 60,),
                    ),
                  ),
                ),

                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("New Year Special Shoe",style: cartTitleTextStyles,),
                            const Spacer(),
                            InkWell(
                                onTap: (){},
                                child: Icon(Icons.delete,color: customBlack,size: 18,))
                          ],
                        ),

                        Row(
                          children: [
                            Text("Color: Red",style: textStyle2,),
                            Text("Size: X",style: textStyle2,),
                          ],
                        ),

                        const SizedBox(height: 15,),

                        Row(
                          children: [
                            Text("\$100",style: GoogleFonts.poppins(textStyle: TextStyle(color: customTopaze,fontWeight: FontWeight.bold,fontSize: 15),)),
                            const Spacer(),
                          ],
                        )

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
