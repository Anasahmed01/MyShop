import 'package:flutter/material.dart';
import 'package:shop/src/brands/brands_viewmodel.dart';
import 'package:stacked/stacked.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BrandsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
