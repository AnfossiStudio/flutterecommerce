import 'package:ecommerceapp/Models/BagModel.dart';
import 'package:ecommerceapp/Screens/Checkout.dart';
import 'package:ecommerceapp/Utilities/SizesEnum.dart';
import 'package:ecommerceapp/Widgets/BagCard.dart';
import 'package:ecommerceapp/Widgets/Button.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagTab extends StatefulWidget {
  final BagModel bagModel = BagModel(
    image: 'assets/images/model4.jpg',
    sizes: Sizes.LG,
    price: 20.0,
    title: 'Pullover',
    quantity: 1,
  );

  @override
  _BagTabState createState() => _BagTabState();
}

class _BagTabState extends State<BagTab> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            floating: false,
            leading: SizedBox.shrink(),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: ThemeSchema.textColor,
                ),
                onPressed: () {},
              )
            ],
            backgroundColor: ThemeSchema.backgroundColor,
            expandedHeight: 130,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsets.only(left: 16, bottom: 16),
              title: Text(
                'My Bag',
                style: ThemeSchema.headline2,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical : 8.0 , horizontal: 16),
                  child: BagCard(
                    bagModel: widget.bagModel,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical : 8.0 , horizontal: 16),
                  child: BagCard(
                    bagModel: widget.bagModel,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical : 8.0 , horizontal: 16),
                  child: BagCard(
                    bagModel: widget.bagModel,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical : 8.0 , horizontal: 16),
                  child: BagCard(
                    bagModel: widget.bagModel,
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin : EdgeInsets.only(top : 20),
                  padding: EdgeInsets.all(16),
                  color: ThemeSchema.primaryColor,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment : MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Total amount' , style: ThemeSchema.descriptive,),
                          Text('\$120', style: ThemeSchema.title,)
                        ],
                      ),
                      Button(
                        padding: EdgeInsets.only(top: 16 , bottom : 96),
                        text: 'CHECK OUT',
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder : (_) => Checkout()
                          ));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
* The dress is great! Very classy and comfortable > it fit perfectly! I'm and 150 pounds> I am a 34B ches. This dress would e who are shorter but could be hemmed> I wouldn't recommend it for those big chested and it fit me perfectly chested and it fit me perfectly > The underarms were not too wide and the dress was made well.
* */