import 'package:flutter/material.dart';

import 'ItemViewStyles/MainItemView.dart';

class PopulerProduct extends StatefulWidget {
  const PopulerProduct({Key? key}) : super(key: key);

  @override
  State<PopulerProduct> createState() => _PopulerProductState();
}

class _PopulerProductState extends State<PopulerProduct> {
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
