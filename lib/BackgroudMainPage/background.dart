import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {

  final Widget child;

  const BackGround({
    Key? key,
    required this.child,
  }) : super(key: key);
  

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      child: Stack(
        alignment: Alignment.center
        ,
        children: [
          Positioned(child: Image.asset(  "assets/images/top1.png"),
            top: 0,
            right: 0,
            width: size.width,
          ),
          Positioned(child: Image.asset(  "assets/images/top2.png"),
            top: 0,
            right: 0,
            width: size.width,

          ),
          Positioned(child: Image.asset(  "assets/images/main.png"),
            top: 50,
            width: size.width * 0.35,
            right: 30,

          ),
          Positioned(child: Image.asset(  "assets/images/bottom1.png"),
            bottom: 0,
            right: 0,
            width: size.width,

          ),
          Positioned(child: Image.asset(  "assets/images/bottom1.png"),
            bottom: 0,
            right: 0,
            width: size.width,
          ),
          child

        ],
      ),

    );
  }
}
