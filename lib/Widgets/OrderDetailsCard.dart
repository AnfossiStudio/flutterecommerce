import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: ThemeSchema.primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/model2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Pullover',
                    style: ThemeSchema.text,
                  ),
                  Text(
                    'Mango',
                    style: ThemeSchema.descriptiveLight.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Color :',
                            style: ThemeSchema.descriptiveLight.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: 'Gray',
                            style: ThemeSchema.descriptiveLight.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Size :',
                            style: ThemeSchema.descriptiveLight.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          TextSpan(
                            text: 'L',
                            style: ThemeSchema.descriptiveLight.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Units :',
                        style: ThemeSchema.descriptiveLight.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: '1',
                        style: ThemeSchema.descriptiveLight.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text(
                    '\$51',
                    style: ThemeSchema.text,
                  ),
                  padding: EdgeInsets.only(right: 16, bottom: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
