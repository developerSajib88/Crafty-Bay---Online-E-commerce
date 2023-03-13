import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:flutter/material.dart';

class MainItemView extends StatefulWidget {
  const MainItemView({Key? key}) : super(key: key);

  @override
  State<MainItemView> createState() => _MainItemViewState();
}

class _MainItemViewState extends State<MainItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height:141,
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
              child: Image.asset("assets/images/product_img.png",width: 90,height: 70,),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Year Special Shoe 30",style: textStyle1,maxLines: 2,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 3,),
                  Row(
                    children: [
                      Text("\$100",style: priceTextStyles,),
                      const SizedBox(width: 10,),

                      Row(
                        children: [
                          Icon(Icons.star_rate_rounded,color: goldColor,size: 15,),
                          Text("4.5",style: textStyle1,),
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
