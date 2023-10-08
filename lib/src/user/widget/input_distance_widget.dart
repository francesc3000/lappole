import 'package:flutter/material.dart';
import 'package:lappole/src/user/sub_page/third_party/third_party_widget.dart';
import 'package:lappole/src/user/sub_page/watch/watch_widget.dart';

class InputDistanceWidget extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        WatchWidget(),
        ThirdPartyWidget(),
      ],
    );
  }

  @override
  double get maxExtent => 114;

  @override
  double get minExtent => 24;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
