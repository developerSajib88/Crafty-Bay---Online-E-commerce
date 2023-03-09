import 'package:crafty_bay/Styles/Colors.dart';
import 'package:crafty_bay/Styles/FontStyles.dart';
import 'package:flutter/material.dart';

class ReviewItemView extends StatefulWidget {
  const ReviewItemView({Key? key}) : super(key: key);

  @override
  State<ReviewItemView> createState() => _ReviewItemViewState();
}

class _ReviewItemViewState extends State<ReviewItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Container(
          width: double.infinity,
          height: 115,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: customGrey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset("assets/icons/user_ic.png",width: 5,height: 5,color: Colors.white,),
                    ),

                    const SizedBox(width: 5.0,),

                    Text("Rabbil Hasan",style: textStyle6,)

                  ],
                ),

                Text("Reference site about Lorem Ipsum, giving information on its origins, as well"
                      "as a random Lipsum generator Reference site about Lorem Ipsum, giving"
                      "information on its origins, as well as a random Lipsum generator",
                  style: textStyle2,
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
