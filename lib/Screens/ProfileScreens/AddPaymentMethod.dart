import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/Widgets/InputText.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPaymentMethod extends StatelessWidget {
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
                        'Add new card',
                        style: ThemeSchema.headline2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    InputText(
                      text: 'Name on card',
                    ),
                    InputText(
                      text: 'Card number',
                    ),
                    InputText(
                      text: 'Expire Date',
                    ),
                    InputText(
                      text: 'CVV',
                    ),
                    SizedBox(height: 20,),
                    Button(
                      text: 'ADD CARD',
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
