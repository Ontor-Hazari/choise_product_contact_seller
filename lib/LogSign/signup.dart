import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:choise_product_contact_seller/BackgroudMainPage/background.dart';

class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
       body: BackGround(

           child: Column(


             children: [
               SizedBox(
                 height: 100,
               )
               ,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              alignment: Alignment.centerLeft
              ,
              child:    Text(
                "Sign Up",style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFF2661FA),
                  fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
               SizedBox(height: size.height * 0.1,),
               Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.symmetric(horizontal: 40),
                 child: TextField(
                   decoration: InputDecoration(
                       labelText: "Name"
                   ),
                 ),
               ),

               SizedBox(height: size.height * 0.01),

               Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.symmetric(horizontal: 40),
                 child: TextField(
                   decoration: InputDecoration(
                       labelText: "Email"
                   ),
                   obscureText: true,
                 ),
               ),
               SizedBox(height: size.height * 0.01),

               Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.symmetric(horizontal: 40),
                 child: TextField(
                   decoration: InputDecoration(
                       labelText: "Password"
                   ),
                   obscureText: true,
                 ),
               ),
             ],
           ),
       ),
    );
  }
}
