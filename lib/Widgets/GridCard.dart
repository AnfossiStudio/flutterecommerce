import 'dart:math';

import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/Screens/HomeScreens/OverviewProduct.dart';
import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:ecommerceapp/Widgets/FavoriteButton.dart';
import 'package:ecommerceapp/Widgets/Rating.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridCard extends StatefulWidget {
  final int index;

  GridCard({@required this.index});

  @override
  _GridCardState createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
  final product = Product(
    title: 'Evening Dress',
    colors: [Colors.red, Colors.grey],
    description:
        'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed',
    image: 'assets/images/model${Random().nextInt(7) + 1}.jpg',
    price: 100,
    models: [
      'assets/images/model2.jpg',
      'assets/images/model4.jpg',
      'assets/images/model1.jpg',
      'assets/images/model5.jpg',
    ],
    rating: 5,
    sizes: Sizes.LG,
    sale : 50,
    subTitle: 'Short black dress',
    shoppingInfo: {'Count': '200', 'weihgt': '800g'},
  );

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    double paddingLeft = (widget.index % 2 == 0) ? 16.0 : 0.0;
    double paddingRight = (widget.index % 2 != 0) ? 16.0 : 8.0;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => OverviewProduct(product: product,))),
      child: Padding(
        padding:
            EdgeInsets.only(left: paddingLeft, right: paddingRight, bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: <Widget>[
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      product.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(.1),
                      Colors.black.withOpacity(.8)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: product.sale != null ? Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeSchema.secondaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      (product.sale == 100) ? 'Free' : '-${product.sale}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ) : SizedBox.shrink(),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Rating(
                        size: 16,
                        text: true,
                        center: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        product.subTitle,
                        style: ThemeSchema.helper.copyWith(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        product.title,
                        style: ThemeSchema.subhead.copyWith(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: product.sale == null
                          ? Text(
                        '\$${product.price}',
                        style: ThemeSchema.text.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ): RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${product.price}',
                              style: TextStyle(
                                color: Colors.white,
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
              Positioned(
                top: 5,
                right: 5,
                child: FavoriteButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
