import 'dart:math';

import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/Screens/HomeScreens/OverviewProduct.dart';
import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:ecommerceapp/Widgets/FavoriteButton.dart';
import 'package:ecommerceapp/Widgets/Rating.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCard extends StatefulWidget {
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  final product = Product(
    title: 'Evening Dress',
    colors: [Colors.red, Colors.grey],
    description:
        'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
    image: 'assets/images/model${Random().nextInt(7) + 1}.jpg',
    price: 100,
    models: [
      'assets/images/model4.jpg',
      'assets/images/model3.jpg',
      'assets/images/model1.jpg',
      'assets/images/model5.jpg',
    ],
    rating: 5,
    sizes: Sizes.LG,
    subTitle: 'Short black dress',
    sale: 90,
    shoppingInfo: {'Count': '200', 'weihgt': '800g'},
  );

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => OverviewProduct(product: product,))),
      child: Container(
        padding: EdgeInsets.only(left: 16),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: 130,
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        product.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: product.sale == null
                            ? Colors.black
                            : ThemeSchema.secondaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        // ignore: unrelated_type_equality_checks
                        product.sale == null ? 'New' : product.sale >= 100 ? 'Free' : '-${product.sale}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: FavoriteButton(),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Rating(
                size: 16,
                text: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                product.subTitle,
                style: ThemeSchema.helper,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                product.title,
                style: ThemeSchema.subhead,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: product.sale == null
                  ? Text(
                      '${product.price}\$',
                      style: ThemeSchema.text.copyWith(
                        color: ThemeSchema.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${product.price}',
                            style: TextStyle(
                              color: ThemeSchema.textColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          TextSpan(
                            text: ' \$${product.saleValue}',
                            style: TextStyle(
                              color: ThemeSchema.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
