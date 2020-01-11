import 'package:ecommerceapp/Screens/ShopScreens/Filters.dart';
import 'package:ecommerceapp/Widgets/Favorite/FavoriteCardGrid.dart';
import 'package:ecommerceapp/Widgets/Favorite/FavoriteCardList.dart';
import 'package:ecommerceapp/Widgets/Filters/NavigateBottom.dart';
import 'package:ecommerceapp/Widgets/ShopNavigatorListCard.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTab extends StatefulWidget {
  bool isList = true;

  @override
  _FavoriteTabState createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {

  filterModalItem(ThemeSchema,String name,{bool check = false}){
    return InkWell(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Container(
        color: check ? ThemeSchema.secondaryColor : Colors.transparent,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 18),
        child : Text(name , style : check ? ThemeSchema.text.copyWith(color : Colors.white) :ThemeSchema.text,),
      ),
    );
  }

  Future filterModal(ThemeSchema){
    return showModalBottomSheet(
      backgroundColor: ThemeSchema.primaryColor,
      context: context,
      builder: (_){
        return Container(
            padding: EdgeInsets.symmetric(vertical : 32),
            child : Wrap(
                children : <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left : 16.0 , bottom: 16),
                    child: Text('Sort By' , style : ThemeSchema.headline2,),
                  ),
                  filterModalItem(ThemeSchema,'Popular'),
                  filterModalItem(ThemeSchema,'Newest'),
                  filterModalItem(ThemeSchema,'Custom review'),
                  filterModalItem(ThemeSchema,'Price : lowest to high' ,check : true),
                  filterModalItem(ThemeSchema,'Price : heighest to low'),
                ]
            )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Scaffold(
        backgroundColor: ThemeSchema.backgroundColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 10,
              pinned: false,
              floating: false,
              automaticallyImplyLeading: false,
              titleSpacing: 20,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: ThemeSchema.textColor,
                  ),
                  onPressed: () {},
                )
              ],
              backgroundColor: ThemeSchema.primaryColor,
              expandedHeight: 110,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                title: Text(
                  'Favorite',
                  style: ThemeSchema.headline2,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: BottomNavigate(
                  child: Container(
                    color: ThemeSchema.primaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 30,
                          margin: EdgeInsets.only(top: 16),
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SizedBox(
                                width: 16,
                              ),
                              ShopNavigatorListCard(
                                text: 'T-shits',
                              ),
                              ShopNavigatorListCard(
                                text: 'Crop tops',
                              ),
                              ShopNavigatorListCard(
                                text: 'Seelveless',
                              ),
                              ShopNavigatorListCard(
                                text: 'Jeans',
                              ),
                              ShopNavigatorListCard(
                                text: 'dreess',
                              ),
                              ShopNavigatorListCard(
                                text: 'T-shits',
                              ),
                              ShopNavigatorListCard(
                                text: 'T-shits',
                              ),
                              ShopNavigatorListCard(
                                text: 'T-shits',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder : (_) => Filters()
                                  ));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.filter_list,
                                      color: ThemeSchema.textColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Filters',
                                      style: ThemeSchema.descriptiveLight,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  filterModal(ThemeSchema,);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.swap_vert,
                                      color: ThemeSchema.textColor,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Price: Lowest to high',
                                      style: ThemeSchema.descriptiveLight,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.isList = !widget.isList;
                                  });
                                },
                                child: Icon(
                                  widget.isList == true
                                      ? Icons.view_module
                                      : Icons.view_list,
                                  color: ThemeSchema.textColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top : 16,bottom : 80),
              sliver: widget.isList
                  ? SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 16,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) => FavoriteCardList(),
                    itemCount: 10,
                  )
                ]),
              )
                  : SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                delegate: SliverChildBuilderDelegate(
                      (_, index) {
                    return FavoriteCardGrid(index: index);
                  },
                  childCount: 12,

                ),
              ),
            )
          ],
        ));
  }
}
