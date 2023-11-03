// import 'package:flutter/material.dart';
// import 'package:stacked/stacked.dart';
// import 'brands_viewmodel.dart';
// import 'widget/no_brand.dart';

// class AllBrandsView extends StatelessWidget {
//   const AllBrandsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//       viewModelBuilder: () => AllBrandsViewModel(),
//       onViewModelReady: (viewModel) async {
//         await viewModel.getBrands();
//       },
//       builder: (context, viewModel, child) {
//         if (viewModel.noInternet == true) {
//           return SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.5,
//             width: MediaQuery.sizeOf(context).width,
//             child: CustomError.noInternet(),
//           );
//         }
//         if (viewModel.otherError == true) {
//           return SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.5,
//             width: MediaQuery.sizeOf(context).width,
//             child: CustomError.otherError(),
//           );
//         }

//         if (viewModel.isLoading == true) {
//           return waitingBrand();
//         }

//         if (viewModel.brandsUrls.isEmpty) {
//           return noBrands(context: context);
//         }

//         return activeBrands(viewModel: viewModel);
//       },
//     );
//   }
// }
