import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/src/reusable_widgets/errors/error.dart';
import 'package:shop/src/views/cart/widgets/tabbar_widgets/cart_tab/widgets/checkout.dart';
import 'package:stacked/stacked.dart';
import '../../../../../utils/style/images/images.dart';
import '../../../../../utils/style/svg/svg.dart';
import '../../empty.dart';
import '../../waiting/waiting.dart';
import 'widgets/cart_card.dart';
import 'cart_tab_viewmodel.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CartTabViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getCart();
      },
      builder: (context, viewModel, child) {
        if (viewModel.isLoading == true) {
          return Waiting.waitingCart();
        }
        if (viewModel.noInternet == true) {
          return CustomError.noInternet();
        }
        if (viewModel.otherError == true) {
          return CustomError.otherError();
        }
        if (viewModel.attribute.isEmpty) {
          return emptyCart(
              icon: Image.asset(AppImage.yuGo, height: 50),
              upperText: 'Cart is Empty!',
              lowerText: 'Please add some products!');
        }
        if (viewModel.attribute.isEmpty) {
          return emptyCart(
              icon: SvgPicture.asset(AppSVG.weGo, height: 50),
              upperText: 'Cart is Empty!',
              lowerText: 'Please add some products!');
        }

        if (viewModel.getCartData != null) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.sizeOf(context).height * 0.05, top: 0),
                child: Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: double.infinity,
                  child: cartCard(
                    viewModel: viewModel,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                child: viewModel.getCartData == null
                    ? Container()
                    : checkOut(
                        viewModel: viewModel,
                        context: context,
                        model: viewModel.getCartData!),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
