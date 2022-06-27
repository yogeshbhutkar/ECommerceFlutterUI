import 'package:ecommerce_flutter_ui/constants.dart';
import 'package:ecommerce_flutter_ui/screens/Details/Components/color_and_size.dart';
import 'package:ecommerce_flutter_ui/screens/Details/Components/description.dart';
import 'package:ecommerce_flutter_ui/screens/Details/Components/product_title_with_image.dart';
import 'package:flutter/material.dart';

import '../../../models/Products.dart';

int selectedItems = 0;

class DetailsBody extends StatelessWidget {
  final Product product;
  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  height: size.height * 0.65,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Color'),
                                Row(
                                  children: const [
                                    ColorDot(
                                        color: Color(0xFF356C95),
                                        isSelected: true),
                                    ColorDot(
                                      color: Color(0xFFF8C078),
                                      isSelected: false,
                                    ),
                                    ColorDot(
                                      color: Color(0xFFA29B9B),
                                      isSelected: false,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  style: const TextStyle(color: kTextColor),
                                  children: [
                                    const TextSpan(text: "Size\n"),
                                    TextSpan(
                                        text: "${product.size} cm",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold))
                                  ]),
                            ),
                          )
                        ],
                      ),
                      Description(product: product),
                      CartCounter(product: product),
                    ],
                  ),
                ),
                ProductTitileWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  final Product product;
  const CartCounter({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              if (selectedItems > 0) {
                selectedItems--;
              } else {
                selectedItems = 0;
              }
            });
          },
          color: const Color.fromARGB(225, 245, 241, 241),
          child: Icon(Icons.remove),
          shape: const CircleBorder(),
        ),
        Text('$selectedItems'),
        MaterialButton(
          onPressed: () {
            setState(() {
              selectedItems++;
            });
          },
          child: Icon(Icons.add),
          shape: const CircleBorder(),
          color: const Color.fromARGB(225, 245, 241, 241),
        ),
        MaterialButton(
          onPressed: () {},
          color: const Color.fromARGB(225, 245, 241, 241),
          child: const Text('Buy Now'),
        )
      ],
    );
  }
}
