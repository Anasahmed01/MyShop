import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'brands_card.dart';

Widget waitingBrand() {
  return AnimationLimiter(
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 24,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          columnCount: 4,
          child: ScaleAnimation(
            delay: const Duration(milliseconds: 100),
            child: brandsSkeleton(
              height: 72,
              width: 79,
            ),
          ),
        );
      },
    ),
  );
}
