class ItemsModel {
  final String price;
  final String imagepath;
  final String? rating;
  bool favourite;

  ItemsModel({required this.price, required this.imagepath, this.rating, this.favourite = false});
}
