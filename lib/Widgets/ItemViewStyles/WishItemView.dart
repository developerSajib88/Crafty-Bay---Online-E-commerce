import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:flutter/material.dart';

class WishItemView extends StatefulWidget {

  int wishId;
  int wishProductId;
  String wishProductImg;
  String wishProductTitle;
  String wishProductPrice;
  double wishProductRating;
  WishItemView({
    Key? key,
    required this.wishId,
    required this.wishProductId,
    required this.wishProductImg,
    required this.wishProductTitle,
    required this.wishProductPrice,
    required this.wishProductRating,
  }) : super(key: key);

  @override
  State<WishItemView> createState() => _WishItemViewState();
}

class _WishItemViewState extends State<WishItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color:  Color(0x170a5050),
            offset: Offset(0, 1),
            blurRadius: 5,
          ),
        ],
      ),

      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: transparentTopaze,
            child: Center(
              child: Image.network(widget.wishProductImg,width: 90,height: 70,),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(widget.wishProductTitle,style: textStyle1,),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      Text("\$100",style: priceTextStyles,),
                      const SizedBox(width: 10,),
                      
                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded,color: goldColor,size: 15,),
                          Text(widget.wishProductRating.toString(),style: textStyle1,),
                        ],
                      ),

                      const SizedBox(width: 10,),

                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: customTopaze
                        ),
                        child: Icon(Icons.delete,color: Colors.white,size: 10,),
                      )
                    ],
                  )
                ],
              ),
            ),
          )


        ],
      ),

    );
  }
}
