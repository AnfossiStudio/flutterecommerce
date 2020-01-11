import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:flutter/material.dart';


class Filter{
  List<int> priceRange = new List<int>();
  List<Color> colors = new List<Color>();
  List<Sizes> sizes = new List<Sizes>();
  List<String> category = List<String>();
  List<String> brand = List<String>();

  Filter();

  addColor(color) {
    if(!this.colors.contains(color))
      this.colors.add(color);
  }

  addSize(size){
    if(!this.sizes.contains(size))
      this.sizes.add(size);
  }
  addCategory(category){
    if(!this.category.contains(category))
      this.category.add(category);
  }
}