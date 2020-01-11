import 'package:ecommerceapp/Utilities/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RangeWidget extends StatefulWidget {
  RangeValues _values = RangeValues(0.3, 0.7);

  @override
  _RangeWidgetState createState() => _RangeWidgetState();
}

class _RangeWidgetState extends State<RangeWidget> {
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      activeColor: ThemeSchema.secondaryColor,
      labels: RangeLabels('2', '2'),
      values: widget._values,
      min: 0.1,
      max: 1,
      onChanged: (RangeValues values) {
        setState(() {
          widget._values = values;
        });
      },
    );
  }
}
