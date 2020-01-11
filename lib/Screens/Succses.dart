import 'package:ecommerceapp/Screens/Home.dart';
import 'package:ecommerceapp/Utilities/theme.dart';
import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image : AssetImage('assets/images/success.png'),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(top : 16.0 , bottom : 8),
              child: Text(
                'Success',
                style: ThemeSchema.headline1.copyWith(color: Colors.black),
              ),
            ),
            Text(
              'Your order will be delivered soon, \n Thank you for chosing our app!',
              style: ThemeSchema.descriptive.copyWith(height: 1.4 , color : Colors.black,),
            ),
            Spacer(),
            Button(
              text: 'CONTINUE SHOPPING',
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder : (_) => Home()) , (Route<dynamic> route) => false);
              },
              padding: EdgeInsets.all(16),
            )
          ],
        ),
      ),
    );
  }
}
