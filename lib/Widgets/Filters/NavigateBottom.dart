
import 'package:flutter/cupertino.dart';

class BottomNavigate extends SliverPersistentHeaderDelegate {
  final Widget child;

  BottomNavigate({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: child,
    );
  }

  @override
  bool shouldRebuild(BottomNavigate oldDelegate) {
    return false;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;
}
