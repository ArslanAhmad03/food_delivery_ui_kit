class CartModel {
  final String imagePath;
  final String title;
  final String price;
  final String? description;
  final String? time;

  CartModel({
    required this.imagePath,
    required this.title,
    required this.price,
    this.description,
    this.time,
  });
}
