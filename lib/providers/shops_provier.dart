import 'package:sales_app/screens/models/shop_model.dart';

class ShopProvider {
  final List<Shop> _shops = [
    Shop(
        imageUrl: "https://picsum.photos/id/27/900/600",
        title: "Location: badulla, polwaththa."),
    Shop(
        imageUrl: "https://picsum.photos/id/17/900/600",
        title: "Location: palawaththe pannipitiya."),
    Shop(
        imageUrl: "https://picsum.photos/id/128/900/600",
        title: "Location: diyathalwa, kaluthara."),
    Shop(
        imageUrl: "https://picsum.photos/id/85/900/600",
        title: "Location: badulla, pannipitiya."),
    Shop(
        imageUrl: "https://picsum.photos/id/189/900/600",
        title: "Location: badulla, pannipitiya."),
  ];

  List<Shop> get getBookList => [..._shops];
}
