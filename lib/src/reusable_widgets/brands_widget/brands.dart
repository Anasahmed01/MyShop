// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../errors/error.dart';
import 'brands_viewmodel.dart';
import 'widget/active_brands.dart';
import 'widget/waiting_brands.dart';

class AllBrandsView extends StatelessWidget {
  final int navIndex;
  const AllBrandsView({
    Key? key,
    required this.navIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AllBrandsViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getBrands();
      },
      builder: (context, viewModel, child) {
        if (viewModel.noInternet == true) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            width: MediaQuery.sizeOf(context).width,
            child: CustomError.noInternet(),
          );
        }
        if (viewModel.otherError == true) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            width: MediaQuery.sizeOf(context).width,
            child: CustomError.otherError(),
          );
        }

        if (viewModel.isLoading == true) {
          return waitingBrand();
        }

        // if (viewModel.brandsUrls.isEmpty) {
        //   return noBrands(context: context);
        // }

        return activeBrands(
          viewModel: viewModel,
          navIndex: navIndex,
          brandsList: viewModel.selectedCategory == 0
              ? viewModel.brandService.brands
              : viewModel.selection,
        );
      },
    );
  }
}
