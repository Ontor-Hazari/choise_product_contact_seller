import 'package:flutter/material.dart';
import 'package:choise_product_contact_seller/BackgroudMainPage/background.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:choise_product_contact_seller/Admin/adminDatasubmit.dart';
import 'package:choise_product_contact_seller/LogSign/signup.dart';

class Login extends StatelessWidget {

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

        body: BackGround
          (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100)
                ,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36,


                  ),

                  textAlign: TextAlign.left,

                ),
              ),
              SizedBox(height: 100,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                       controller: email,

                  decoration: InputDecoration(



                      border: OutlineInputBorder(),

                      labelText: "Email"


                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                    controller: password,


                  decoration: InputDecoration(

                      border: OutlineInputBorder(),

                      labelText: "Password"


                  ),
                ),
              ),
              SizedBox(height: 20,),

              InkWell(
                child: Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child:Card(
                    elevation: 1,
                    child:  Text(
                      "New Admin Registraion?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFF2661FA)
                      ),
                    ),
                  ),
                ),
                onTap: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
              ),

              SizedBox(height: size.height * 0.05),

              RaisedButton(onPressed: () async {

                try {
                  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text
                  );


                  if(userCredential != null)
                  {
                    Fluttertoast.showToast(
                        msg: "Working",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminDataSubmit()),
                    );


                  }



                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                    Fluttertoast.showToast(
                        msg: "'user-not-found'",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                    Fluttertoast.showToast(
                        msg: "Wrong password provided for that user.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                  else if(e.email != email)
                    {
                      print('Wrong password provided for that user.');
                      Fluttertoast.showToast(
                          msg: "Wrong password provided for that user.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                }


              },
                child: Text("LogIN",style: TextStyle(fontWeight: FontWeight.bold),),
                color: Colors.red,
                textColor: Colors.white,

              )


            ],

          ),
        ),

    );
  }


}
