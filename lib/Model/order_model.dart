class OrderModel {
  final String image;
  final String title;
  final String time;
  final double price;
  final int items;
  final String orderStatus;

  OrderModel({
    required this.image,
    required this.title,
    required this.time,
    required this.price,
    required this.items,
    required this.orderStatus,
  });
}
