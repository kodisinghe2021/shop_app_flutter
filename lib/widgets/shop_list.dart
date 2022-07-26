import 'package:flutter/material.dart';
import 'package:sales_app/providers/shops_provier.dart';

class ShopList extends StatelessWidget {
  ShopList({
    Key? key,
    required this.screenSize,
    required this.index,
  }) : super(key: key);
// Book Provider
  final ShopProvider _shopProvider = ShopProvider();
  final Size screenSize;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        SizedBox(
          height: screenSize.height * 0.3,
          width: screenSize.width * 0.95,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                _shopProvider.getBookList[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  //SizedBox(width: 10),
                  Text(
                    _shopProvider.getBookList[index].title,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  //SizedBox(width: 10),
                  Text(
                    _shopProvider.getBookList[index].title,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.person_add_disabled_sharp,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Tap To View Products",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.bike_scooter,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Between 2-3 days Island Wide Delivery",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
