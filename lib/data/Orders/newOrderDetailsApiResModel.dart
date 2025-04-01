// class NewOrderDetailsApiResModel {
//   String? message;
//   Order? order;

//   NewOrderDetailsApiResModel({this.message, this.order});

//   NewOrderDetailsApiResModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     order = json['order'] != null ? Order.fromJson(json['order']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     if (order != null) {
//       data['order'] = order;
//     }
//     return data;
//   }
// }

// class Order {
//   String? id;
//   String? orderNumber;
//   String? orderStatus;
//   String? orderId;
//   String? shippingId;
//   List<Product>? products;
//   String? customer;
//   Address? address;
//   int? amount;
//   int? totalAmount;
//   bool? paymentStatus;
//   bool? deliveredStatus;
//   int? status;
//   String? customerId;
//   String? orderAmount;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? orderDate;

//   Order({
//     this.id,
//     this.orderNumber,
//     this.orderStatus,
//     this.orderId,
//     this.shippingId,
//     this.products,
//     this.customer,
//     this.address,
//     this.amount,
//     this.totalAmount,
//     this.paymentStatus,
//     this.deliveredStatus,
//     this.status,
//     this.customerId,
//     this.orderAmount,
//     this.createdAt,
//     this.updatedAt,
//     this.orderDate,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) {
//     return Order(
//       id: json['_id'],
//       orderNumber: json['orderNumber'],
//       orderStatus: json['orderStatus'],
//       orderId: json['orderId'],
//       shippingId: json['shipping_id'],
//       products: (json['products'] as List<dynamic>?)
//           ?.map((item) => Product.fromJson(item))
//           .toList(),
//       customer: json['customer'],
//       address: json['address'] != null ? Address.fromJson(json['address']) : null,
//       amount: json['amount'] ?? 0,
//       totalAmount: json['totalAmt'] ?? 0,
//       paymentStatus: json['paymentStatus'] ?? false,
//       deliveredStatus: json['deliveredStatus'] ?? false,
//       status: json['status'] ?? 0,
//       customerId: json['customerId'],
//       orderAmount: json['orderAmount'],
//       createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
//       updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
//       orderDate: json['orderDate'],
//     );
//   }
// }

// class Product {
//   String? productId;
//   String? productName;
//   List<String>? productImages;
//   List<Variant>? variants;
//   int? quantity;
//   double? price;
//   double? mrp;

//   Product({
//     this.productId,
//     this.productName,
//     this.productImages,
//     this.variants,
//     this.quantity,
//     this.price,
//     this.mrp,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       productId: json['productId'],
//       productName: json['productName'],
//       productImages: (json['productImage'] as List<dynamic>?)
//           ?.map((item) => item as String)
//           .toList(),
//       variants: (json['variantId'] as List<dynamic>?)
//           ?.map((item) => item != null ? Variant.fromJson(item) : null)
//           .whereType<Variant>() // Remove null items
//           .toList(),
//       quantity: json['quantity'] ?? 0,
//       price: json['price']?.toDouble() ?? 0.0,
//       mrp: json['mrp']?.toDouble() ?? 0.0,
//     );
//   }
// }

// class Variant {
//   String? id;
//   String? title;

//   Variant({this.id, this.title});

//   factory Variant.fromJson(Map<String, dynamic> json) {
//     return Variant(
//       id: json['_id'],
//       title: json['title'],
//     );
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

//   Address({
//     this.name,
//     this.zip,
//     this.address,
//     this.mobile,
//     this.email,
//     this.state,
//     this.city,
//   });

//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       name: json['name'],
//       zip: json['zip'],
//       address: json['address'],
//       mobile: json['mobile'],
//       email: json['email'],
//       state: json['state'],
//       city: json['city'],
//     );
//   }
// }


// import 'dart:convert';

// class NewOrderDetailsApiResModel {
//   String? message;
//   Order? order;

//   NewOrderDetailsApiResModel({this.message, this.order});

//   factory NewOrderDetailsApiResModel.fromJson(Map<String, dynamic> json) {
//     return NewOrderDetailsApiResModel(
//       message: json['message'],
//       order: json['order'] != null ? Order.fromJson(json['order']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'order': order?.toJson(),
//     };
//   }
// }

// class Order {
//   String? id;
//   String? orderNumber;
//   String? orderStatus;
//   String? orderId;
//   int? shipmentId;
//   List<Product>? products;
//   String? customer;
//   Address? address;
//   int? amount;
//   int? totalAmt;
//   bool? paymentStatus;
//   bool? deliveredStatus;
//   int? status;
//   String? awbCode;
//   String? deliveryStatus;
//   String? customerId;
//   String? orderAmount;
//   String? createdAt;
//   String? updatedAt;
//   String? orderDate;

//   Order({
//     this.id,
//     this.orderNumber,
//     this.orderStatus,
//     this.orderId,
//     this.shipmentId,
//     this.products,
//     this.customer,
//     this.address,
//     this.amount,
//     this.totalAmt,
//     this.paymentStatus,
//     this.deliveredStatus,
//     this.status,
//     this.awbCode,
//     this.deliveryStatus,
//     this.customerId,
//     this.orderAmount,
//     this.createdAt,
//     this.updatedAt,
//     this.orderDate,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) {
//     return Order(
//       id: json['_id'],
//       orderNumber: json['orderNumber'],
//       orderStatus: json['orderStatus'],
//       orderId: json['orderId'],
//       shipmentId: json['shipment_id'],
//       products: (json['products'] as List?)?.map((p) => Product.fromJson(p)).toList(),
//       customer: json['customer'],
//       address: json['address'] != null ? Address.fromJson(json['address']) : null,
//       amount: json['amount'],
//       totalAmt: json['totalAmt'],
//       paymentStatus: json['paymentStatus'],
//       deliveredStatus: json['deliveredStatus'],
//       status: json['status'],
//       awbCode: json['awb_code'],
//       deliveryStatus: json['deliveryStatus'],
//       customerId: json['customerId'],
//       orderAmount: json['orderAmount'],
//       createdAt: json['createdAt'],
//       updatedAt: json['updatedAt'],
//       orderDate: json['orderDate'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       '_id': id,
//       'orderNumber': orderNumber,
//       'orderStatus': orderStatus,
//       'orderId': orderId,
//       'shipment_id': shipmentId,
//       'products': products?.map((p) => p.toJson()).toList(),
//       'customer': customer,
//       'address': address?.toJson(),
//       'amount': amount,
//       'totalAmt': totalAmt,
//       'paymentStatus': paymentStatus,
//       'deliveredStatus': deliveredStatus,
//       'status': status,
//       'awb_code': awbCode,
//       'deliveryStatus': deliveryStatus,
//       'customerId': customerId,
//       'orderAmount': orderAmount,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       'orderDate': orderDate,
//     };
//   }
// }

// class Product {
//   String? productId;
//   String? productName;
//   List<String>? productImage;
//   List<Variant>? variantId;
//   int? quantity;
//   int? price;
//   int? mrp;

//   Product({
//     this.productId,
//     this.productName,
//     this.productImage,
//     this.variantId,
//     this.quantity,
//     this.price,
//     this.mrp,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       productId: json['productId'],
//       productName: json['productName'],
//       productImage: (json['productImage'] as List?)?.map((e) => e as String).toList(),
//       variantId: (json['variantId'] as List?)?.map((v) => Variant.fromJson(v)).toList(),
//       quantity: json['quantity'],
//       price: json['price'],
//       mrp: json['mrp'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'productId': productId,
//       'productName': productName,
//       'productImage': productImage,
//       'variantId': variantId?.map((v) => v.toJson()).toList(),
//       'quantity': quantity,
//       'price': price,
//       'mrp': mrp,
//     };
//   }
// }

// class Variant {
//   String? id;
//   String? title;

//   Variant({this.id, this.title});

//   factory Variant.fromJson(Map<String, dynamic> json) {
//     return Variant(
//       id: json['id'],
//       title: json['title'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//     };
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

//   Address({this.name, this.zip, this.address, this.mobile, this.email, this.state, this.city});

//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       name: json['name'],
//       zip: json['zip'],
//       address: json['address'],
//       mobile: json['mobile'],
//       email: json['email'],
//       state: json['state'],
//       city: json['city'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'zip': zip,
//       'address': address,
//       'mobile': mobile,
//       'email': email,
//       'state': state,
//       'city': city,
//     };
//   }
// }


// import 'dart:convert';

// class NewOrderDetailsApiResModel {
//   String? message;
//   Order? order;

//   NewOrderDetailsApiResModel({this.message, this.order});

//   factory NewOrderDetailsApiResModel.fromJson(Map<String, dynamic> json) {
//     return NewOrderDetailsApiResModel(
//       message: json['message'] ?? '',
//       order: json['order'] != null ? Order.fromJson(json['order']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'message': message,
//       'order': order?.toJson(),
//     };
//   }
// }

// class Order {
//   String? id;
//   String? orderNumber;
//   String? orderStatus;
//   String? orderId;
//   int? shipmentId;
//   List<Product>? products;
//   String? customer;
//   Address? address;
//   int? amount;
//   int? totalAmt;
//   bool? paymentStatus;
//   bool? deliveredStatus;
//   int? status;
//   String? awbCode;
//   String? deliveryStatus;
//   String? customerId;
//   String? orderAmount;
//   String? createdAt;
//   String? updatedAt;
//   String? orderDate;

//   Order({
//     this.id,
//     this.orderNumber,
//     this.orderStatus,
//     this.orderId,
//     this.shipmentId,
//     this.products,
//     this.customer,
//     this.address,
//     this.amount,
//     this.totalAmt,
//     this.paymentStatus,
//     this.deliveredStatus,
//     this.status,
//     this.awbCode,
//     this.deliveryStatus,
//     this.customerId,
//     this.orderAmount,
//     this.createdAt,
//     this.updatedAt,
//     this.orderDate,
//   });

//   // factory Order.fromJson(Map<String, dynamic> json) {
//   //   return Order(
//   //     id: json['_id'] ?? '',
//   //     orderNumber: json['orderNumber'] ?? '',
//   //     orderStatus: json['orderStatus'] ?? '',
//   //     orderId: json['orderId'] ?? '',
//   //     shipmentId: json['shipment_id'] ?? 0,
//   //     products: (json['products'] as List<dynamic>?)?.map((p) => Product.fromJson(p)).toList() ?? [],
//   //     customer: json['customer'] ?? '',
//   //     address: json['address'] != null ? Address.fromJson(json['address']) : null,
//   //     amount: json['amount'] ?? 0,
//   //     totalAmt: json['totalAmt'] ?? 0,
//   //     paymentStatus: json['paymentStatus'] ?? false,
//   //     deliveredStatus: json['deliveredStatus'] ?? false,
//   //     status: json['status'] ?? 0,
//   //     awbCode: json['awb_code'] ?? '',
//   //     deliveryStatus: json['deliveryStatus'] ?? '',
//   //     customerId: json['customerId'] ?? '',
//   //     orderAmount: json['orderAmount'] ?? '',
//   //     createdAt: json['createdAt'] ?? '',
//   //     updatedAt: json['updatedAt'] ?? '',
//   //     orderDate: json['orderDate'] ?? '',
//   //   );
//   // }

// //   factory Order.fromJson(Map<String, dynamic> json) {
// //   return Order(
// //     id: json['_id'] ?? '',
// //     orderNumber: json['orderNumber'] ?? '',
// //     orderStatus: json['orderStatus'] ?? '',
// //     // Make sure these fields match the JSON structure exactly
// //     shipmentId: json['shipment_id'] ?? 0,
// //     products: (json['products'] as List<dynamic>?)?.map((p) => Product.fromJson(p)).toList() ?? [],
// //     customer: json['customer'] ?? '',
// //     address: json['address'] != null ? Address.fromJson(json['address']) : null,
// //     amount: json['amount'] ?? 0,
// //     totalAmt: json['totalAmt'] ?? 0,
// //     paymentStatus: json['paymentStatus'] ?? false,
// //     deliveredStatus: json['deliveredStatus'] ?? false,
// //     status: json['status'] ?? 0,
// //     awbCode: json['awb_code'] ?? '',
// //     deliveryStatus: json['deliveryStatus'] ?? '',
// //     customerId: json['customerId'] ?? '',
// //     orderAmount: json['orderAmount'] ?? '',
// //     createdAt: json['createdAt'] ?? '',
// //     updatedAt: json['updatedAt'] ?? '',
// //     orderDate: json['orderDate'] ?? '',
// //   );
// // }

// // factory Order.fromJson(Map<String, dynamic> json) {
// //   return Order(
// //     id: json['_id'] ?? '',
// //     orderNumber: json['orderNumber'] ?? '',
// //     orderStatus: json['orderStatus'] ?? '',
// //     orderId: json['orderId'] ?? '', // Adjusted this to use `orderId` not `order_id`
// //     shipmentId: json['shipment_id'] ?? 0,  // Make sure to match `shipment_id`
// //     products: (json['products'] as List<dynamic>?)?.map((p) => Product.fromJson(p)).toList() ?? [],
// //     customer: json['customer'] ?? '',
// //     address: json['address'] != null ? Address.fromJson(json['address']) : null,
// //     amount: json['amount'] ?? 0,
// //     totalAmt: json['totalAmt'] ?? 0,
// //     paymentStatus: json['paymentStatus'] ?? false,
// //     deliveredStatus: json['deliveredStatus'] ?? false,
// //     status: json['status'] ?? 0,
// //     awbCode: json['awb_code'] ?? '',  // Use the correct key `awb_code` (snake_case)
// //     deliveryStatus: json['deliveryStatus'] ?? '',
// //     customerId: json['customerId'] ?? '',
// //     orderAmount: json['orderAmount'] ?? '',
// //     createdAt: json['createdAt'] ?? '',
// //     updatedAt: json['updatedAt'] ?? '',
// //     orderDate: json['orderDate'] ?? '',
// //   );
// // }

// factory Order.fromJson(Map<String, dynamic> json) {
//   return Order(
//     id: json['_id'] ?? '',
//     orderNumber: json['orderNumber'] ?? '',
//     orderStatus: json['orderStatus'] ?? '',
//     orderId: json['orderId'] ?? '',
//     shipmentId: int.tryParse(json['shipment_id'].toString()) ?? 0,  // Parse to int safely
//     products: (json['products'] as List<dynamic>?)
//         ?.map((p) => Product.fromJson(p))
//         .toList() ??
//         [],
//     customer: json['customer'] ?? '',
//     address: json['address'] != null ? Address.fromJson(json['address']) : null,
//     amount: double.tryParse(json['amount'].toString()) ?? 0.0,  // Safely parse amount to double
//     totalAmt: double.tryParse(json['totalAmt'].toString()) ?? 0.0,  // Safely parse totalAmt
//     paymentStatus: json['paymentStatus'] ?? false,
//     deliveredStatus: json['deliveredStatus'] ?? false,
//     status: int.tryParse(json['status'].toString()) ?? 0,  // Safely parse status to int
//     awbCode: json['awb_code'] ?? '',
//     deliveryStatus: json['deliveryStatus'] ?? '',
//     customerId: json['customerId'] ?? '',
//     orderAmount: json['orderAmount'] ?? '',
//     createdAt: json['createdAt'] ?? '',
//     updatedAt: json['updatedAt'] ?? '',
//     orderDate: json['orderDate'] ?? '',
//   );
// }


// Map<String, dynamic> toJson() {
//   return {
//     '_id': id,
//     'orderNumber': orderNumber,
//     'orderStatus': orderStatus,
//     'orderId': orderId,
//     'shipment_id': shipmentId,
    
//     // Products
//     'products': products?.map((p) => p.toJson()).toList(),
    
//     // Customer details
//     'customer': customer,
//     'address': address?.toJson(),
//     'customerId': customerId,

//     // Payment and status
//     'amount': amount,
//     'totalAmt': totalAmt,
//     'paymentStatus': paymentStatus,
//     'deliveredStatus': deliveredStatus,
//     'status': status,
//     'awb_code': awbCode,
//     'deliveryStatus': deliveryStatus,

//     // Dates and timestamps
//     'orderAmount': orderAmount,
//     'createdAt': createdAt,
//     'updatedAt': updatedAt,
//     'orderDate': orderDate,
//   };
// }


//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     '_id': id,
//   //     'orderNumber': orderNumber,
//   //     'orderStatus': orderStatus,
//   //     'orderId': orderId,
//   //     'shipment_id': shipmentId,
//   //     'products': products?.map((p) => p.toJson()).toList(),
//   //     'customer': customer,
//   //     'address': address?.toJson(),
//   //     'amount': amount,
//   //     'totalAmt': totalAmt,
//   //     'paymentStatus': paymentStatus,
//   //     'deliveredStatus': deliveredStatus,
//   //     'status': status,
//   //     'awb_code': awbCode,
//   //     'deliveryStatus': deliveryStatus,
//   //     'customerId': customerId,
//   //     'orderAmount': orderAmount,
//   //     'createdAt': createdAt,
//   //     'updatedAt': updatedAt,
//   //     'orderDate': orderDate,
//   //   };
//   // }
// }

// class Product {
//   String? productId;
//   String? productName;
//   List<String>? productImage;
//   List<Variant>? variantId;
//   int? quantity;
//   int? price;
//   int? mrp;

//   Product({
//     this.productId,
//     this.productName,
//     this.productImage,
//     this.variantId,
//     this.quantity,
//     this.price,
//     this.mrp,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       productId: json['productId'] ?? '',
//       productName: json['productName'] ?? '',
//       productImage: (json['productImage'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
//       variantId: (json['variantId'] as List<dynamic>?)?.map((v) => Variant.fromJson(v)).toList() ?? [],
//       quantity: json['quantity'] ?? 0,
//       price: json['price'] ?? 0,
//       mrp: json['mrp'] ?? 0,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'productId': productId,
//       'productName': productName,
//       'productImage': productImage,
//       'variantId': variantId?.map((v) => v.toJson()).toList(),
//       'quantity': quantity,
//       'price': price,
//       'mrp': mrp,
//     };
//   }
// }

// class Variant {
//   String? id;
//   String? title;

//   Variant({this.id, this.title});

//   factory Variant.fromJson(Map<String, dynamic> json) {
//     return Variant(
//       id: json['id'] ?? '',
//       title: json['title'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//     };
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

//   Address({this.name, this.zip, this.address, this.mobile, this.email, this.state, this.city});

//   factory Address.fromJson(Map<String, dynamic> json) {
//     return Address(
//       name: json['name'] ?? '',
//       zip: json['zip'] ?? '',
//       address: json['address'] ?? '',
//       mobile: json['mobile'] ?? '',
//       email: json['email'] ?? '',
//       state: json['state'] ?? '',
//       city: json['city'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'zip': zip,
//       'address': address,
//       'mobile': mobile,
//       'email': email,
//       'state': state,
//       'city': city,
//     };
//   }
// }


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
//   String? awbCode;
//   String? orderNumber;
//   String? orderStatus;
//   String? orderId;
//   String? shipmentId;
//   List<Products>? products;
//   String? customer;
//   Address? address;
//   int? amount;
//   int? totalAmt;
//   bool? paymentStatus;
//   bool? deliveredStatus;
//   int? status;
//   String? deliveryStatus;
//   String? customerId;
//   String? orderAmount;
//   String? createdAt;
//   String? updatedAt;
//   String? orderDate;

//   Order(
//       {this.sId,
//       this.awbCode,
//       this.orderNumber,
//       this.orderStatus,
//       this.orderId,
//       this.shipmentId,
//       this.products,
//       this.customer,
//       this.address,
//       this.amount,
//       this.totalAmt,
//       this.paymentStatus,
//       this.deliveredStatus,
//       this.status,
//       this.deliveryStatus,
//       this.customerId,
//       this.orderAmount,
//       this.createdAt,
//       this.updatedAt,
//       this.orderDate});

//   Order.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     awbCode = json['awb_code'];
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
//     paymentStatus = json['paymentStatus'];
//     deliveredStatus = json['deliveredStatus'];
//     status = json['status'];
//     deliveryStatus = json['deliveryStatus'];
//     customerId = json['customerId'];
//     orderAmount = json['orderAmount'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     orderDate = json['orderDate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['awb_code'] = this.awbCode;
    
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
//     data['paymentStatus'] = this.paymentStatus;
//     data['deliveredStatus'] = this.deliveredStatus;
//     data['status'] = this.status;
//     data['deliveryStatus'] = this.deliveryStatus;
//     data['customerId'] = this.customerId;
//     data['orderAmount'] = this.orderAmount;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['orderDate'] = this.orderDate;
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
//   String? paymentStatus;
//   bool? deliveredStatus;
//   int? status;
//   String? awbCode;
//   String? customerId;
//   String? orderAmount;
//   String? createdAt;
//   String? updatedAt;
//   String? orderDate;

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
//       this.paymentStatus,
//       this.deliveredStatus,
//       this.status,
//       this.awbCode,
//       this.customerId,
//       this.orderAmount,
//       this.createdAt,
//       this.updatedAt,
//       this.orderDate});

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
//     paymentStatus = json['paymentStatus'];
//     deliveredStatus = json['deliveredStatus'];
//     status = json['status'];
//     awbCode = json['awb_code'];
//     customerId = json['customerId'];
//     orderAmount = json['orderAmount'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     orderDate = json['orderDate'];
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
//     data['paymentStatus'] = this.paymentStatus;
//     data['deliveredStatus'] = this.deliveredStatus;
//     data['status'] = this.status;
//      data['awb_code'] = this.awbCode;
//     // 'awb_code': awbCode,
//     data['customerId'] = this.customerId;
//     data['orderAmount'] = this.orderAmount;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['orderDate'] = this.orderDate;
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
  String? customer;
  Address? address;
  int? amount;
  int? totalAmt;
  bool? deliveredStatus;
  int? status;
  String? awbCode;
  String? customerId;
  String? orderAmount;
  String? createdAt;
  String? updaFlutterTedAt;
  String? orderDate;
  String? deliveryService;

  Order(
      {this.sId,
      this.orderNumber,
      this.orderStatus,
      this.orderId,
      this.shipmentId,
      this.products,
      this.customer,
      this.address,
      this.amount,
      this.totalAmt,
      this.deliveredStatus,
      this.status,
      this.awbCode,
      this.customerId,
      this.orderAmount,
      this.createdAt,
      this.updaFlutterTedAt,
      this.orderDate,
      this.deliveryService});

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
    customer = json['customer'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    amount = json['amount'];
    totalAmt = json['totalAmt'];
    deliveredStatus = json['deliveredStatus'];
    status = json['status'];
    awbCode = json['awb_code'];
    customerId = json['customerId'];
    orderAmount = json['orderAmount'];
    createdAt = json['createdAt'];
    updaFlutterTedAt = json['upda flutter: tedAt'];
    orderDate = json['orderDate'];
    deliveryService = json['deliveryService'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['orderNumber'] = this.orderNumber;
    data['orderStatus'] = this.orderStatus;
    data['orderId'] = this.orderId;
    data['shipment_id'] = this.shipmentId;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['customer'] = this.customer;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['amount'] = this.amount;
    data['totalAmt'] = this.totalAmt;
    data['deliveredStatus'] = this.deliveredStatus;
    data['status'] = this.status;
    data['awb_code'] = this.awbCode;
    data['customerId'] = this.customerId;
    data['orderAmount'] = this.orderAmount;
    data['createdAt'] = this.createdAt;
    data['upda flutter: tedAt'] = this.updaFlutterTedAt;
    data['orderDate'] = this.orderDate;
    data['deliveryService'] = this.deliveryService;
    return data;
  }
}

class Products {
  String? productId;
  String? productName;
  List<String>? productImage;
  List<VariantId>? variantId;
  int? quantity;
  int? price;
  int? mrp;

  Products(
      {this.productId,
      this.productName,
      this.productImage,
      this.variantId,
      this.quantity,
      this.price,
      this.mrp});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productImage = json['productImage'].cast<String>();
    if (json['variantId'] != null) {
      variantId = <VariantId>[];
      json['variantId'].forEach((v) {
        variantId!.add(new VariantId.fromJson(v));
      });
    }
    quantity = json['quantity'];
    price = json['price'];
    mrp = json['mrp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    if (this.variantId != null) {
      data['variantId'] = this.variantId!.map((v) => v.toJson()).toList();
    }
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['mrp'] = this.mrp;
    return data;
  }
}

class VariantId {
  String? id;
  String? title;

  VariantId({this.id, this.title});

  VariantId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class Address {
  String? name;
  String? zip;
  String? address;
  String? mobile;
  String? email;
  String? state;
  String? city;

  Address(
      {this.name,
      this.zip,
      this.address,
      this.mobile,
      this.email,
      this.state,
      this.city});

  Address.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    zip = json['zip'];
    address = json['address'];
    mobile = json['mobile'];
    email = json['email'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['zip'] = this.zip;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['state'] = this.state;
    data['city'] = this.city;
    return data;
  }
}


