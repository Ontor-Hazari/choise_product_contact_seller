import 'package:flutter/material.dart';

class AdminDataSubmit extends StatefulWidget {


  @override
  _AdminDataSubmitState createState() => _AdminDataSubmitState();
}

class _AdminDataSubmitState extends State<AdminDataSubmit> {

  var ima = 'assets/images/insert.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Data Submit"),),
      body: ListView(
        children: [
            Column(
              children: [
                    Container(
                       height: 200,
                        width: 250,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        
                        border:Border.all(color: Colors.green,width: 2),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.asset("${ima}"),
                    ),
                 SizedBox(
                   height: 10,
                 )
                 ,
                 ElevatedButton(onPressed: (){

                 }, child: Text('Insert Image'),

                   style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)
                       )

                   ),


                 )
              ],
            )
        ],
      ),
    );
  }
}
