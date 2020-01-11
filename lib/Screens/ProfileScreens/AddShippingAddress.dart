import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/Widgets/InputText.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddShippingAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeSchema.primaryColor,
        centerTitle: true,
        title: Text('Shipping Addresses' , style : TextStyle(
          color : ThemeSchema.textColor,
          fontSize : 18
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom : 8.0),
                child: InputText(
                  text: 'Fullname',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom : 8.0),
                child: InputText(
                  text: 'Address',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom : 8.0),
                child: InputText(
                  text: 'City',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom : 8.0),
                child: InputText(
                  text: 'Zip Code',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom : 8.0),
                child: InputText(
                  text: 'United States',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom : 8.0),
                child: Button(
                  text: 'SAVE ADDRESS',
                  onPressed: (){

                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
