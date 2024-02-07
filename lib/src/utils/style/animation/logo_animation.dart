//Must use AnimationLimiter & AnimationConfiguration over this widget
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/src/utils/style/images/images.dart';

Widget appLogoAniamtion({double? logoSize, String? svgName}) {
  return SlideAnimation(
    duration: const Duration(seconds: 2),
    verticalOffset: 10,
    child: FlipAnimation(
      duration: const Duration(seconds: 1),
      flipAxis: FlipAxis.y,
      curve: Curves.bounceOut,
      child: SvgPicture.asset(
        svgName ?? AppImage.shopGo,
        height: logoSize ?? 100,
        width: logoSize ?? 100,
        fit: BoxFit.cover,
      ),
    ),
  );
}
