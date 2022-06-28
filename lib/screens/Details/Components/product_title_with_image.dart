import 'package:ecommerce_flutter_ui/constants.dart';
import 'package:ecommerce_flutter_ui/models/Products.dart';
import 'package:flutter/material.dart';

class ProductTitileWithImage extends StatelessWidget {
  const ProductTitileWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aristocratic hand bag',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: kDefaultPaddin,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Price\n",
                    ),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: kDefaultPaddin,
              ),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
