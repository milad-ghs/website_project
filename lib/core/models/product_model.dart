class ProductModel {
  final int id;
  String category;
  List<ProductDataModel> listProductData;

  ProductModel({required this.id, required this.category, required this.listProductData});
}

class ProductDataModel {
  String imagePath;
  String title;

  ProductDataModel({required this.imagePath, required this.title});
}
