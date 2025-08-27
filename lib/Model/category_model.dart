class CategoryModel {
  final String name;
  final String imagePath;
  final String type;
  final String? description;
  final String? price;

  CategoryModel({required this.name, required this.imagePath, required this.type, this.description, this.price});
}
