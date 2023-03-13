import 'package:flutter/material.dart';

import 'ItemViewStyles/MainItemView.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({Key? key}) : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
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
