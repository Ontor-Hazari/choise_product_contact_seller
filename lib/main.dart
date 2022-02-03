
import 'package:flutter/material.dart';
import 'BackgroudMainPage/background.dart';
import 'LogSign/login.dart';
import 'LogSign/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firabase.dart';
import 'home.dart';



/*void main()
{
    runApp(new MaterialApp(
      title: 'MyApp',
      home: SignUp(),
    ));

}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(new MaterialApp(
    title: 'MyApp',
    home: Login(),
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
