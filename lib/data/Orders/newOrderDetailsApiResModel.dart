

// class NewOrderDetailsApiResModel {
//   String? message;
//   Order? order;

//   NewOrderDetailsApiResModel({this.message, this.order});

//   NewOrderDetailsApiResModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     order = json['order'] != null ? new Order.fromJson(json['order']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.order != null) {
//       data['order'] = this.order!.toJson();
//     }
//     return data;
//   }
// }

// class Order {
//   String? sId;
//   String? orderNumber;
//   String? orderStatus;
//   String? orderId;
//   int? shipmentId;
//   List<Products>? products;
//   String? customer;
//   Address? address;
//   int? amount;
//   int? totalAmt;
//   bool? deliveredStatus;
//   int? status;
//   String? awbCode;
//   String? customerId;
//   String? orderAmount;
//   String? createdAt;
//   String? updaFlutterTedAt;
//   String? orderDate;
//   String? deliveryService;

//   Order(
//       {this.sId,
//       this.orderNumber,
//       this.orderStatus,
//       this.orderId,
//       this.shipmentId,
//       this.products,
//       this.customer,
//       this.address,
//       this.amount,
//       this.totalAmt,
//       this.deliveredStatus,
//       this.status,
//       this.awbCode,
//       this.customerId,
//       this.orderAmount,
//       this.createdAt,
//       this.updaFlutterTedAt,
//       this.orderDate,
//       this.deliveryService});

//   Order.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     orderNumber = json['orderNumber'];
//     orderStatus = json['orderStatus'];
//     orderId = json['orderId'];
//     shipmentId = json['shipment_id'];
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//     customer = json['customer'];
//     address =
//         json['address'] != null ? new Address.fromJson(json['address']) : null;
//     amount = json['amount'];
//     totalAmt = json['totalAmt'];
//     deliveredStatus = json['deliveredStatus'];
//     status = json['status'];
//     awbCode = json['awb_code'];
//     customerId = json['customerId'];
//     orderAmount = json['orderAmount'];
//     createdAt = json['createdAt'];
//     updaFlutterTedAt = json['upda flutter: tedAt'];
//     orderDate = json['orderDate'];
//     deliveryService = json['deliveryService'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['orderNumber'] = this.orderNumber;
//     data['orderStatus'] = this.orderStatus;
//     data['orderId'] = this.orderId;
//     data['shipment_id'] = this.shipmentId;
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     data['customer'] = this.customer;
//     if (this.address != null) {
//       data['address'] = this.address!.toJson();
//     }
//     data['amount'] = this.amount;
//     data['totalAmt'] = this.totalAmt;
//     data['deliveredStatus'] = this.deliveredStatus;
//     data['status'] = this.status;
//     data['awb_code'] = this.awbCode;
//     data['customerId'] = this.customerId;
//     data['orderAmount'] = this.orderAmount;
//     data['createdAt'] = this.createdAt;
//     data['upda flutter: tedAt'] = this.updaFlutterTedAt;
//     data['orderDate'] = this.orderDate;
//     data['deliveryService'] = this.deliveryService;
//     return data;
//   }
// }

// class Products {
//   String? productId;
//   String? productName;
//   List<String>? productImage;
//   List<VariantId>? variantId;
//   int? quantity;
//   int? price;
//   int? mrp;

//   Products(
//       {this.productId,
//       this.productName,
//       this.productImage,
//       this.variantId,
//       this.quantity,
//       this.price,
//       this.mrp});

//   Products.fromJson(Map<String, dynamic> json) {
//     productId = json['productId'];
//     productName = json['productName'];
//     productImage = json['productImage'].cast<String>();
//     if (json['variantId'] != null) {
//       variantId = <VariantId>[];
//       json['variantId'].forEach((v) {
//         variantId!.add(new VariantId.fromJson(v));
//       });
//     }
//     quantity = json['quantity'];
//     price = json['price'];
//     mrp = json['mrp'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['productId'] = this.productId;
//     data['productName'] = this.productName;
//     data['productImage'] = this.productImage;
//     if (this.variantId != null) {
//       data['variantId'] = this.variantId!.map((v) => v.toJson()).toList();
//     }
//     data['quantity'] = this.quantity;
//     data['price'] = this.price;
//     data['mrp'] = this.mrp;
//     return data;
//   }
// }

// class VariantId {
//   String? id;
//   String? title;

//   VariantId({this.id, this.title});

//   VariantId.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     return data;
//   }
// }

// class Address {
//   String? name;
//   String? zip;
//   String? address;
//   String? mobile;
//   String? email;
//   String? state;
//   String? city;

//   Address(
//       {this.name,
//       this.zip,
//       this.address,
//       this.mobile,
//       this.email,
//       this.state,
//       this.city});

//   Address.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     zip = json['zip'];
//     address = json['address'];
//     mobile = json['mobile'];
//     email = json['email'];
//     state = json['state'];
//     city = json['city'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['zip'] = this.zip;
//     data['address'] = this.address;
//     data['mobile'] = this.mobile;
//     data['email'] = this.email;
//     data['state'] = this.state;
//     data['city'] = this.city;
//     return data;
//   }
// }


class NewOrderDetailsApiResModel {
  String? message;
  Order? order;

  NewOrderDetailsApiResModel({this.message, this.order});
// _TypeError (type 'String' is not a subtype of type 'List<dynamic>?' in type cast)
  NewOrderDetailsApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  String? sId;
  String? orderNumber;
  String? orderStatus;
  String? orderId;
  int? shipmentId;
  List<Products>? products;
  String? sellerId;
  String? sellerName;
  String? awbCode;
  String? customer;
  Address? address;
  int? amount;
  int? totalAmt;
  String? paymentStatus;
  String? customerId;
  String? orderAmount;
  String? paymentType;
  String? createdAt;
  String? updatedAt;
  String? orderDate;

  Order(
      {this.sId,
      this.orderNumber,
      this.orderStatus,
      this.orderId,
      this.shipmentId,
      this.products,
      this.sellerId,
      this.awbCode,
      this.sellerName,
      this.customer,
      this.address,
      this.amount,
      this.totalAmt,
      this.paymentStatus,
      this.customerId,
      this.orderAmount,
      this.paymentType,
      this.createdAt,
      this.updatedAt,
      this.orderDate});

  Order.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderNumber = json['orderNumber'];
    orderStatus = json['orderStatus'];
    orderId = json['orderId'];
    shipmentId = json['shipment_id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    sellerId = json['sellerId'];
     awbCode = json['awb_code'];
    sellerName = json['sellerName'];
    customer = json['customer'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    amount = json['amount'];
    totalAmt = json['totalAmt'];
    paymentStatus = json['paymentStatus'];
    customerId = json['customerId'];
    orderAmount = json['orderAmount'];
    paymentType = json['payment_type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderDate = json['orderDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['orderNumber'] = this.orderNumber;
    data['orderStatus'] = this.orderStatus;
    data['awb_code'] = this.awbCode;
    data['orderId'] = this.orderId;
    data['shipment_id'] = this.shipmentId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['sellerId'] = this.sellerId;
    data['sellerName'] = this.sellerName;
    data['customer'] = this.customer;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['amount'] = this.amount;
    data['totalAmt'] = this.totalAmt;
    data['paymentStatus'] = this.paymentStatus;
    data['customerId'] = this.customerId;
    data['orderAmount'] = this.orderAmount;
    data['payment_type'] = this.paymentType;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['orderDate'] = this.orderDate;
    return data;
  }
}

class Products {
  String? productId;
  String? productName;
  // List<String>? productImage;
  String? productImage;
  List<VariantId>? variantId;
  String? variantTitle;
  int? quantity;
  int? price;
  int? mrp;
  int? total;
  String? description;
  String? skuId;
  List<String>? tags;
  String? category;
  String? subcategory;

  Products({
    this.productId,
    this.productName,
    this.productImage,
    this.variantId,
    this.variantTitle,
    this.quantity,
    this.price,
    this.mrp,
    this.total,
    this.description,
    this.skuId,
    this.tags,
    this.category,
    this.subcategory,
  });

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    // productImage = (json['productImage'] as List?)?.map((e) => e.toString()).toList();
    // if (json['variantId'] != null) {
    //   variantId = [];
    //   json['variantId'].forEach((v) {
    //     variantId!.add(VariantId.fromJson(v));
    //   });
    // }
    productImage = json['productImage'];
    variantTitle = json['variantTitle'];
    quantity = json['quantity'];
    price = json['price'];
    mrp = json['mrp'];
    total = json['total'];
    description = json['description'];
    skuId = json['skuId'];
    tags = json['tags']?.cast<String>();
    category = json['category'];
    subcategory = json['subcategory'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    // data['productImage'] = productImage;
    // if (variantId != null) {
    //   data['variantId'] = variantId!.map((v) => v.toJson()).toList();
    // }
    data['productImage'] = productImage;
    data['variantTitle'] = variantTitle;
    data['quantity'] = quantity;
    data['price'] = price;
    data['mrp'] = mrp;
    data['total'] = total;
    data['description'] = description;
    data['skuId'] = skuId;
    data['tags'] = tags;
    data['category'] = category;
    data['subcategory'] = subcategory;
    return data;
  }
}



class VariantId {
  String? sId;
  String? title;

  VariantId({this.sId, this.title});

  VariantId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    return data;
  }
}

class Address {
  String? name;
  String? zip;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? countryCode;
  String? mobile;
  String? email;

  Address(
      {this.name,
      this.zip,
      this.addressLine1,
      this.addressLine2,
      this.city,
      this.state,
      this.country,
      this.countryCode,
      this.mobile,
      this.email});

 Address.fromJson(Map<String, dynamic> json) {
  name = json['name'];
  zip = json['zip'];
  addressLine1 = json['addressLine1'] is List 
      ? (json['addressLine1'] as List).join(', ') 
      : json['addressLine1'];
  addressLine2 = json['addressLine2'] is List 
      ? (json['addressLine2'] as List).join(', ') 
      : json['addressLine2'];
  city = json['city'];
  state = json['state'];
  country = json['country'];
  countryCode = json['countryCode'];
  mobile = json['mobile'];
  email = json['email'];
}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['zip'] = this.zip;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}



