import 'package:firebase_database/firebase_database.dart';
import 'productmodel.dart';
class ProductDeo
{
  final DatabaseReference _productRef =
  FirebaseDatabase.instance.reference().child('product');




  void saveMessage(ProductModel productModel) {
    _productRef.push().set(productModel.toJson());
  }

  Query getMessageQuery() {
    return _productRef;
  }
}