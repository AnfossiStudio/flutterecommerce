import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/Widgets/InputText.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Forgot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon : Icon(Icons.arrow_back_ios),
          color: ThemeSchema.textColor,
          onPressed : (){
            Navigator.of(context).pop();
          }
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Forgot password', style: ThemeSchema.headline1),
              SizedBox(
                height: 50,
              ),
              Text(
                'Please , enter your email address. You will receive a link to create a new password via email.',
                style: ThemeSchema.descriptive.copyWith(fontSize: 13 , height: 1.3),
              ),
              SizedBox(
                height: 10,
              ),
              InputText(text: 'E-mail'),
              SizedBox(
                height: 40,
              ),
              Button(
                text : 'SEND',
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
