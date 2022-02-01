import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:choise_product_contact_seller/Admin/ProdeuctDeo.dart';
import 'package:choise_product_contact_seller/Admin/productmodel.dart';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';



class DataShow extends StatefulWidget {


  @override
  _DataShowState createState() => _DataShowState();
}

class _DataShowState extends State<DataShow> {

  final productDeo = ProductDeo();

  dynamic ProductName;
  dynamic productPrice;
  String? productImage;
  dynamic MobileNumber;

  var _imgString ;
  _convert()
  {

    if(_imgString != null)
    {
      Uint8List _bytesImage = Base64Decoder().convert(_imgString);
      return  Image.memory(_bytesImage);
    }
  }

  _callNumber() async{
    var number = '${MobileNumber}'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("All Iteam"),),
      body: Column(
        children: [
          _getMessageList()
        ],
      ),

    );
  }

  Widget _getMessageList() {
    return Expanded(
      child: FirebaseAnimatedList(

        query: productDeo.getMessageQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final productModel = ProductModel.fromJson(json);
          ProductName = productModel.productName;
          productPrice = productModel.productPrice;
          MobileNumber = productModel.MobileNumber;
          _imgString = productModel.productImage.toString();
          return Column(children: [
            SizedBox(height: 10,),
            _convert(),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Product Name : ",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("${ProductName}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 24,color: Colors.deepOrange),),
                SizedBox(width: 100,),
                Text("Price : ",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                Text("${productPrice}",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 24,color: Colors.deepOrange),textAlign: TextAlign.right),

              ],
            ),

          Container(
            width: 350,
            child:   ElevatedButton(onPressed: (){

            }, child: Text("Call"),
              style:  ElevatedButton.styleFrom(
                  primary : Colors.green
              ),



            ),
          ),
            Container(
              width : 1000,
              height: 2,
              color: Colors.grey,
            )




          ],);

        },
      ),
    );
  }
}
