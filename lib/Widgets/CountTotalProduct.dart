import 'package:crafty_bay/Controller/CartListController/TotalProductController.dart';
import 'package:crafty_bay/Styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountTotalProduct extends StatefulWidget {
  const CountTotalProduct({Key? key}) : super(key: key);

  @override
  State<CountTotalProduct> createState() => _CountTotalProductState();
}

class _CountTotalProductState extends State<CountTotalProduct> {

  TotalProductController totalProductController = Get.put(TotalProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TotalProductController>(
      builder: (_) {
        return SizedBox(
                width: double.infinity,
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [

                  InkWell(
                    onTap: ()=>totalProductController.decrementProduct(),
                    child: Container(
                      width: 22, height: 20,alignment: Alignment.center,decoration: BoxDecoration(
                        color: lightTopaze,borderRadius: BorderRadius.circular(3)),
                      child: const Text("-",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),

                    ),
                  ),


                  Container(
                    width: 22, height: 20,alignment: Alignment.center,
                    child: Obx(()=>Text(totalProductController.totalProduct.toString(),style: TextStyle(color: customBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                    )

                  ),








                  InkWell(
                    onTap: ()=> totalProductController.incrementProduct(),
                    child: Container(
                      width: 22, height: 20,alignment: Alignment.center,decoration: BoxDecoration(
                        color: customTopaze,borderRadius: BorderRadius.circular(3)),
                      child: const Icon(Icons.add,color: Colors.white,size: 14,),

                    ),
                  )
                ],
                ),
              );
      }
    );

  }
}
