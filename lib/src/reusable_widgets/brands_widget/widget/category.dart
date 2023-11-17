import 'package:flutter/material.dart';
import 'package:shop/src/reusable_widgets/brands_widget/brands_viewmodel.dart';
import 'package:shop/src/reusable_widgets/text/text.dart';
import '../../../utils/style/color/app_colors.dart';

Widget category({required AllBrandsViewModel viewModel}) {
  return SizedBox(
    height: 120,
    child: ListView.builder(
      itemCount: viewModel.brandService.category!.categoryNames.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            viewModel.selectedCategory = index;
            viewModel.getBrandsByCat();
            viewModel.notifyListeners();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: index == viewModel.selectedCategory
                        ? AppColors.seconderyColor
                        : AppColors.lightLightGreyColor),
                borderRadius: BorderRadius.circular(5),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.lightGreyColor,
                      spreadRadius: 1,
                      blurRadius: 10),
                ],
              ),
              height: 65,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      viewModel.brandService.category!.categoryImages[index],
                      color: index == viewModel.selectedCategory
                          ? AppColors.seconderyColor
                          : AppColors.lightLightGreyColor),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText.customSizedText(
                    textAlign: TextAlign.center,
                    text: viewModel.brandService.category!.categoryNames[index],
                    color: viewModel.selectedCategory == index
                        ? AppColors.seconderyColor
                        : AppColors.blackColor.withOpacity(0.7),
                    minFontSize: 8,
                    maxLine: 2,
                    size: 12,
                  ),
                ],
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
