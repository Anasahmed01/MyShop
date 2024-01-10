import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shop/src/reusable_widgets/brands_widget/brands_viewmodel.dart';
import 'package:shop/src/reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';

Widget categorys({
  required AllBrandsViewModel viewModel,
}) {
  return SizedBox(
    height: 100,
    child: ListView.builder(
      itemCount: viewModel.brandService.category!.categoryNames.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(seconds: 1),
          child: FadeInAnimation(
            duration: const Duration(seconds: 1),
            child: SlideAnimation(
              duration: const Duration(seconds: 1),
              horizontalOffset: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    viewModel.selectedCategory = index;
                    viewModel.getBrandsByCat();
                    viewModel.notifyListeners();
                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.transparent,
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteColor,
                        border: Border.all(
                          width: 2,
                          color: viewModel.selectedCategory == index
                              ? AppColors.primaryColor
                              : Colors.transparent,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            flex: 2,
                            child: index == 0
                                ? Icon(
                                    CupertinoIcons.chart_bar,
                                    size: 34,
                                    color: viewModel.selectedCategory == index
                                        ? AppColors.primaryColor
                                        : AppColors.blackColor.withOpacity(0.7),
                                  )
                                : Image.network(
                                    viewModel.brandService.category!
                                        .categoryImages[index],
                                    height: 45,
                                    width: 45,
                                    scale: 1.0,
                                    color: viewModel.selectedCategory == index
                                        ? AppColors.primaryColor
                                        : AppColors.blackColor.withOpacity(0.7),
                                    fit: BoxFit.scaleDown,
                                    filterQuality: FilterQuality.low,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: CupertinoActivityIndicator(
                                          color: AppColors.primaryColor,
                                          radius: 14,
                                        ),
                                      );
                                    },
                                  ),
                          ),
                          Flexible(
                            flex: 1,
                            child: CustomText.customSizedText(
                              text: viewModel
                                  .brandService.category!.categoryNames[index],
                              color: viewModel.selectedCategory == index
                                  ? AppColors.primaryColor
                                  : AppColors.blackColor.withOpacity(0.7),
                              textAlign: TextAlign.center,
                              maxLine: 2,
                              minFontSize: 8,
                              maxFontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}






// class Category extends StatelessWidget {
//   const Category({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//       viewModelBuilder: () => AllBrandsViewModel(),
//       builder: (context, viewModel, child) {
//         return SizedBox(
//           height: 120,
//           child: ListView.builder(
//             itemCount: viewModel.brandService.category!.categoryNames.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   viewModel.selectedCategory = index;
//                   viewModel.getBrandsByCat();
//                   viewModel.notifyListeners();
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color: index == viewModel.selectedCategory
//                               ? AppColors.seconderyColor
//                               : AppColors.lightLightGreyColor),
//                       borderRadius: BorderRadius.circular(5),
//                       color: AppColors.whiteColor,
//                       boxShadow: [
//                         BoxShadow(
//                             color: AppColors.lightGreyColor,
//                             spreadRadius: 1,
//                             blurRadius: 10),
//                       ],
//                     ),
//                     height: 65,
//                     width: 100,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.network(
//                             viewModel
//                                 .brandService.category!.categoryImages[index],
//                             color: index == viewModel.selectedCategory
//                                 ? AppColors.seconderyColor
//                                 : AppColors.lightLightGreyColor),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         CustomText.customSizedText(
//                           textAlign: TextAlign.center,
//                           text: viewModel
//                               .brandService.category!.categoryNames[index],
//                           color: viewModel.selectedCategory == index
//                               ? AppColors.seconderyColor
//                               : AppColors.blackColor.withOpacity(0.7),
//                           minFontSize: 8,
//                           maxLine: 2,
//                           size: 12,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
