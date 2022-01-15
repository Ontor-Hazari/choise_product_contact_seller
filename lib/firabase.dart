import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class Network extends StatefulWidget {
  const Network({Key? key}) : super(key: key);

  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {

  final Future<FirebaseApp> _init = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NetWork"),),

       body: FutureBuilder(
         future: _init,
         builder: (context, snapshot) {
           // Check for errors
           if (snapshot.hasError) {
             return Center(
                 child: Text(
                     "Something went  : ${snapshot.error}"));

           }

           // Once complete, show your application
           if (snapshot.connectionState == ConnectionState.done) {
             return Center(
                 child: Text(
                     "Conection Done"));
           }


           // Otherwise, show something whilst waiting for initialization to complete
           return Center(child: CircularProgressIndicator(),);
         },
       ),
    );
  }
}
