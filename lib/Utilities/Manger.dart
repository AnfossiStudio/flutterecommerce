import 'dart:io';

import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Manager extends StatelessWidget {
  final Widget child;

  Manager({@required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return WillPopScope(
        onWillPop: (){
      return showDialog(
          context: context,
          builder : (BuildContext context) => Padding(
            padding: EdgeInsets.only(left: 0, right: 0.0),
            child: AlertDialog(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              backgroundColor: ThemeSchema.primaryColor,
              title: Text('Exit' , style: TextStyle(color : ThemeSchema.textColor),),
              content: Text('Are you sure ?' , style: TextStyle(color : ThemeSchema.textColor),),
              actions: <Widget>[
                RaisedButton(
                  color: ThemeSchema.secondaryColor,
                  child: Text('Exit' , style: TextStyle(color : Colors.white),),
                  onPressed: (){
                    exit(0);
                  },
                ),
                FlatButton(
                  child: Text('Cancel' , style: TextStyle(color : ThemeSchema.textColor),),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          )
      );
    },
      child: child,
    );
  }
}
