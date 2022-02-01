class ProductModel
{
    String? productName;
    int? productPrice;
    String? productImage;
    int? MobileNumber;

    ProductModel(this.productName,this.productPrice,this.productImage,this.MobileNumber);


    ProductModel.fromJson(Map<dynamic, dynamic> json)
        :    productName = json['productName'] as String,
            productPrice = json['productPrice'] as int,
            productImage = json['productImage']??"",
            MobileNumber = json['MobileNumber'] as int
    ;

    Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'productName' : productName,
        'productPrice':productPrice,
        'productImage':productImage,
        'MobileNumber':MobileNumber

    };






}