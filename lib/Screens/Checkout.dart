import 'package:ecommerceapp/Screens/Succses.dart';
import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeSchema.primaryColor,
        centerTitle: true,
        title: Text('Checkout' , style : TextStyle(color : ThemeSchema.textColor)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ThemeSchema.textColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Shopping address',
                style: ThemeSchema.subhead,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
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
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Jane Deo',
                          style: ThemeSchema.subhead,
                        ),
                        Text(
                          'Change',
                          style: ThemeSchema.text.copyWith(
                            color: ThemeSchema.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '3 Newbridg Court',
                      style: ThemeSchema.descriptiveLight,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      'Chino Hills CA 91709, United State',
                      style: ThemeSchema.descriptiveLight,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Payment',
                    style: ThemeSchema.subhead,
                  ),
                  Text(
                    'Change',
                    style: ThemeSchema.text.copyWith(
                      color: ThemeSchema.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding : EdgeInsets.all(16),
              child : Row(
                children : <Widget>[
                  Container(
                    width: 50,
                    height: 30,
                    margin: EdgeInsets.only(right: 10),
                    child: Image(
                      image: AssetImage('assets/images/mastercard1.png'),
                    ),
                  ),
                  Text('**** **** *** 3974' , style: ThemeSchema.text,),
                ]
              )
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Delivery method',
                style: ThemeSchema.subhead,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ThemeSchema.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom : 8.0),
                            child: Text('FedEx' , style: ThemeSchema.subhead,)
                          ),
                          Text('2-3 days',style: ThemeSchema.helper,),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: ThemeSchema.primaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(bottom : 8.0),
                              child: Text('DHL' , style: ThemeSchema.subhead,)
                          ),
                          Text('2-3 days',style: ThemeSchema.helper,),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: ThemeSchema.primaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(bottom : 8.0),
                              child: Text('UPSP' , style: ThemeSchema.subhead,)
                          ),
                          Text('2-3 days',style: ThemeSchema.helper,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left : 16.0 , right : 16 , bottom : 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Order' , style : ThemeSchema.descriptive.copyWith(color: Colors.grey,),),
                  Text('\$112' , style : ThemeSchema.text,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left : 16.0 , right : 16 , bottom : 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Delivery' , style : ThemeSchema.descriptive.copyWith(color: Colors.grey,),),
                  Text('\$15' , style : ThemeSchema.text,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left : 16.0 , right : 16 , bottom : 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Summary' , style : ThemeSchema.text.copyWith(color: Colors.grey,),),
                  Text('\$127' , style : ThemeSchema.text,),
                ],
              ),
            ),
            Button(
              padding: EdgeInsets.only(left: 16 , right: 16 , bottom : 16),
             text :'SUBMIT ORDER',
             onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder : (_) => Success()));
             },
            )
          ],
        ),
      ),
    );
  }
}
