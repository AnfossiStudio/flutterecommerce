import 'package:ecommerceapp/Widgets/Baner.dart';
import 'package:ecommerceapp/Widgets/GridCard.dart';
import 'package:ecommerceapp/Widgets/HeaderTitle.dart';
import 'package:ecommerceapp/Widgets/ListCard.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  Widget sliverHeader(ThemeSchema) {
    return SliverAppBar(
      expandedHeight: 400,
      backgroundColor: ThemeSchema.backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Image1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.infinity,
            color: Colors.black.withOpacity(.2),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Fashion\nSale',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: ThemeSchema.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    child: Text(
                      'Check',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ThemeSchema.backgroundColor,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        slivers: <Widget>[
          sliverHeader(ThemeSchema),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 32,
                ),
                HeaderTitle(title: 'New',subtitle: "You've never seen it before!" , action: 'View all',),
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
                ),
                Baner(),
                HeaderTitle(title : 'Popular' ,subtitle: "You've never seen it before!" , action: 'View all'),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return GridCard(index : index);
              },
              childCount: 12,
            ),
          ),
          SliverPadding(
            padding : EdgeInsets.only(top : 80)
          )
        ],
      ),
    );
  }
}
