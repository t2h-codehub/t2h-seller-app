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
      data['order'] = this.order;
    }
    return data;
  }
}

class Order {
  String? id;
  String? orderNumber;
  String? orderStatus;
  String? orderId;
  String? shippingId;
  List<Product>? products;
  String? customer;
  Address? address;
  int? amount;
  int? totalAmount;
  bool? paymentStatus;
  bool? deliveredStatus;
  int? status;
  String? customerId;
  String? orderAmount;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? orderDate;

  Order({
    this.id,
    this.orderNumber,
    this.orderStatus,
    this.orderId,
    this.shippingId,
    this.products,
    this.customer,
    this.address,
    this.amount,
    this.totalAmount,
    this.paymentStatus,
    this.deliveredStatus,
    this.status,
    this.customerId,
    this.orderAmount,
    this.createdAt,
    this.updatedAt,
    this.orderDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      orderNumber: json['orderNumber'],
      orderStatus: json['orderStatus'],
      orderId: json['orderId'],
      shippingId: json['shipping_id'],
      products: (json['products'] as List<dynamic>?)
          ?.map((item) => Product.fromJson(item))
          .toList(),
      customer: json['customer'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      amount: json['amount'] ?? 0,
      totalAmount: json['totalAmt'] ?? 0,
      paymentStatus: json['paymentStatus'] ?? false,
      deliveredStatus: json['deliveredStatus'] ?? false,
      status: json['status'] ?? 0,
      customerId: json['customerId'],
      orderAmount: json['orderAmount'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      orderDate: json['orderDate'],
    );
  }
}

class Product {
  String? productId;
  String? productName;
  List<String>? productImages;
  List<Variant>? variants;
  int? quantity;
  double? price;
  double? mrp;

  Product({
    this.productId,
    this.productName,
    this.productImages,
    this.variants,
    this.quantity,
    this.price,
    this.mrp,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      productName: json['productName'],
      productImages: (json['productImage'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      variants: (json['variantId'] as List<dynamic>?)
          ?.map((item) => item != null ? Variant.fromJson(item) : null)
          .whereType<Variant>() // Remove null items
          .toList(),
      quantity: json['quantity'] ?? 0,
      price: json['price']?.toDouble() ?? 0.0,
      mrp: json['mrp']?.toDouble() ?? 0.0,
    );
  }
}

class Variant {
  String? id;
  String? title;

  Variant({this.id, this.title});

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      id: json['_id'],
      title: json['title'],
    );
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

  Address({
    this.name,
    this.zip,
    this.address,
    this.mobile,
    this.email,
    this.state,
    this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'],
      zip: json['zip'],
      address: json['address'],
      mobile: json['mobile'],
      email: json['email'],
      state: json['state'],
      city: json['city'],
    );
  }
}
