import 'package:crafty_bay/Controller/NavigationController.dart';
import 'package:crafty_bay/Controller/UserController.dart';
import 'package:crafty_bay/Controller/WishListController/CreateWishList.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/View/MailPage.dart';
import 'package:crafty_bay/View/MainPage/ProductView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainItemView extends StatefulWidget {

  int productId;
  String productImg;
  var productTitle;
  String productPrice;
  dynamic productRatings;

   MainItemView({
     Key? key,
     required this.productId,
     required this.productImg,
     required this.productTitle,
     required this.productPrice,
     required this.productRatings,
   }) : super(key: key);

  @override
  State<MainItemView> createState() => _MainItemViewState();
}

class _MainItemViewState extends State<MainItemView> {

  UserController userController = Get.put(UserController());
  CreateWishListController createWishListController = Get.put(CreateWishListController());
  NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ProductView(prouductId: widget.productId,),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
      },
      child: Container(
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
                child: Image.network(widget.productImg,width: 90,height: 70,),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.productTitle.toString(),style: textStyle1,maxLines: 2,overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        Text("\$${widget.productPrice}",style: priceTextStyles,),
                        const SizedBox(width: 10,),

                        Row(
                          children: [
                            Icon(Icons.star_rate_rounded,color: goldColor,size: 15,),
                            Text(widget.productRatings.toString(),style: textStyle1,),
                          ],
                        ),

                        const SizedBox(width: 10,),

                        InkWell(
                          onTap: (){
                            if(userController.userProfileComplete == true){
                              createWishListController.createWishList(widget.productId);
                            }else if(userController.userProfileComplete == false){
                              Get.to(const MailPage(),transition: Transition.cupertino,duration: const Duration(milliseconds: 500));
                            }
                          },
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: customTopaze
                            ),
                            child: Icon(Icons.favorite_border,color: Colors.white,size: 10,),
                          ),
                        )
                      ],
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
