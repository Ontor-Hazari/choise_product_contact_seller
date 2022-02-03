import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ProdeuctDeo.dart';
import 'productmodel.dart';
import 'package:firebase_database/firebase_database.dart';

class AdminDataSubmit extends StatefulWidget {


  @override
  _AdminDataSubmitState createState() => _AdminDataSubmitState();
}

class _AdminDataSubmitState extends State<AdminDataSubmit> {

  var image;

  var ima;
  String? path_name;
  String? fileName;
  var bytes;
  File? imageFile;
  String? base64string;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {

      imageFile = File(pickedFile.path);
      setState(() {

        image = imageFile;
        ima = imageFile;

        fileName = imageFile!.path;


      });

    }
  }




  var imaa = 'assets/images/insert.png';
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //var product_name = TextEditingController();
  var productName = TextEditingController();
  // int ProductPrice = TextEditingController() as int;
  //int AdminMobile = TextEditingController() as int;
  TextEditingController ProductPrice = new TextEditingController();
  TextEditingController AdminMobile = new TextEditingController();

  var product_name,product_price,admin_mobile;

  Future<void> AdmindataSubmit()
  async {
    if(formkey.currentState!.validate()){

      formkey.currentState!.save();

    }
  }

  final prodectDeo = ProductDeo();

  Future<void> _sendMessage() async {
    File imagefile = File(imageFile!.path); //convert Path to File
    Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
    base64string = base64.encode(imagebytes); //convert bytes to base64 string
    // print(base64string);



    final productmodel = ProductModel("${productName.text}",  int.parse(ProductPrice.text),"${base64string}", int.parse(AdminMobile.text));

    try
    {
      prodectDeo.saveMessage(productmodel);
      print("sucsess");

      print("${AdminMobile.text}");
    }
    catch(e)
    {
      print(e);
      print("s");
    }

    setState(() {});
  }



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
                child: image != null ? Image.file(image) : Image.asset("${imaa}"),
              ),
              SizedBox(
                height: 10,
              )
              ,
              ElevatedButton(onPressed: (){

                _getFromGallery();
                Fluttertoast.showToast(
                    msg: "Image pick",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );

              }, child: Text('Insert Image'),

                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )

                ),


              ),

              SizedBox(
                height: 10,
              ),

              Form(
                key: formkey
                ,
                child: Column(
                  children: [


                    Container(height:70,width:350,child:   TextFormField(

                      controller: productName,
                      decoration: InputDecoration(
                          label: Text("Product Name"),
                          border: OutlineInputBorder()
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
                        this.product_name = value;
                      },
                    ),),
                    SizedBox(height: 20,),
                    Container(height: 70,width: 350,
                      child: TextFormField(
                        controller: ProductPrice,
                        decoration: InputDecoration(
                            label: Text("Product Price"),
                            border: OutlineInputBorder()
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
                          this.product_price = value;
                        },


                      ),),
                    SizedBox(height: 20,),
                    Container(height: 70,width: 350,
                      child: TextFormField(
                        controller: AdminMobile,
                        decoration: InputDecoration(
                            label: Text("Mobile Number"),
                            border: OutlineInputBorder()
                        ),
                        validator: (value)
                        {

                          if(value!.isEmpty)
                          {
                            return("Mobile Number Is requre");
                          }
                        },
                        onSaved: (value)
                        {
                          this.admin_mobile = value;
                        },
                      ),
                    )
                    ,
                    ElevatedButton(onPressed: (){


                      //AdmindataSubmit();


                      _sendMessage();



                    }, child: Text('Submit Data'),

                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),

                          )

                      ),


                    ),

                  ],
                ) ,
              ),




            ],
          )
        ],
      ),
    );
  }
}
