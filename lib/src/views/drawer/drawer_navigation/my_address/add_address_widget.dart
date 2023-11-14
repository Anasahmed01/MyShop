// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../models/address.dart';
// import '../../../../reusable_widgets/buttons/app_buttons.dart';
// import '../../../../reusable_widgets/text/text.dart';
// import '../../../../reusable_widgets/text_field/text_field.dart';
// import '../../../../utils/style/color/app_colors.dart';
// import '../../../../utils/style/images/images.dart';
// import 'my_address_viewmodel.dart';

// addAddressSheet(
//     {required BuildContext context, required MyAddressViewModel viewModel}) {
//   return showModalBottomSheet(
//       isScrollControlled: true,
//       showDragHandle: true,
//       enableDrag: false,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
//       ),
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding:
//               EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.5,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText.customSizedText(
//                         text: 'Address title',
//                         size: 14,
//                         color: AppColors.greyColor),
//                     CustomTextFields.squareTextField(
//                       controller: viewModel.titleController,
//                       hintText: 'Address title',
//                       contentPadding: EdgeInsets.only(
//                         top: 0,
//                         bottom: 0,
//                         left: 10,
//                         right: 0,
//                       ),
//                       borderRadius: BorderRadius.circular(5),
//                       hintWeight: FontWeight.w500,
//                     ),
//                     StatefulBuilder(
//                       key: viewModel.titleKey,
//                       builder: (context, setState) {
//                         return Visibility(
//                           child: CustomText.errorText(
//                               leftPadding: 0,
//                               errorText: viewModel.titleError,
//                               visible: viewModel.titleError != ''),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     CustomText.customSizedText(
//                         text: 'Province', size: 14, color: AppColors.greyColor),
//                     CustomTextFields.squareTextField(
//                       controller: viewModel.provinceController,
//                       hintText: 'Province',
//                       contentPadding: EdgeInsets.only(
//                         top: 0,
//                         bottom: 0,
//                         left: 10,
//                         right: 0,
//                       ),
//                       borderRadius: BorderRadius.circular(5),
//                       hintWeight: FontWeight.w500,
//                     ),
//                     StatefulBuilder(
//                       key: viewModel.provinceKey,
//                       builder: (context, setState) {
//                         return Visibility(
//                           child: CustomText.errorText(
//                               leftPadding: 0,
//                               errorText: viewModel.provinceError,
//                               visible: viewModel.provinceError != ''),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     CustomText.customSizedText(
//                         text: 'City', size: 14, color: AppColors.greyColor),
//                     CustomTextFields.squareTextField(
//                       controller: viewModel.cityController,
//                       hintText: 'City',
//                       borderRadius: BorderRadius.circular(5),
//                       hintWeight: FontWeight.w500,
//                       contentPadding: EdgeInsets.only(
//                         top: 0,
//                         bottom: 0,
//                         left: 10,
//                         right: 0,
//                       ),
//                     ),
//                     StatefulBuilder(
//                       key: viewModel.cityKey,
//                       builder: (context, setState) {
//                         return Visibility(
//                           child: CustomText.errorText(
//                               leftPadding: 0,
//                               errorText: viewModel.cityError,
//                               visible: viewModel.cityError != ''),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     CustomText.customSizedText(
//                         text: 'Street', size: 14, color: AppColors.greyColor),
//                     CustomTextFields.squareTextField(
//                       controller: viewModel.streetController,
//                       hintText: 'Street',
//                       contentPadding: EdgeInsets.only(
//                         top: 0,
//                         bottom: 0,
//                         left: 10,
//                         right: 0,
//                       ),
//                       borderRadius: BorderRadius.circular(5),
//                       hintWeight: FontWeight.w500,
//                     ),
//                     StatefulBuilder(
//                       key: viewModel.streetKey,
//                       builder: (context, setState) {
//                         return Visibility(
//                           child: CustomText.errorText(
//                               leftPadding: 0,
//                               errorText: viewModel.streetError,
//                               visible: viewModel.streetError != ''),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     Center(
//                       child: InkWell(
//                         onTap: () {
//                           viewModel.addAddress();
//                         },
//                         child: customButton(
//                           text: 'Add Address',
//                           buttonHeight: 46,
//                           buttonwidth: 202,
//                           buttonColor: AppColors.seconderyColor2,
//                           fontWeight: FontWeight.w500,
//                           textSize: 15,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }).whenComplete(() {
//     viewModel.clearFields();
//   });
// }

// Widget addressList(
//     {required GetAddressModel model, required MyAddressViewModel viewModel}) {
//   return Flexible(
//     child: ListView.builder(
//       shrinkWrap: true,
//       itemCount: model.response.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: EdgeInsets.only(top: 10.0),
//           child: Stack(
//             children: [
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SvgPicture.asset(
//                               AppImage.addressHome,
//                               height: 40,
//                               width: 40,
//                               fit: BoxFit.cover,
//                             ),
//                             SizedBox(height: 5),
//                             CustomText.customSizedText(
//                               text:
//                                   '${model.response[index].street.toString()}, ${model.response[index].province.toString()}',
//                               maxLine: 2,
//                               size: 14,
//                               color: AppColors.greyColor,
//                               textAlign: TextAlign.left,
//                               maxFontSize: 14,
//                               minFontSize: 14,
//                             ),
//                             SizedBox(height: 5),
//                             CustomText.customSizedText(
//                               text: '${model.response[index].city.toString()}',
//                               maxLine: 1,
//                               size: 14,
//                               color: AppColors.greyColor,
//                               textAlign: TextAlign.left,
//                               maxFontSize: 14,
//                               minFontSize: 14,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Flexible(
//                         child: IconButton(
//                           iconSize: 70,
//                           onPressed: () {},
//                           icon: Image.asset(
//                             AppImage.addressLocation,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Visibility(
//                 visible: viewModel.isRemoving,
//                 child: Positioned(
//                   top: 0,
//                   right: 5,
//                   child: IconButton(
//                     onPressed: () {
//                       viewModel.removeAddress(
//                           id: model.response[index].id.toString());
//                     },
//                     icon: Icon(
//                       Icons.close_sharp,
//                       color: AppColors.redColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }

// Widget waitingaddress() {
//   return Flexible(
//     child: ListView.builder(
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return addressSkeleton();
//       },
//     ),
//   );
// }

// Widget addressSkeleton() {
//   return Card(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Padding(
//           padding: EdgeInsets.all(7.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30),
//                     color: AppColors.lightGreyColor,
//                   ),
//                   width: 50),
//               SizedBox(height: 5),
//               Container(
//                 width: 180,
//                 height: 15,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: AppColors.lightGreyColor,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Container(
//                 width: 150,
//                 height: 15,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: AppColors.lightGreyColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 10.0),
//           child: CircleAvatar(
//             radius: 35,
//             backgroundColor: AppColors.lightGreyColor,
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget emptyAddress({required BuildContext context}) {
//   return Container(
//     color: Colors.transparent,
//     child: Column(
//       children: [
//         SvgPicture.asset(
//           AppImage.shopGo2,
//           height: 100,
//           width: 80,
//           fit: BoxFit.cover,
//         ),
//         CustomText.customSizedText(
//           text: 'Your Address is empty!',
//           color: AppColors.primaryColor,
//           size: 15,
//           minFontSize: 15,
//           maxFontSize: 15,
//           fontWeight: FontWeight.w500,
//           textAlign: TextAlign.center,
//         )
//       ],
//     ),
//   );
// }
