class AddProductDataBody {
  String? productId;
  List<VariantDataArray>? variantDataArray;

  AddProductDataBody({this.productId, this.variantDataArray});

  AddProductDataBody.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    if (json['variantDataArray'] != null) {
      variantDataArray = <VariantDataArray>[];
      json['variantDataArray'].forEach((v) {
        variantDataArray!.add(new VariantDataArray.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    if (this.variantDataArray != null) {
      data['variantDataArray'] =
          this.variantDataArray!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VariantDataArray {
  List<Variants>? variants;
  bool? isDefault;
  int? stock;
  int? mrp;
  int? price;
  String? skuId;

  VariantDataArray(
      {this.variants,
        this.isDefault,
        this.stock,
        this.mrp,
        this.price,
        this.skuId});

  VariantDataArray.fromJson(Map<String, dynamic> json) {
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    isDefault = json['isDefault'];
    stock = json['stock'];
    mrp = json['mrp'];
    price = json['price'];
    skuId = json['sku_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['isDefault'] = this.isDefault;
    data['stock'] = this.stock;
    data['mrp'] = this.mrp;
    data['price'] = this.price;
    data['sku_id'] = this.skuId;
    return data;
  }
}

class Variants {
  String? variantId;
  String? valueId;

  Variants({this.variantId, this.valueId});

  Variants.fromJson(Map<String, dynamic> json) {
    variantId = json['variantId'];
    valueId = json['valueId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variantId'] = this.variantId;
    data['valueId'] = this.valueId;
    return data;
  }
}
