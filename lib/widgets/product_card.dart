import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.product,
      required this.addToCart,
      required this.removeFRomCart});

  final Product product;
  final Function addToCart;
  final Function removeFRomCart;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int numberOfProducts = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              widget.product.imageUrl,
              height: 70,
              width: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.product.productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Color: ${widget.product.productColor}'),
                    const SizedBox(width: 8),
                    Text('Size: ${widget.product.productSize}')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (numberOfProducts == 0) return;
                          setState(() {
                            numberOfProducts--;
                          });
                          widget.removeFRomCart(widget.product.productPrice);
                        },
                        icon: const Icon(Icons.remove)),
                    Text(numberOfProducts.toString()),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            numberOfProducts++;
                          });
                          widget.addToCart(widget.product.productPrice);
                        },
                        icon: const Icon(Icons.add)),
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                Text('${widget.product.productPrice.toString()}\$'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
