import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:crafty_bay/Widgets/CustomStatusBar.dart';
import 'package:crafty_bay/Widgets/ItemViewStyles/ReviewItemView.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomStatusBar(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Card(
                child: Container(
                  width: double.infinity,
                  height: 57,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){},
                          icon: const Icon(Icons.arrow_back_ios_new,)
                      ),

                      Text("Reviews",style: textStyle6,),

                    ],
                  ),

                ),
              ),


              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (context,index){
                        return ReviewItemView();
                      }
                  )
              ),





            ],
          ),
        ),
      ),
    );
  }
}
