import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleList extends StatefulWidget {
  final String text;
  final Widget child;
  final bool top;
  bool toggle = false;

  ToggleList({@required this.text, @required this.child , this.top = false});

  @override
  _ToggleListState createState() => _ToggleListState();
}

class _ToggleListState extends State<ToggleList> {
  @override
  Widget build(BuildContext context) {

    final ThemeSchema = Provider.of<ThemeApp>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.toggle = !widget.toggle;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ThemeSchema.border, width: 1),
          ),
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.text,
                      style: ThemeSchema.descriptiveLight,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ThemeSchema.textColor,
                      size: 12,
                    ),
                  ],
                ),
              widget.toggle == true ? Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top : 16),
                  child: widget.child,
                ),
              ): SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
