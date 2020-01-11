import 'dart:math';
import 'package:flutter/material.dart';

//TODO : Complete your package for fake data with json file
class FakeData {
  final Map<String, dynamic> builder;
  final int itemCount;
  final String name;

  FakeData({
    @required this.itemCount,
    @required this.builder,
    @required this.name,
  });

  // ignore: non_constant_identifier_names
  static int Range(List<int> range) {
    return range.first + Random().nextInt(range.last - range.first);
  }

  //TODO : Make Unique id
  static uuid(int length) {}

  //TODO: Make text
  static paragraph(int lengthWords) {}

  //TODO : Make Word
  static text(int lengthCharts) {}

  static email() {}

  static phone() {}
}

var fake = FakeData(itemCount: 10, builder: {
  'User': {
    '_id': FakeData.uuid(6),
    'name': FakeData.paragraph(2),
    'email': FakeData.email(),
    'phone': FakeData.phone(),
    'permission': FakeData.Range([1, 3]),
    'type': ['XL', 'LG', 'SM'],
    'date_created': DateTime.now(),
    'date_updated': DateTime.now(),
  }
});
