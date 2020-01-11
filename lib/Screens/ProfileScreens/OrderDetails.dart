import 'package:ecommerceapp/Models/BagModel.dart';
import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/Widgets/OrderDetailsCard.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatelessWidget {
  final BagModel bagModel = BagModel(
    image: 'assets/images/model4.jpg',
    sizes: Sizes.LG,
    price: 20.0,
    title: 'Pullover',
    quantity: 1,
  );

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeSchema.primaryColor,
        centerTitle: true,
        title: Text(
          'Order Details',
          style: TextStyle(
            color: ThemeSchema.textColor,
              fontSize : 18
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ThemeSchema.textColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Order N1047034',
                      style: ThemeSchema.headline3
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '05-12-2019',
                      style: ThemeSchema.headline3.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Tracking number: ',
                      style: ThemeSchema.descriptiveLight
                          .copyWith(color: Colors.grey),
                    ),
                    Text('IW347553455', style: ThemeSchema.descriptiveLight),
                    Spacer(),
                    Text('Delivered',
                        style: ThemeSchema.descriptive
                            .copyWith(color: Colors.greenAccent)),
                  ],
                ),
              ),
              Text(
                '3 items',
                style: ThemeSchema.text,
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: OrderDetailCard()),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: OrderDetailCard()),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: OrderDetailCard()),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Order infotmation',
                  style: ThemeSchema.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Text(
                        'Shopping Address :',
                        style: ThemeSchema.text.copyWith(
                          color: Colors.grey,
                        ),
                      )),
                  Flexible(
                      flex: 2,
                      child: Wrap(
                        children: <Widget>[
                          Text(
                              '3 Newbribg Court , Chino Hills, CA 91709 , United States',
                              style: ThemeSchema.text)
                        ],
                      ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Text(
                        'Shopping Address :',
                        style: ThemeSchema.text.copyWith(
                          color: Colors.grey,
                        ),
                      )),
                  Flexible(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/mastercard1.png'))),
                          ),
                          Text('**** **** **** 3947', style: ThemeSchema.text)
                        ],
                      )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Text(
                        'Delivery method :',
                        style: ThemeSchema.text.copyWith(
                          color: Colors.grey,
                        ),
                      )),
                  Flexible(
                      flex: 2,
                      child: Wrap(
                        children: <Widget>[
                          Text('FedEx , 3 days , \$15', style: ThemeSchema.text)
                        ],
                      ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Text(
                        'Discount Amount : ',
                        style: ThemeSchema.text.copyWith(
                          color: Colors.grey,
                        ),
                      )),
                  Flexible(
                      flex: 2,
                      child: Wrap(
                        children: <Widget>[
                          Text('10%, Personal promo code',
                              style: ThemeSchema.text)
                        ],
                      ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Text(
                        'Total Amount :',
                        style: ThemeSchema.text.copyWith(
                          color: Colors.grey,
                        ),
                      )),
                  Flexible(
                      flex: 2,
                      child: Wrap(
                        children: <Widget>[
                          Text('\$133', style: ThemeSchema.text)
                        ],
                      ))
                ]),
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Button(
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: () {},
                      text: 'Recorder',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Button(
                      onPressed: () {},
                      text: 'Leave feedback',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
