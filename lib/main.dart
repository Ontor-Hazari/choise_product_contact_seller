
import 'package:flutter/material.dart';
import 'BackgroudMainPage/background.dart';
import 'LogSign/login.dart';
import 'LogSign/signup.dart';

void main()
{
    runApp(new MaterialApp(
      title: 'MyApp',
      home: SignUp(),
    ));

}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyAplication"),),


    );
  }
}
