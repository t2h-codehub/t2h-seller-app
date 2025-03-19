import 'package:taptohello/data/productCategoryModel/filterCatalogueApiResModel.dart';

class FilteredData {
  List<String>? categories;
  List<String>? subcategories;
  String? minPrice;
  String? maxPrice;
  String? dateFrom;
  String? dateTo;
  bool? showOutOfStock;
  GetFilterCatalogueApiResModel? filteredData;

  FilteredData({
     this.categories,
     this.subcategories,
     this.minPrice,
     this.maxPrice,
     this.dateFrom,
     this.dateTo,
     this.showOutOfStock,
     this.filteredData,
  });
}