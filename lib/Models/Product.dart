import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:flutter/material.dart';
//TODO : Make Provider with Firebase

class Product {
  final String title;
  final String subTitle;
  final num price;
  final num rating;
  final String description;
  final String image;
  final List<String> models;
  final List<Color> colors;
  final Sizes sizes;
  bool isFavorite = false;
  num sale;
  Map<String , String> shoppingInfo;
  List<String> support;

  dynamic get saleValue{
    return this.price - (this.price * (this.sale / 100));
  }

  Product({
    @required this.title,
    @required this.subTitle,
    @required this.price,
    @required this.rating,
    @required this.description,
    @required this.image,
    @required this.models,
    @required this.colors,
    @required this.sizes,
    this.sale,
    this.shoppingInfo,
    this.support,
    this.isFavorite,
  });
}
