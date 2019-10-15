import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomPaginationBuilder extends SwiperPlugin {
  final Color activeColor;
  final Color color;
  final Size activeSize;
  final Size size;
  final double space;

  final Key key;

  CustomPaginationBuilder(
      {this.activeColor,
      this.color,
      this.activeSize: const Size(10.0, 2.0),
      this.size: const Size(10.0, 2.0),
      this.space: 3.0,
      this.key});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;

    List<Widget> list = [];

    if (config.itemCount > 20) {
      print("You have reached the maxium limit");
    }

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      Size size = active ? this.activeSize : this.size;

      list.add(SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          decoration: BoxDecoration(
            color: active ? activeColor : color,
            borderRadius: BorderRadius.circular(12.0),
          ),
          key: Key("pagination_$i"),
          margin: EdgeInsets.all(space),
        ),
      ));
    }
    // if (config.scrollDirection == Axis.vertical) {
    //   return new Column(
    //     key: key,
    //     mainAxisSize: MainAxisSize.min,
    //     children: list,
    //   );
    // } else {
    //   return new Row(
    //     key: key,
    //     mainAxisSize: MainAxisSize.min,
    //     children: list,
    //   );
    // }
  }
}
