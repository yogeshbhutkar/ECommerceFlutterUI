import 'package:ecommerce_flutter_ui/constants.dart';
import 'package:ecommerce_flutter_ui/screens/Details/Components/color_and_size.dart';
import 'package:ecommerce_flutter_ui/screens/Details/Components/description.dart';
import 'package:ecommerce_flutter_ui/screens/Details/Components/product_title_with_image.dart';
import 'package:flutter/material.dart';

import '../../../models/Products.dart';

int selectedItems = 1;

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
                      CartCounter(products: product),
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
  final Product products;
  const CartCounter({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        buildButton(
          icon: Icons.remove,
          press: () {
            setState(() {
              if (selectedItems > 1) {
                selectedItems--;
              }
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            selectedItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildButton(
          icon: Icons.add,
          press: () {
            setState(() {
              selectedItems++;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin * 1.2),
          child: SizedBox(
            width: size.width * 0.5,
            child: MaterialButton(
              elevation: 0,
              color: Colors.black,
              onPressed: () {},
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: const Text(
                "Buy Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  SizedBox buildButton({required IconData icon, required VoidCallback press}) {
    return SizedBox(
      height: 40,
      width: 32,
      child: OutlinedButton(
        child: Icon(icon),
        onPressed: press,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }
}
