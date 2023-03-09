import 'package:crafty_bay/Styles/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomStatusBar extends StatelessWidget {
   Widget child;
   CustomStatusBar({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: customTopaze,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: child,
        ),
      ),
    );
  }
}
