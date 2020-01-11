import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:flutter/material.dart';

class BagModel {
  final String title;
  final num price;
  final String image;
  final Sizes sizes;
  num quantity;

  BagModel({@required this.title,@required this.price,@required this.image,@required this.sizes,this.quantity = 1});

  dynamic get fullPrice {
    return price * quantity;
  }
}