import 'package:ecommerceapp/Screens/ProfileScreens/OrderDetails.dart';
import 'package:ecommerceapp/Utilities/theme.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color : ThemeSchema.primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 20,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom : 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Order N1047034' , style: ThemeSchema.text.copyWith(fontWeight: FontWeight.w500),),
                Text('05-12-2019', style: ThemeSchema.text.copyWith(color : Colors.grey , fontWeight: FontWeight.w400),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom : 16.0),
            child: Row(
              children: <Widget>[
                Text('Tracking number: ' , style: ThemeSchema.descriptiveLight.copyWith(color: Colors.grey),),
                Text('IW347553455' , style: ThemeSchema.descriptiveLight),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom : 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Quantity: ' , style: ThemeSchema.descriptiveLight.copyWith(color: Colors.grey),),
                    Text('3' , style: ThemeSchema.descriptiveLight),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Total Amount: ' , style: ThemeSchema.descriptiveLight.copyWith(color: Colors.grey),),
                    Text('\$112' , style: ThemeSchema.descriptiveLight),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrderDetails()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal : 16 , vertical : 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('Details' , style : ThemeSchema.descriptiveLight.copyWith(color : Colors.white)),
                ),
              ),
              Text('Delivered' , style : ThemeSchema.descriptive.copyWith(color: Colors.greenAccent)),
            ],
          )
        ],
      ),
    );
  }
}
