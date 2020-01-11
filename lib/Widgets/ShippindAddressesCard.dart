import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingAddressesCard extends StatefulWidget {
  bool _check = false;

  @override
  _ShippingAddressesCardState createState() => _ShippingAddressesCardState();
}

class _ShippingAddressesCardState extends State<ShippingAddressesCard> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Container(
      margin: EdgeInsets.only(top : 16 , left: 16 , right: 16),
      padding: EdgeInsets.all(16),
      decoration : BoxDecoration(
        color: ThemeSchema.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 20,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom : 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Jane Deo' , style : ThemeSchema.subhead,),
                Text('Edit' , style : ThemeSchema.text.copyWith(color : ThemeSchema.secondaryColor,fontWeight: FontWeight.bold,),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom : 8.0),
            child: Text('3 Newbridg Court' , style: ThemeSchema.descriptiveLight,),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom : 5.0),
            child: Text('Chino Hills CA 91709, United State' , style: ThemeSchema.descriptiveLight,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(
                value: widget._check,
                onChanged: (v) {
                  setState(() {
                    widget._check = !widget._check;
                  });
                },
                activeColor: Colors.black,
                checkColor: Colors.white
              ),
              SizedBox(width: 10,),
              Text('Use as the shipping address',style: ThemeSchema.descriptiveLight,),
            ],
          )
        ],
      ),
    );
  }
}
