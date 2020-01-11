import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/Widgets/InputText.dart';
import 'package:ecommerceapp/Widgets/RatingAction.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ReviewRate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeSchema.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 28,
            color: ThemeSchema.textColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
        body : SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 32.0),
                      child: Center(
                        child: Text(
                          'What is you rate ?',
                          style: ThemeSchema.headline2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 24.0),
                      child: RatingAction(
                        size: 30,
                        center: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 16.0),
                      child: Center(
                        child: Text(
                          'Please shate your opinion \n about the prdduct',
                          style: ThemeSchema.subhead,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InputText(
                      hintText: 'Your Review',
                      maxLines: 8,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                FontAwesomeIcons.camera,
                                size: 18,
                                color: Colors.white,
                              ),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: ThemeSchema
                                    .secondaryColor,
                                borderRadius:
                                BorderRadius.circular(
                                  50,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets
                                  .symmetric(vertical: 8.0),
                              child: Text(
                                'Add your photo',
                                style: ThemeSchema.helper
                                    .copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: ThemeSchema.textColor,
                                ),
                              ),
                            ),
                          ],
                        ),),
                    Button(text: 'SEND REVIEW',onPressed: (){

                    },)
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
