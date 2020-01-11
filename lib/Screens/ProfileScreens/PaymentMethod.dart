import 'package:ecommerceapp/Widgets/PaymentCard.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddPaymentMethod.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => AddPaymentMethod()));
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: ThemeSchema.primaryColor,
        centerTitle: true,
        title: Text('Payment methods',
            style: TextStyle(
              color: ThemeSchema.textColor,
              fontSize: 18,
            )),
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
              padding: const EdgeInsets.only(bottom: 8.0, top: 32, left: 16),
              child: Text(
                'Your payment cards',
                style: ThemeSchema.subhead,
              ),
            ),
            PaymentCard(image: 'assets/images/Card.png'),
            PaymentCard(image: 'assets/images/Card3.png'),
            SizedBox(
              height: 16,
            ),

          ],
        ),
      ),
    );
  }
}
