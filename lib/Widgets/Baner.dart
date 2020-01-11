import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Baner extends StatelessWidget {
  Widget Baner_image(ThemeSchema, int index , String title) {
    return Flexible(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: ThemeSchema.primaryColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 5,
                    spreadRadius: 3,
                  ),
                ]),
            child: Image(
              image: AssetImage('assets/images/category$index.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top : 8.0),
            child: Text(
              title,
              style: ThemeSchema.descriptiveLight.copyWith(fontSize : 12.0,),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Baner_image(ThemeSchema, 7 , 'Coat'),
          Baner_image(ThemeSchema, 1 , 'body suit'),
          Baner_image(ThemeSchema, 2 , 'Top'),
          Baner_image(ThemeSchema, 4 , 'Dress'),
          Baner_image(ThemeSchema, 5 , 'Socks'),
        ],
      ),
    );
  }
}
