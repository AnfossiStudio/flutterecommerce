import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentCard extends StatefulWidget {
  bool _check = false;
  String image;

  PaymentCard({
    @required this.image,
  });

  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.cover)),
          ),
          Row(
            children: <Widget>[
              Checkbox(
                  value: widget._check,
                  onChanged: (v) {
                    setState(() {
                      widget._check = !widget._check;
                    });
                  },
                  activeColor: Colors.black,
                  checkColor: Colors.white),
              Text(
                'Use as default payment method',
                style: ThemeSchema.descriptiveLight,
              ),
            ],
          )
        ],
      ),
    );
  }
}
