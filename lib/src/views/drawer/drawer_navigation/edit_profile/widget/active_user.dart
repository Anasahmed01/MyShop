import 'package:animations/animations.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:shop/src/views/drawer/drawer_navigation/edit_profile/widget/open_profile.dart';
import '../../../../../models/user.dart';
import '../../../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../../../reusable_widgets/text/text.dart';
import '../../../../../reusable_widgets/text_field/text_field.dart';
import '../../../../../utils/style/color/app_colors.dart';
import '../../../../../utils/style/images/images.dart';
import '../../../../../utils/style/text_style/text_style.dart';
import '../edit_profile_viewmodel.dart';

Widget activeUser({
  required BuildContext context,
  required UserModel userModel,
  required EditProfileViewModel viewModel,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: AnimationLimiter(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 300),
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 5,
            duration: const Duration(seconds: 1),
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomText.customSizedText(
                        text: 'Edit Account',
                        size: 18,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600),
                  ),
                  FlipAnimation(
                    duration: const Duration(seconds: 1),
                    flipAxis: FlipAxis.y,
                    curve: Curves.bounceOut,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Center(
                          child: Stack(
                        children: [
                          OpenContainer(
                            closedShape: const CircleBorder(),
                            transitionDuration: const Duration(seconds: 1),
                            closedBuilder:
                                (context, VoidCallback openContainer) =>
                                    Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(userModel
                                                    .shopGo[0].userImage))),
                                        child: Container()),
                            openBuilder: (context, action) =>
                                const OpenProfileView(),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              highlightColor: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(30),
                              splashColor: Colors.transparent,
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading: Icon(
                                                Icons.camera_alt_rounded,
                                                color: AppColors.primaryColor,
                                              ),
                                              title: CustomText.customSizedText(
                                                text: 'Take photo',
                                                color: AppColors.primaryColor,
                                                size: 15,
                                              ),
                                              onTap: () {
                                                // viewModel
                                                //     .uploadImageFromCamera();
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.photo,
                                                color: AppColors.primaryColor,
                                              ),
                                              title: CustomText.customSizedText(
                                                text: 'Select from gallery',
                                                color: AppColors.primaryColor,
                                                size: 15,
                                              ),
                                              onTap: () {
                                                viewModel
                                                    .uploadImageFromGallery();
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Image.asset(AppImage.edit),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: CustomText.customSizedText(
                          text: userModel.shopGo[0].nickname,
                          size: 22,
                          color: AppColors.blackColor),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomText.customSizedText(
                      text: 'Full Name', size: 14, color: AppColors.greyColor),
                  const SizedBox(height: 12),
                  CustomTextFields.squareTextField(
                      controller: viewModel.fullNameController,
                      hintText: userModel.shopGo[0].nickname),
                  const SizedBox(height: 12),
                  CustomText.customSizedText(
                      text: 'Email Address',
                      size: 14,
                      color: AppColors.greyColor),
                  const SizedBox(height: 12),
                  CustomTextFields.squareTextField(
                      readOnly: true,
                      controller: viewModel.emailController,
                      hintText: userModel.shopGo[0].email),
                  const SizedBox(height: 12),
                  CustomText.customSizedText(
                      text: 'Phone number',
                      size: 14,
                      color: AppColors.greyColor),
                  const SizedBox(height: 12),
                  CustomTextFields.squareTextField(
                      readOnly: true,
                      controller: viewModel.phoneController,
                      hintText: userModel.shopGo[0].phone ?? 'phoneNumber'),
                  const SizedBox(height: 12),
                  CustomText.customSizedText(
                      text: 'Date of birth',
                      size: 14,
                      color: AppColors.greyColor),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: TextFormField(
                      readOnly: true,
                      cursorColor: AppColors.blackColor,
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.greyColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: userModel.shopGo[0].dob ?? 'Select Date',
                        hintStyle: AppTextStyle.customTextStyle(
                          color: AppColors.blackColor.withOpacity(0.5),
                          textStyle:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: AppColors.greyColor,
                        ),
                      ),
                      style: AppTextStyle.customTextStyle(
                        color: AppColors.blackColor.withOpacity(0.5),
                        textStyle:
                            const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: AppColors
                                        .primaryColor, // header background color
                                    onPrimary: AppColors
                                        .whiteColor, // header text color
                                    onSurface:
                                        AppColors.blackColor, // body text color
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: AppColors
                                          .primaryColor, // button text color
                                    ),
                                  ),
                                ),
                                child: child!);
                          },
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          String? formattedDate =
                              DateFormat("dd/MM/yyyy").format(pickedDate);

                          viewModel.dobController.text = formattedDate;
                          viewModel.dobController.text =
                              formattedDate.toString();
                        } else {
                          // print("Not selected");
                        }
                      },
                      onChanged: (newValue) {
                        viewModel.dobController.text = newValue;
                      },
                      controller: viewModel.dobController,
                    ),
                  ),
                  CustomText.customSizedText(
                      text: 'Gender', size: 14, color: AppColors.greyColor),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.blackColor.withOpacity(0.4),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        ),
                        hint: CustomText.customSizedText(
                          text: userModel.shopGo[0].gender ?? 'Select Gender',
                          color: AppColors.blackColor.withOpacity(0.5),
                        ),
                        elevation: 0,
                        isExpanded: true,
                        value: viewModel.genderController.text == ''
                            ? viewModel.selectedGender
                            : viewModel.genderController.text,
                        onChanged: (value) {
                          viewModel.selectedGender = value;
                          viewModel.genderController.text = value.toString();
                          viewModel.notifyListeners();
                        },
                        borderRadius: BorderRadius.circular(10),
                        items: viewModel.genderOptions.map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: CustomText.customSizedText(
                              text: gender,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              size: 15,
                              minFontSize: 15,
                              maxFontSize: 15,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  // DropdownButtonFormField(
                  //   icon: const Icon(
                  //     Icons.keyboard_arrow_down_rounded,
                  //     color: Colors.grey,
                  //   ),
                  //   elevation: 0,
                  //   isExpanded: true,
                  //   value: viewModel.genderController.text == ''
                  //       ? viewModel.selectedGender
                  //       : viewModel.genderController.text,
                  //   onChanged: (value) {
                  //     viewModel.selectedGender = value;
                  //     viewModel.genderController.text = value.toString();
                  //   },
                  //   decoration: InputDecoration(
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: const BorderSide(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     hintText: userModel.shopGo[0].gender ?? 'Select Gender',
                  //     border: OutlineInputBorder(
                  //       borderSide: const BorderSide(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //   ),
                  //   borderRadius: BorderRadius.circular(10.0),
                  //   items: viewModel.genderOptions.map((gender) {
                  //     return DropdownMenuItem<String>(
                  //       value: gender,
                  //       child: CustomText.customSizedText(
                  //         text: gender,
                  //         color: Colors.grey,
                  //         fontWeight: FontWeight.w400,
                  //         size: 15,
                  //         minFontSize: 15,
                  //         maxFontSize: 15,
                  //       ),
                  //     );
                  //   }).toList(),
                  // ),
                  const SizedBox(height: 12),
                  CustomText.customSizedText(
                      text: 'Country', size: 14, color: AppColors.greyColor),
                  const SizedBox(height: 12),
                  CustomTextFields.squareTextField(
                    hintStyle: AppTextStyle.customTextStyle(
                      color: Colors.grey,
                    ),
                    keyBoardType: TextInputType.none,
                    readOnly: true,
                    suffixIcon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          bottomSheetHeight:
                              MediaQuery.sizeOf(context).height * 0.6,
                          borderRadius: BorderRadius.circular(20),
                          inputDecoration: InputDecoration(
                            hintStyle: TextStyle(color: AppColors.greyColor),
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.greyColor,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                              color: AppColors.greyColor,
                            ),
                            hintText: "Search your Country",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        showPhoneCode: false,
                        onSelect: (
                          Country value,
                        ) {
                          viewModel.countryController.text = value.name;
                          viewModel.rebuildUi();
                        },
                      );
                    },
                    controller: viewModel.countryController,
                    hintText:
                        userModel.shopGo[0].country ?? 'Select your country',
                    hintColor: AppColors.greyColor,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Material(
                      child: customAnimatedButton(
                        text: 'Update',
                        onPressed: () {
                          viewModel.updateUserInfo();
                        },
                        height: 46,
                        width: MediaQuery.sizeOf(context).width * 0.55,
                        controller: viewModel.btnController,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
