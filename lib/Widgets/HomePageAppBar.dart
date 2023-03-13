import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatefulWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.asset("assets/images/second_logo.png",width: 120,height: 30,),
          const Spacer(),
          InkWell(
              onTap: (){},
              child: Image.asset("assets/icons/profile_ic.png",width: 34,height: 34,)
          ),

          const SizedBox(width: 10,),

          InkWell(
              onTap: (){},
              child: Image.asset("assets/icons/call_ic.png",width: 34,height: 34,)
          ),

          const SizedBox(width: 10,),

          InkWell(
              onTap: (){},
              child: Image.asset("assets/icons/notify_ic.png",width: 34,height: 34,)
          ),

        ],
      ),
    );
  }
}
