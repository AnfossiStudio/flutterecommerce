import 'package:ecommerceapp/Models/Product.dart';
import 'package:ecommerceapp/Screens/HomeScreens/Review.dart';
import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/Widgets/DropDownButton.dart';
import 'package:ecommerceapp/Widgets/FavoriteButton.dart';
import 'package:ecommerceapp/Widgets/HeaderTitle.dart';
import 'package:ecommerceapp/Widgets/ListCard.dart';
import 'package:ecommerceapp/Widgets/Rating.dart';
import 'package:ecommerceapp/Widgets/ToggleList.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewProduct extends StatelessWidget {
  final Product product;

  OverviewProduct({@required this.product});

  ModelSize(BuildContext context , ThemeSchema) {
    return showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            color: ThemeSchema.primaryColor,
          ),
          height: 280,
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Selected Size', style: ThemeSchema.headline2),
              ),
              Row(
                children: <Widget>[
                  SizeWidget(ThemeSchema,'XS'),
                  SizeWidget(ThemeSchema,'S'),
                  SizeWidget(ThemeSchema,'M'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizeWidget(ThemeSchema,'L'),
                  SizeWidget(ThemeSchema,'XL'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                text: 'ADD TO CART',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  List<TableRow> shoppinglist(ThemeSchema) {
    List<TableRow> childs = new List();
    // ignore: missing_return
    product.shoppingInfo.forEach((k, v) {
      var tableRow = new TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              k,
              style: ThemeSchema.descriptiveLight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              v,
              style: ThemeSchema.descriptiveLight,
            ),
          ),
        ],
      );
      childs.add(tableRow);
    });
    return childs;
  }

  Widget SizeWidget(ThemeSchema , [size = 'XS']) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          size,
          style: TextStyle(
              fontWeight: FontWeight.w400, color: ThemeSchema.textColor),
          textAlign: TextAlign.center,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ThemeSchema.backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 20,
              spreadRadius: 3,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeSchema.primaryColor,
        centerTitle: true,
        leading: IconButton(
          color: ThemeSchema.textColor,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          product.title,
          style: ThemeSchema.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: ThemeSchema.textColor,
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 320,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          product.models[i],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: product.models.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: DropDownButton(
                      text: 'Size',
                      onPressed: () {
                        ModelSize(context , ThemeSchema);
                      },
                    ),
                    flex: 3,
                  ),
                  Flexible(
                    child: DropDownButton(
                      text: 'Black',
                      onPressed: () {
                        print('hello');
                      },
                    ),
                    flex: 3,
                  ),
                  Flexible(
                    child: FavoriteButton(
                      padding: EdgeInsets.all(14),
                    ),
                  )
                ],
              ),
            ),
            HeaderTitle(
              title: product.title,
              titleStyle: ThemeSchema.headline2,
              subtitle: product.subTitle,
              actionStyle: ThemeSchema.headline2,
              topLine: false,
              space: 5.0,
              actionOption: product.sale == null
                  ? Text(
                      '\$${product.price}',
                      style: ThemeSchema.text.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${product.price}',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          TextSpan(
                            text: ' \$${product.saleValue}',
                            style: TextStyle(
                              color: ThemeSchema.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Rating(
                size: 18,
                text: true,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                product.description,
                style: ThemeSchema.descriptiveLight.copyWith(height: 1.6),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                color: ThemeSchema.primaryColor,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Button(
                        text: 'ADD TO CART',
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlineButton(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: ThemeSchema.textColor,
                          borderSide: BorderSide(
                            color: ThemeSchema.textColor,
                            width: 1,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => Review()
                              )
                            );
                          },
                          child: Text(
                            'RATING & REVIEWS',
                            textAlign: TextAlign.center,
                            style: ThemeSchema.text.copyWith(
                              color: ThemeSchema.textColor,
                            ),
                          ),
                        ),
                      ),
                     ),
                    SizedBox(height: 20),
                    Divider(
                      height: 1,
                      color: ThemeSchema.border,
                    ),
                    ToggleList(
                      text: 'Shopping Info',
                      child: Table(
                        border: TableBorder.all(
                            color: ThemeSchema.border, width: 1),
                        children: [...shoppinglist(ThemeSchema)],
                      ),
                    ),
                    ToggleList(
                      top: false,
                      text: 'Support',
                      child: Text(
                        'This is Description',
                        style: ThemeSchema.descriptiveLight
                            .copyWith(fontWeight: FontWeight.w100),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderTitle(
                      title: 'You can also like this',
                      titleStyle: ThemeSchema.headline3,
                      action: '12 items',
                      actionStyle: ThemeSchema.helper,
                    ),
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return ListCard();
                        },
                        itemCount: 5,
                        padding: EdgeInsets.only(right: 16),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
