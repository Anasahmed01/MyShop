// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_use_of_protected_member, must_be_immutable, prefer_const_constructors

import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shop/src/utils/style/color/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'package:shop/src/views/web_view/web_viewmodel.dart';

import 'widget/widget.dart';

class WebViewr extends StatelessWidget {
  final String url;
  final String removers;
  final int index;
  const WebViewr({
    Key? key,
    required this.url,
    required this.removers,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => WebViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.url = url;
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            actions: [
              InkWell(
                  onTap: () {
                    viewModel.show = false;

                    viewModel.controller.canGoBack();
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded)),
              const SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    viewModel.show = false;

                    viewModel.controller.canGoForward();
                  },
                  child: const Icon(Icons.arrow_forward_ios_rounded)),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  // viewModel.navigateToCart();
                },
                child: const Icon(Icons.shopping_bag_rounded),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(viewModel.url),
                ),
                onProgressChanged:
                    (InAppWebViewController controller, int progress) =>
                        viewModel.webLoader(progress: progress),
                onWebViewCreated: (InAppWebViewController controller) {
                  viewModel.controller = controller;
                },
                onLoadStart: (InAppWebViewController controller, url) async {
                  String currentUrl = url.toString();
                  await viewModel.checkUrl(link: currentUrl);
                  dev.log(currentUrl);
                  dev.log(viewModel.show.toString());
                },
                onScrollChanged: (controller, x, y) async {
                  viewModel.removeringElements(
                      controller: controller, removers: removers);
                  Uri? currentUrl = await controller.getUrl();
                  viewModel.scrollingPage(link: currentUrl.toString());
                },
              ),
              webViewLoader(viewModel: viewModel),
              waitingApi(isWaiting: viewModel.apiLoader),
              addToCart(
                  viewModel: viewModel,
                  context: context,
                  index: index,
                  removers: removers),
            ],
          ),
        );
      },
    );
  }
}
