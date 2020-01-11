import 'package:ecommerceapp/Screens/TabsScreens/BagTab.dart';
import 'package:ecommerceapp/Screens/TabsScreens/FavoriteTab.dart';
import 'package:ecommerceapp/Screens/TabsScreens/HomeTab.dart';
import 'package:ecommerceapp/Screens/TabsScreens/ProfileTab.dart';
import 'package:ecommerceapp/Screens/TabsScreens/ShopTab.dart';
import 'package:ecommerceapp/Utilities/Manger.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      pageController.jumpToPage(index);
      _selectedIndex = index;
    });
  }

  Widget itemIcon(ThemeSchema ,{icon, index, text}) {
    return Flexible(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 24,
                color: _selectedIndex == index
                    ? ThemeSchema.secondaryColor
                    : ThemeSchema.iconsColor,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                text,
                style: TextStyle(
                  color: _selectedIndex == index
                      ? ThemeSchema.secondaryColor
                      : ThemeSchema.iconsColor,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final ThemeSchema = Provider.of<ThemeApp>(context);
    return Manager(
      child: Scaffold(

        body: Stack(
          children: <Widget>[
            PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                HomeTab(),
                ShopTab(),
                BagTab(),
                FavoriteTab(),
                ProfileTab(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: ThemeSchema.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.4),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      itemIcon(ThemeSchema,
                          icon: Icons.account_balance,
                          index: 0,
                          text: 'Home'),
                      itemIcon(ThemeSchema,
                          icon: Icons.local_grocery_store,
                          index: 1,
                          text: 'shop'),
                      itemIcon(ThemeSchema ,icon: Icons.local_mall, index: 2, text: 'Bag'),
                      itemIcon(ThemeSchema,
                          icon: Icons.favorite, index: 3, text: 'Favorite'),
                      itemIcon(ThemeSchema ,icon: Icons.person, index: 4, text: 'Profile',)
                    ],
                  )),
            )
          ],
        ),
//          bottomNavigationBar: BottomNavigationBar(
//            type: BottomNavigationBarType.fixed,
//            backgroundColor: ThemeSchema.primaryColor,
//            iconSize: 25,
//            selectedLabelStyle: TextStyle(fontSize: 10),
//            unselectedLabelStyle: TextStyle(fontSize: 10),
//            items: const <BottomNavigationBarItem>[
//              BottomNavigationBarItem(
//                icon: Icon(Icons.account_balance),
//                title: Text('Home'),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.local_grocery_store),
//                title: Text('Shop'),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.local_mall),
//                title: Text('Bag'),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.favorite_border),
//                activeIcon: Icon(Icons.favorite),
//                title: Text('Favorite'),
//              ),
//              BottomNavigationBarItem(
//                icon: Icon(Icons.person),
//                title: Text('Profile'),
//              ),
//            ],
//            unselectedItemColor: ThemeSchema.iconsColor,
//            currentIndex: _selectedIndex,
//            selectedItemColor: ThemeSchema.secondaryColor,
//            onTap: _onItemTapped,
//          ),
      ),
    );
  }
}
