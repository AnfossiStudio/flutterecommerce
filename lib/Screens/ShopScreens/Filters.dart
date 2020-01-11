import 'package:ecommerceapp/Models/Filter.dart';
import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:ecommerceapp/Widgets/Filters/CategoryItem.dart';
import 'package:ecommerceapp/Widgets/Filters/ColorItem.dart';
import 'package:ecommerceapp/Widgets/Filters/RangeWidget.dart';
import 'package:ecommerceapp/Widgets/Filters/SizeItem.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filters extends StatefulWidget {
  Filter _filter = new Filter();

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeSchema.primaryColor,
        centerTitle: true,
        title: Text('Filters' , style : TextStyle(color : ThemeSchema.textColor),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ThemeSchema.iconsColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Accept',
              style: ThemeSchema.title.copyWith(
                color: ThemeSchema.secondaryColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Price range',
                style: ThemeSchema.subhead,
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 20,
                  spreadRadius: 3,
                ),
              ], color: ThemeSchema.primaryColor),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('\$10', style: ThemeSchema.descriptive),
                        Text('\$100', style: ThemeSchema.descriptive),
                      ],
                    ),
                  ),
                  RangeWidget(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Price range',
                style: ThemeSchema.subhead,
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 20,
                  spreadRadius: 3,
                ),
              ], color: ThemeSchema.primaryColor),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ColorItem(
                      onPressed: (c) => widget._filter.addColor(c),
                      color: Colors.blueAccent),
                  ColorItem(
                      onPressed: (c) => widget._filter.addColor(c),
                      color: Colors.greenAccent),
                  ColorItem(
                      onPressed: (c) => widget._filter.addColor(c),
                      color: Colors.blue),
                  ColorItem(
                      onPressed: (c) => widget._filter.addColor(c),
                      color: Colors.blueGrey),
                  ColorItem(
                      onPressed: (c) => widget._filter.addColor(c),
                      color: Colors.orangeAccent),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sizes',
                style: ThemeSchema.subhead,
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 20,
                  spreadRadius: 3,
                ),
              ], color: ThemeSchema.primaryColor),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizeItem(
                    onPressed: (s) => widget._filter.addSize(s),
                    size: Sizes.XS,
                  ),
                  SizeItem(
                    onPressed: (s) => widget._filter.addSize(s),
                    size: Sizes.SM,
                  ),
                  SizeItem(
                    onPressed: (s) => widget._filter.addSize(s),
                    size: Sizes.MD,
                  ),
                  SizeItem(
                    onPressed: (s) => widget._filter.addSize(s),
                    size: Sizes.LG,
                  ),
                  SizeItem(
                    onPressed: (s) => widget._filter.addSize(s),
                    size: Sizes.XL,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sizes',
                style: ThemeSchema.subhead,
              ),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 20,
                  spreadRadius: 3,
                ),
              ], color: ThemeSchema.primaryColor),
              padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: <Widget>[
                          CategoryItem(
                            category: 'All',
                            onPressed: (c) { widget._filter.addCategory(c);},
                          ),
                          CategoryItem(
                            category: 'Women',
                            onPressed: (c) => widget._filter.addCategory(c),
                          ),
                          CategoryItem(
                            category: 'Men',
                            onPressed: (c) => widget._filter.addCategory(c),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        CategoryItem(
                          category: 'Boys',
                          onPressed: (c) { widget._filter.addCategory(c);},
                        ),
                        CategoryItem(
                          category: 'Girls',
                          onPressed: (c) { widget._filter.addCategory(c);},
                        ),
                        Spacer()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom : 2.0),
                        child: Text(
                          'Brand',
                          style: ThemeSchema.subhead,
                        ),
                      ),
                      Text('adidas,Originals ,Jack & Jones' , style: ThemeSchema.helper,),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ThemeSchema.iconsColor,
                    size: 18,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,)
          ],
        ),
      ),
    );
  }
}
