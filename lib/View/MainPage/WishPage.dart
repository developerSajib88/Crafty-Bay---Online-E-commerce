import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/NavigationController.dart';
import '../../Widgets/BackBar.dart';
import '../../Widgets/ItemViewStyles/WishItemView.dart';

class WishPage extends StatefulWidget {
  const WishPage({Key? key}) : super(key: key);

  @override
  State<WishPage> createState() => _WishPageState();
}

class _WishPageState extends State<WishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Column(
          children: [
            BackBar(backName: "Wish List", onPressed: () {
              Get.put(NavigationController()).homeNavigationIndex();
            },),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: 20,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 8/11
                    ),
                    itemBuilder: (context,index){
                      return const WishItemView();
                    }
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
