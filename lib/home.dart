import 'package:flutter/material.dart';
import 'package:choise_product_contact_seller/LogSign/signup.dart';
import 'package:choise_product_contact_seller/LogSign/login.dart';
import 'DataSHow/datashow.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choise Product"),),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 200),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center
          ,
          children: [

            RaisedButton(onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Login()),
              );

            },
              child: Text("Admin Panel"),
            )
            ,

            RaisedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  DataShow()),
              );
            },
              child: Text("Customers"),

            )

          ],
        ),
      )
    );
  }
}
