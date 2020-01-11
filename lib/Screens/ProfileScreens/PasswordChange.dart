import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/Widgets/InputText.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: ThemeSchema.backgroundColor,
            forceElevated: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            pinned: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 28,
                  color: ThemeSchema.textColor,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical : 16.0),
                      child: Text(
                        'Password Change',
                        style: ThemeSchema.headline2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InputText(
                      text: 'Old Password',
                      password: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top : 8.0, bottom : 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Forgot Password ?',
                            style: ThemeSchema.text.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InputText(
                      text: 'New Password',
                      password: true,
                    ),
                    InputText(
                      text: 'Repeat New Password',
                      password: true,
                    ),
                    SizedBox(height: 20,),
                    Button(
                      text: 'SAVE PASSWORD',
                      onPressed: () =>Navigator.of(context).pop(),
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
