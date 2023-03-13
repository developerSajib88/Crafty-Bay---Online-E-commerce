import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/Widgets/BackBar.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';

import '../../Styles/ButtonStyles.dart';
import '../../Widgets/ItemViewStyles/CartItemView.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Column(
          children: [
            BackBar(backName: "Cart"),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return CartItemView();
                  }
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
}
