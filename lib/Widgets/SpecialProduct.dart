import 'package:flutter/material.dart';

import 'ItemViewStyles/MainItemView.dart';

class SpecialProduct extends StatefulWidget {
  const SpecialProduct({Key? key}) : super(key: key);

  @override
  State<SpecialProduct> createState() => _SpecialProductState();
}

class _SpecialProductState extends State<SpecialProduct> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemBuilder: (context,index){
            return const Padding(
              padding:  EdgeInsets.all(8.0),
              child: MainItemView(),
            );
          }
      ),
    );
  }
}
