import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'brands_card.dart';
import '../brands_viewmodel.dart';

Widget activeBrands({
  required AllBrandsViewModel viewModel,
}) {
  return AnimationLimiter(
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          columnCount: 4,
          child: ScaleAnimation(
            delay: const Duration(milliseconds: 200),
            child: brands(
              onTap: () {
                viewModel.navigateToWebView(index: index);
              },
              height: 72,
              width: 79,
              image: Image.asset(viewModel.getBrandImg[index]),
            ),
          ),
        );
      },
    ),
  );
}
