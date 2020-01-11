import 'package:ecommerceapp/Widgets/OrdersCard.dart';
import 'package:ecommerceapp/Widgets/TabBarSliver.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
      backgroundColor: ThemeSchema.backgroundColor,
      body: DefaultTabController(
        length: 3,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              floating: false,
              automaticallyImplyLeading: false,
              titleSpacing: 20,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 28,
                    color: ThemeSchema.textColor,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
              backgroundColor: ThemeSchema.backgroundColor,
              expandedHeight: 130,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                title: Text(
                  'My Orders',
                  style: ThemeSchema.headline2,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            TabBarSliver(),
            SliverList(
              delegate: SliverChildListDelegate([
                OrdersCard(),
                OrdersCard(),
                OrdersCard(),
                OrdersCard(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
