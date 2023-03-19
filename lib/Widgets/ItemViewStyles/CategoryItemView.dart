import 'package:crafty_bay/View/MainPage/ListProductByCategoryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Styles/Colors.dart';
import '../../Styles/FontStyles.dart';

class CategoryItemView extends StatefulWidget {

  int id;
  String imagLink;
  String cateGoryName;


   CategoryItemView({
    super.key,
     required this.id,
     required this.imagLink,
     required this.cateGoryName,
  });

  @override
  State<CategoryItemView> createState() => _CategoryItemViewState();
}

class _CategoryItemViewState extends State<CategoryItemView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(
            ListProductByCategory(
              categoryId: widget.id,
              categoryName: widget.cateGoryName,
            ),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds:500));
      },
      child: Column(
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: transparentTopaze,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
                child: Image.network(
              widget.imagLink,
              width: 40,
              height: 40,
            )),
          ),



          const SizedBox(
            height: 5,
          ),


          Text(
            widget.cateGoryName,
            style: categoryTextStyles,
          ),
        ],
      ),
    );
  }
}
