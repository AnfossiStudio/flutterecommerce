import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InputText extends StatelessWidget {
  String text;
  int maxLines;
  bool password;
  String hintText;
  bool readonly;
  Function onTap;
  String initValue;
  TextEditingController controller;


  InputText({
    this.text,
    this.password = false,
    this.maxLines = 1,
    this.hintText,
    this.readonly = false,
    this.onTap,
    this.initValue,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);


    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: ThemeSchema.primaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 20,
            spreadRadius: 3,
          ),
        ],
      ),
      child: TextFormField(
        onTap: onTap,
        readOnly: readonly,
        maxLines: this.maxLines,
        enabled: true,
        style: TextStyle(color: ThemeSchema.textColor),
        autofocus: false,
        obscureText: password,
        controller: controller,
        onFieldSubmitted: (v) {
          SystemChrome.restoreSystemUIOverlays();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle:
              ThemeSchema.descriptive.copyWith(color: ThemeSchema.hintColor,),
          labelText: text,
          labelStyle: TextStyle(
            color: ThemeSchema.grey,
          ),
        ),
      ),
    );
  }
}
