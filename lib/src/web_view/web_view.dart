// // ignore_for_file: invalid_use_of_protected_member

// import 'package:flutter/material.dart';
// import 'package:myshop/src/web_view/web_viewmodel.dart';
// import 'package:stacked/stacked.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:developer' as devlog;
// import '../utils/style/color/app_colors.dart';

// class WebViewr extends StatelessWidget {
//   const WebViewr({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//       viewModelBuilder: () => WebViewModel(),
//       builder: (context, viewModel, child) {
//         var controller = WebViewController()
//           ..setJavaScriptMode(JavaScriptMode.unrestricted)
//           ..setBackgroundColor(AppColors.blackColor)
//           ..clearCache()
//           ..setNavigationDelegate(
//             NavigationDelegate(
//               onProgress: (int progress) {
//                 // Update loading bar.
//               },
//               onWebResourceError: (WebResourceError error) {
//                 devlog.log(error.toString());
//               },
//               onNavigationRequest: (NavigationRequest request) {
//                 if (request.url.startsWith('https://www.youtube.com/')) {
//                   return NavigationDecision.prevent;
//                 }
//                 return NavigationDecision.navigate;
//               },
//             ),
//           )
//           ..loadRequest(
//             Uri.parse('https://github.com'),
//           );
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: const Color(0xFF5A4496),
//             actions: [
//               InkWell(
//                   onTap: () {
//                     viewModel.show = false;
//                     viewModel.fkey.currentState!.setState(() {});
//                     controller.goBack();
//                   },
//                   child: const Icon(Icons.arrow_back_ios_new_rounded)),
//               const SizedBox(width: 10),
//               InkWell(
//                   onTap: () {
//                     viewModel.show = false;
//                     viewModel.fkey.currentState!.setState(() {});
//                     controller.goForward();
//                   },
//                   child: const Icon(Icons.arrow_forward_ios_rounded)),
//               const SizedBox(width: 10),
//               InkWell(
//                 onTap: () {
//                   // viewModel.navigateToCart();
//                 },
//                 child: const Icon(Icons.shopping_bag_rounded),
//               ),
//               const SizedBox(width: 10),
//             ],
//           ),
//           body: WebViewWidget(controller: controller),
//           // Column(
//           //   children: [
//           //
//           //     StatefulBuilder(
//           //       key: viewModel.loaderkey,
//           //       builder: (context, setState) {
//           //         return Visibility(
//           //           visible: viewModel.isLoading,
//           //           child: Center(
//           //             child: Container(
//           //               height: 100,
//           //               width: 100,
//           //               decoration: BoxDecoration(
//           //                   color: AppColors.whiteColor.withOpacity(0.8),
//           //                   borderRadius: BorderRadius.circular(10)),
//           //               child: CupertinoActivityIndicator(
//           //                 color: AppColors.primryColor,
//           //                 radius: 20,
//           //               ),
//           //             ),
//           //           ),
//           //         );
//           //       },
//           //     ),
//           //   ],
//           // ),
//         );
//       },
//     );
//   }
// }
