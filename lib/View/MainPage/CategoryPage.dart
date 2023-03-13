import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:flutter/material.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';


import '../../Widgets/BackBar.dart';
import '../../Widgets/ItemViewStyles/CategoryItemView.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Column(
          children: [
            BackBar(backName: "Category",),
            Expanded(
              child: GridView.builder(
                  itemCount: 30,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      childAspectRatio: 10/13
                  ),
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context,index){
                    return const CategoryItemView();
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

