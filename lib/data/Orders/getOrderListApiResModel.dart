class GetOrderListApiResModel {
  String? message;
  List<Orders>? orders;

  GetOrderListApiResModel({this.message, this.orders});

  GetOrderListApiResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? sId;
  String? orderNumber;
  String? orderStatus;
  String? orderDate;
  String? orderAmount;
  String? customerName;

  Orders(
      {this.sId,
        this.orderNumber,
        this.orderStatus,
        this.orderDate,
        this.orderAmount,
        this.customerName});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderNumber = json['orderNumber'];
    orderStatus = json['orderStatus'];
    orderDate = json['orderDate'];
    orderAmount = json['orderAmount'];
    customerName = json['customerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['orderNumber'] = this.orderNumber;
    data['orderStatus'] = this.orderStatus;
    data['orderDate'] = this.orderDate;
    data['orderAmount'] = this.orderAmount;
    data['customerName'] = this.customerName;
    return data;
  }
}
