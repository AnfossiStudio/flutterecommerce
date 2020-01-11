import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderTitle extends StatelessWidget {
  String title;
  String subtitle;
  String action;
  TextStyle titleStyle;
  TextStyle subtitleStyle;
  TextStyle actionStyle;
  num space;
  Widget actionOption;
  bool topLine;

  HeaderTitle({
    this.title,
    this.subtitle,
    this.action,
    this.titleStyle,
    this.actionStyle,
    this.subtitleStyle,
    this.space = 20.0,
    this.actionOption,
    this.topLine = false
  });

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: topLine == false ? CrossAxisAlignment.center :CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: title != null ? Text(
                      this.title,
                      style: titleStyle != null
                          ? titleStyle
                          : ThemeSchema.headline1,
                    ) : SizedBox.shrink(),
                  ),
                  subtitle != null ? Text(
                    this.subtitle,
                    style: subtitleStyle != null
                        ? subtitleStyle
                        : ThemeSchema.helper,
                  ) : SizedBox.shrink(),
                ],
              ),
              Spacer(),
              actionOption == null ?Text(
                this.action,
                style: actionStyle != null
                    ? actionStyle
                    : ThemeSchema.descriptiveLight,
               ) : actionOption
            ],
          ),
        ),
        SizedBox(
          height: space,
        ),
      ],
    );
    ;
  }
}
