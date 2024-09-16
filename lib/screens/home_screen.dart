import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ostad_assignment_four/widgets/product_card.dart';

import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalAmount = 0;

  List<Product> products = [
    Product(
        id: 1,
        imageUrl:
            'https://cdn.pixabay.com/photo/2024/01/20/01/54/ai-generated-8520240_1280.jpg',
        productName: 'Pullover',
        productColor: 'Black',
        productSize: 'L',
        productPrice: 51),
    Product(
        id: 2,
        imageUrl:
            'https://cdn.pixabay.com/photo/2023/05/08/22/00/tshirt-7979854_1280.jpg',
        productName: 'T-shirt',
        productColor: 'Gray',
        productSize: 'L',
        productPrice: 30),
    Product(
        id: 3,
        imageUrl:
            'https://cdn.pixabay.com/photo/2024/01/20/01/50/ai-generated-8520207_1280.jpg',
        productName: 'Sport Dress',
        productColor: 'Black',
        productSize: 'M',
        productPrice: 43),
  ];

  void addToCart(int amount) {
    setState(() {
      totalAmount += amount;
    });
  }

  void removeFromCart(int amount) {
    setState(() {
      totalAmount -= amount;
    });
  }

  void showCheckOutMessage() {
    if (totalAmount == 0) return;

    const snackBar = SnackBar(
      content: Text('Congratulations'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        title: const Text(
          'My Bag',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Container(
        color: Colors.white38,
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    product: products[index],
                    addToCart: addToCart,
                    removeFRomCart: removeFromCart,
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Amount'),
                  Text('${totalAmount.toString()}\$'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: showCheckOutMessage,
                  child: const Text('CHECKOUT'),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
