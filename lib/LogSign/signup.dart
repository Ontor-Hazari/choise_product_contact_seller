import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:choise_product_contact_seller/BackgroudMainPage/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../FireAuth.dart';
import 'FireAuth.dart';





class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

 var formkey = GlobalKey<FormState>();

 var name = TextEditingController();
 var email = TextEditingController();
 var password = TextEditingController();

 var s_name,s_email,s_password;

 Future<void> dataSubmit()
 async {
    if(formkey.currentState!.validate())
      {
        formkey.currentState!.save();

        User? user = await FireAuth.registerUsingEmailPassword(
            name: this.s_name, email: this.s_email, password:this.s_password

        );

        print("Name : ${this.s_name} Email : ${this.s_email} Password : ${this.s_password}");
      }
 }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
       body: BackGround(

           child: ListView(

             children: [
                  Padding(padding: EdgeInsets.all(20)
                    ,
                    child: Form(
                      key: formkey
                      ,
                      child: Column(
                              children: [
                                 SizedBox(height: 100,)
                                ,

                                   TextFormField(

                                     controller: name,
                                     decoration: InputDecoration(
                                       label: Text("Name")
                                     ),
                                     validator: (value)
                                     {
                                        if(value!.length == 0 || value.isEmpty)
                                          {
                                             return("Name Is requre");
                                          }
                                     },
                                     onSaved: (value)
                                     {
                                          this.s_name = value;
                                     },
                                   ),
                                TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                      label: Text("Email")
                                  ),
                                  validator: (value)
                                  {
                                    if(value!.length == 0 || value.isEmpty)
                                    {
                                      return("Email Is requre");
                                    }
                                  },
                                  onSaved: (value)
                                  {
                                        this.s_email = value;
                                  },
                                ),
                                TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(
                                      label: Text("Password")
                                  ),
                                  validator: (value)
                                  {
                                    if(value!.length < 6 )
                                    {
                                      return("Password Is Small 6 digit");
                                    }
                                    else if(value.isEmpty)
                                      {
                                        return("Password Is requre");
                                      }
                                  },
                                  onSaved: (value)
                                  {
                                        this.s_password = value;
                                  },
                                )
                                ,
                               Container(
                                 margin: EdgeInsets.only(top: 10)
                                 ,
                                 child:  RaisedButton(


                                   onPressed: (){

                                     dataSubmit();

                                 },
                                   child: Text("Sign Up"),

                                 ),
                               )

                              ],
                      ) ,
                    ),



                  )
             ],
           ),
       ),
    );
  }
}
