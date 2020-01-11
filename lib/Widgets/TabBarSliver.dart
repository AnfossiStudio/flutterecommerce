import 'package:ecommerceapp/Utilities/theme.dart';
import 'package:ecommerceapp/providers/ThemeApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBarSliver extends StatefulWidget {
  int _index = 0;

  @override
  _TabBarSliverState createState() => _TabBarSliverState();
}

class _TabBarSliverState extends State<TabBarSliver> {
  @override
  Widget build(BuildContext context) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(TabBar(
        indicatorColor: Colors.transparent,
        onTap: (i){
          setState(() {
            widget._index = i;
          });
        },
        tabs: <Widget>[
          Tab(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widget._index == 0 ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                'Delivered',
                style: TextStyle(
                  color: widget._index == 0 ? Colors.white : ThemeSchema.textColor,
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widget._index == 1 ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: FittedBox(
                child: Text(
                  'Processing',
                  style: TextStyle(
                    color: widget._index == 1 ? Colors.white : ThemeSchema.textColor,
                  ),
                ),
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: widget._index == 2 ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                'Cancelled',
                style: TextStyle(
                  color: widget._index == 2 ? Colors.white : ThemeSchema.textColor,
                ),
              ),
            ),
          ),
        ],
      ) ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final ThemeSchema = Provider.of<ThemeApp>(context);

    return new Container(
      color: ThemeSchema.backgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}