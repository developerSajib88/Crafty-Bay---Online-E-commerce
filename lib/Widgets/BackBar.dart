import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Styles/FontStyles.dart';

class BackBar extends StatefulWidget {

  String backName;

  BackBar({Key? key,required this.backName}) : super(key: key);


  @override
  State<BackBar> createState() => _BackBarState();
}

class _BackBarState extends State<BackBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 57,
        child: Row(
          children: [
            IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new,)
            ),

            Text(widget.backName,style: textStyle6,),

          ],
        ),

      ),
    );
  }
}
