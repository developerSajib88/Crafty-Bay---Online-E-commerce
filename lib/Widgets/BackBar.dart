import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Styles/FontStyles.dart';

class BackBar extends StatefulWidget {

  String backName;
  VoidCallback onPressed;

  BackBar({Key? key,required this.backName,required this.onPressed}) : super(key: key);


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
                onPressed: widget.onPressed,
                icon: const Icon(Icons.arrow_back_ios_new,)
            ),

            Text(widget.backName,style: textStyle6,),

          ],
        ),

      ),
    );
  }
}
