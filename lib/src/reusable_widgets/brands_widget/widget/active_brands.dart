// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// import '../../../utils/style/color/app_colors.dart';
// import 'brands_card.dart';
// import '../brands_viewmodel.dart';

// Widget activeBrands({
//   required AllBrandsViewModel viewModel,
// }) {
//   return AnimationLimiter(
//     child: GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: viewModel.allBrandsImages.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 4,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         return AnimationConfiguration.staggeredGrid(
//           position: index,
//           columnCount: 4,
//           child: ScaleAnimation(
//             delay: const Duration(milliseconds: 200),
//             child: brands(
//                 onTap: () {
//                   viewModel.navigateToWebView(index: index);
//                 },
//                 height: 72,
//                 width: 79,
//                 image: Image.network(
//                   AppStrings.brandsUrl +
//                       viewModel.allBrandsImages[index].toString(),
//                   height: 61.0,
//                   width: 71.0,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return Center(
//                       child: CircularProgressIndicator(
//                         color: AppColors.primaryColor,
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded /
//                                 loadingProgress.expectedTotalBytes!
//                             : null,
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return Center(
//                       child: CupertinoActivityIndicator(
//                         color: AppColors.primaryColor,
//                         radius: 14,
//                       ),
//                     );
//                   },
//                 )),
//           ),
//         );
//       },
//     ),
//   );
// }
