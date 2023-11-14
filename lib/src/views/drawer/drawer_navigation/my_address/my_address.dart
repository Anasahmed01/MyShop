// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shop_go_new/src/reusable_widgets/buttons/app_buttons.dart';
// import 'package:shop_go_new/src/reusable_widgets/errors/error.dart';
// import 'package:shop_go_new/src/reusable_widgets/text_field/text_field.dart';
// import 'package:shop_go_new/src/veiws/drawer/drawer_navigation/my_address/add_address_widget.dart';
// import 'package:shop_go_new/src/veiws/drawer/drawer_navigation/my_address/my_address_viewmodel.dart';
// import 'package:stacked/stacked.dart';
// import '../../../../reusable_widgets/text/text.dart';
// import '../../../../utils/style/color/app_colors.dart';

// class MyAddressView extends StatelessWidget {
//   const MyAddressView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//       viewModelBuilder: () => MyAddressViewModel(),
//       onViewModelReady: (viewModel) async {
//         await viewModel.getAddress();
//       },
//       builder: (context, viewModel, child) {
//         if (viewModel.isLoading == true) {
//           return Scaffold(
//             backgroundColor: AppColors.whiteColor,
//             resizeToAvoidBottomInset: false,
//             appBar: AppBar(
//               elevation: 0,
//               backgroundColor: AppColors.primaryColor,
//               leading: IconButton(
//                 padding: EdgeInsets.zero,
//                 onPressed: () {
//                   viewModel.navigateToback();
//                 },
//                 icon: Icon(
//                   Icons.arrow_back_ios_new_rounded,
//                   color: AppColors.whiteColor,
//                 ),
//               ),
//             ),
//             body: SizedBox(
//               height: double.infinity,
//               width: double.infinity,
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 50,
//                           width: MediaQuery.sizeOf(context).width,
//                           child: Center(
//                             child: CustomText.customSizedText(
//                               text: 'My Address',
//                               size: 18,
//                               maxFontSize: 18,
//                               minFontSize: 18,
//                               color: AppColors.blackColor,
//                               fontWeight: FontWeight.w600,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 5),
//                           child: CustomText.customSizedText(
//                             text:
//                                 'The Following address will be used on checkout page by default',
//                             size: 13,
//                             maxFontSize: 13,
//                             minFontSize: 13,
//                             maxLine: 2,
//                             color: AppColors.greyColor,
//                             textAlign: TextAlign.justify,
//                           ),
//                         ),
//                         CustomTextFields.squareTextField(
//                           controller: viewModel.findAddressController,
//                           hintText: 'Find Address',
//                           fillColor: true,
//                           borderColor: Colors.transparent,
//                           borderRadius: BorderRadius.circular(5),
//                           borderStyle: BorderStyle.none,
//                           hintWeight: FontWeight.w500,
//                           prefixIcon: Icon(
//                             CupertinoIcons.search,
//                             color: AppColors.greyColor,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         waitingaddress(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//         if (viewModel.noInternet == true) {
//           return Scaffold(
//               backgroundColor: AppColors.whiteColor,
//               resizeToAvoidBottomInset: false,
//               appBar: AppBar(
//                 elevation: 0,
//                 backgroundColor: AppColors.primaryColor,
//                 leading: IconButton(
//                   padding: EdgeInsets.zero,
//                   onPressed: () {
//                     viewModel.navigateToback();
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios_new_rounded,
//                     color: AppColors.whiteColor,
//                   ),
//                 ),
//               ),
//               body: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: CustomError.noInternet(),
//               ));
//         }
//         if (viewModel.otherError == true) {
//           return Scaffold(
//               backgroundColor: AppColors.whiteColor,
//               resizeToAvoidBottomInset: false,
//               appBar: AppBar(
//                 elevation: 0,
//                 backgroundColor: AppColors.primaryColor,
//                 leading: IconButton(
//                   padding: EdgeInsets.zero,
//                   onPressed: () {
//                     viewModel.navigateToback();
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios_new_rounded,
//                     color: AppColors.whiteColor,
//                   ),
//                 ),
//               ),
//               body: Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: CustomError.otherError(),
//               ));
//         }
//         if (viewModel.addressModel == null) {
//           return Scaffold(
//             backgroundColor: AppColors.whiteColor,
//             resizeToAvoidBottomInset: false,
//             appBar: AppBar(
//               elevation: 0,
//               backgroundColor: AppColors.primaryColor,
//               leading: IconButton(
//                 padding: EdgeInsets.zero,
//                 onPressed: () {
//                   viewModel.navigateToback();
//                 },
//                 icon: Icon(
//                   Icons.arrow_back_ios_new_rounded,
//                   color: AppColors.whiteColor,
//                 ),
//               ),
//             ),
//             body: SizedBox(
//               height: double.infinity,
//               width: double.infinity,
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 50,
//                           width: MediaQuery.sizeOf(context).width,
//                           child: Center(
//                             child: CustomText.customSizedText(
//                               text: 'My Address',
//                               size: 18,
//                               maxFontSize: 18,
//                               minFontSize: 18,
//                               color: AppColors.blackColor,
//                               fontWeight: FontWeight.w600,
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 5),
//                           child: CustomText.customSizedText(
//                             text:
//                                 'The Following address will be used on checkout page by default',
//                             size: 13,
//                             maxFontSize: 13,
//                             minFontSize: 13,
//                             maxLine: 2,
//                             color: AppColors.greyColor,
//                             textAlign: TextAlign.justify,
//                           ),
//                         ),
//                         CustomTextFields.squareTextField(
//                           controller: viewModel.findAddressController,
//                           hintText: 'Find Address',
//                           fillColor: true,
//                           borderColor: Colors.transparent,
//                           borderRadius: BorderRadius.circular(5),
//                           borderStyle: BorderStyle.none,
//                           hintWeight: FontWeight.w500,
//                           prefixIcon: Icon(
//                             CupertinoIcons.search,
//                             color: AppColors.greyColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     width: MediaQuery.sizeOf(context).width,
//                     top: MediaQuery.sizeOf(context).height * 0.5,
//                     child: emptyAddress(context: context),
//                   ),
//                   Positioned(
//                     bottom: 20,
//                     child: SizedBox(
//                       width: MediaQuery.sizeOf(context).width,
//                       child: Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             addAddressSheet(
//                                 context: context, viewModel: viewModel);
//                           },
//                           child: customButton(
//                             text: 'Add New Address',
//                             buttonHeight: 46,
//                             buttonwidth: 200,
//                             buttonColor: AppColors.seconderyColor2,
//                             fontWeight: FontWeight.w500,
//                             textSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//         return Scaffold(
//           backgroundColor: AppColors.whiteColor,
//           resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: AppColors.primaryColor,
//             leading: IconButton(
//               padding: EdgeInsets.zero,
//               onPressed: () {
//                 viewModel.navigateToback();
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: AppColors.whiteColor,
//               ),
//             ),
//           ),
//           body: SizedBox(
//             height: double.infinity,
//             width: double.infinity,
//             child: Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 50,
//                         width: MediaQuery.sizeOf(context).width,
//                         child: Center(
//                           child: CustomText.customSizedText(
//                             text: 'My Address',
//                             size: 18,
//                             maxFontSize: 18,
//                             minFontSize: 18,
//                             color: AppColors.blackColor,
//                             fontWeight: FontWeight.w600,
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: CustomText.customSizedText(
//                           text:
//                               'The Following address will be used on checkout page by default',
//                           size: 13,
//                           maxFontSize: 13,
//                           minFontSize: 13,
//                           maxLine: 2,
//                           color: AppColors.greyColor,
//                           textAlign: TextAlign.justify,
//                         ),
//                       ),
//                       CustomTextFields.squareTextField(
//                         controller: viewModel.findAddressController,
//                         hintText: 'Find Address',
//                         fillColor: true,
//                         borderColor: Colors.transparent,
//                         borderRadius: BorderRadius.circular(5),
//                         borderStyle: BorderStyle.none,
//                         hintWeight: FontWeight.w500,
//                         prefixIcon: Icon(
//                           CupertinoIcons.search,
//                           color: AppColors.greyColor,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       addressList(
//                           model: viewModel.addressModel!, viewModel: viewModel),
//                       SizedBox(
//                           height: MediaQuery.sizeOf(context).height * 0.07),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   child: SizedBox(
//                     width: MediaQuery.sizeOf(context).width,
//                     child: Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           addAddressSheet(
//                               context: context, viewModel: viewModel);
//                         },
//                         child: customButton(
//                           text: 'Add New Address',
//                           buttonHeight: 46,
//                           buttonwidth: 200,
//                           buttonColor: AppColors.seconderyColor2,
//                           fontWeight: FontWeight.w500,
//                           textSize: 15,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
