import 'package:food_delivery_ui_kit/Model/category_model.dart';
import 'package:food_delivery_ui_kit/Model/items_model.dart';
import 'package:food_delivery_ui_kit/Model/order_model.dart';

// home categories
final List<CategoryModel> categories = [
  CategoryModel(
    name: 'Snacks',
    imagePath: 'assets/svg/Snacks.svg',
    type: 'Snacks',
  ),
  CategoryModel(
    name: 'Meals',
    imagePath: 'assets/svg/Meals.svg',
    type: 'Meals',
  ),
  CategoryModel(
    name: 'Vegan',
    imagePath: 'assets/svg/Vegan.svg',
    type: 'Vegan',
  ),
  CategoryModel(
    name: 'Desserts',
    imagePath: 'assets/svg/Desserts.svg',
    type: 'Desserts',
  ),
  CategoryModel(
    name: 'Drinks',
    imagePath: 'assets/svg/Drinks.svg',
    type: 'Drinks',
  ),
];

// specific category
final List<CategoryModel> getCategory = [
  CategoryModel(
    name: 'Mexican appetizer',
    imagePath: 'assets/images/maxican_appetizer.png',
    type: 'Snacks',
    description: 'Tortilla Chips With Toppins',
    price: '10',
  ),
  CategoryModel(
    name: 'Pork Skewer',
    imagePath: 'assets/images/pork.png',
    type: 'Snacks',
    description: 'Tortilla Chips With Toppins',
    price: '34',
  ),
  CategoryModel(
    name: 'Fresh Prawn Ceviche',
    imagePath: 'assets/images/prawn.png',
    type: 'Meals',
    description: 'Tortilla Chips With Toppins',
    price: '12.99',
  ),
  CategoryModel(
    name: 'Chicken Burger',
    imagePath: 'assets/images/chi_burger.png',
    type: 'Meals',
    description: 'Tortilla Chips With Toppins',
    price: '20',
  ),
  CategoryModel(
    name: 'Mushroom Risotto',
    imagePath: 'assets/images/mashroom.png',
    type: 'Vegan',
    description: 'Tortilla Chips With Toppins',
    price: '15',
  ),
  CategoryModel(
    name: 'Broccoli Lasagna',
    imagePath: 'assets/images/broccoli_lasa.png',
    type: 'Vegan',
    description: 'Tortilla Chips',
    price: '15',
  ),
  CategoryModel(
    name: 'Chocolate Brownie',
    imagePath: 'assets/images/brownie.png',
    type: 'Desserts',
    description: 'Tortilla Chips With Toppins',
    price: '12.99',
  ),
  CategoryModel(
    name: 'Macarons',
    imagePath: 'assets/images/macrons.png',
    type: 'Desserts',
    description: 'Tortilla Chips With Toppins',
    price: '20',
  ),
  CategoryModel(
    name: 'Mojito',
    imagePath: 'assets/images/mojito.png',
    type: 'Drinks',
    description: 'Tortilla Chips With Toppins',
    price: '15',
  ),
  CategoryModel(
    name: 'Iced Coffee',
    imagePath: 'assets/images/ice_coffee.png',
    type: 'Drinks',
    description: 'Tortilla Chips',
    price: '15',
  ),
];

// best seller
final List<ItemsModel> items = [
  ItemsModel(price: '20.0', imagepath: 'assets/images/image01.png'),
  ItemsModel(price: '50.0', imagepath: 'assets/images/image02.png'),
  ItemsModel(price: '10.0', imagepath: 'assets/images/image03.png'),
  ItemsModel(price: '60.0', imagepath: 'assets/images/image04.png'),
];

// filter items
final List<String> multiCategories = [
  'Bruschetta',
  'Spring Rolls',
  'Crepes',
  'Salmon',
  'Skewers',
  'Wings',
  'Mexican',
  'Baked',
  'Appetizer',
];

// order on order_screen.dart
  final orders = [
    OrderModel(
      image: 'assets/images/burger01.png',
      title: 'Burger',
      time: '14 Nov, 04:20 pm',
      price: 05.0,
      items: 4,
      orderStatus: 'Active',
    ),
    OrderModel(
      image: 'assets/images/image02.png',
      title: 'Chicken Curry',
      time: '15 Nov, 11:20 pm',
      price: 40.0,
      items: 2,
      orderStatus: 'Completed',
    ),
    OrderModel(
      image: 'assets/images/coca_cola.png',
      title: 'Coke',
      time: '16 Nov, 01:20 pm',
      price: 12.0,
      items: 2,
      orderStatus: 'Active',
    ),
    OrderModel(
      image: 'assets/images/image04.png',
      title: 'Strawberry Shake',
      time: '17 Nov, 01:20 am',
      price: 15.0,
      items: 2,
      orderStatus: 'Cancelled',
    ),
    OrderModel(
      image: 'assets/images/grilled.png',
      title: 'Grilled',
      time: '18 Nov, 01:10 pm',
      price: 20.0,
      items: 2,
      orderStatus: 'Cancelled',
    ),
    OrderModel(
      image: 'assets/images/noodle.png',
      title: 'Noddle',
      time: '19 Nov, 01:20 pm',
      price: 20.0,
      items: 2,
      orderStatus: 'Active',
    ),
  ];

/// recommand custom_grid_card in widget ////////
  final List<ItemsModel> itemsDetail = [
    ItemsModel(
      price: '30.0',
      imagepath: 'assets/images/burger.png',
      rating: '5.0',
      favourite: false,
    ),
    ItemsModel(
      price: '20.0',
      imagepath: 'assets/images/burger01.png',
      rating: '4.8',
      favourite: true,
    ),
    ItemsModel(
      price: '15.0',
      imagepath: 'assets/images/cheese.png',
      rating: '4.5',
      favourite: false,
    ),
    ItemsModel(
      price: '25.0',
      imagepath: 'assets/images/chicken.png',
      rating: '4.7',
      favourite: true,
    ),
    ItemsModel(
      price: '18.0',
      imagepath: 'assets/images/chips.png',
      rating: '4.2',
      favourite: false,
    ),
    ItemsModel(
      price: '22.0',
      imagepath: 'assets/images/coca_cola.png',
      rating: '4.4',
      favourite: true,
    ),
    ItemsModel(
      price: '12.0',
      imagepath: 'assets/images/grilled.png',
      rating: '3.9',
      favourite: false,
    ),
    ItemsModel(
      price: '28.0',
      imagepath: 'assets/images/ice_cream.png',
      rating: '4.6',
      favourite: true,
    ),
    ItemsModel(
      price: '27.0',
      imagepath: 'assets/images/lemon.png',
      rating: '4.8',
      favourite: false,
    ),
    ItemsModel(
      price: '14.0',
      imagepath: 'assets/images/noodle.png',
      rating: '3.8',
      favourite: true,
    ),
    ItemsModel(
      price: '23.0',
      imagepath: 'assets/images/noodles.png',
      rating: '4.5',
      favourite: false,
    ),
    ItemsModel(
      price: '17.0',
      imagepath: 'assets/images/pizza.png',
      rating: '4.1',
      favourite: true,
    ),
    ItemsModel(
      price: '40.0',
      imagepath: 'assets/images/rum.png',
      rating: '5.0',
      favourite: false,
    ),
    ItemsModel(
      price: '23.0',
      imagepath: 'assets/images/noodles.png',
      rating: '4.5',
      favourite: false,
    ),
    ItemsModel(
      price: '17.0',
      imagepath: 'assets/images/pizza.png',
      rating: '4.1',
      favourite: true,
    ),
    ItemsModel(
      price: '40.0',
      imagepath: 'assets/images/rum.png',
      rating: '5.0',
      favourite: false,
    ),
    ItemsModel(
      price: '21.0',
      imagepath: 'assets/images/burger01.png',
      rating: '4.2',
      favourite: true,
    ),
    ItemsModel(
      price: '34.0',
      imagepath: 'assets/images/pizza.png',
      rating: '4.9',
      favourite: false,
    ),
  ]; 