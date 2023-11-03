import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/src/auth/signup/signup_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../reusable_widgets/buttons/app_buttons.dart';
import '../../reusable_widgets/text/text.dart';
import '../../reusable_widgets/text_field/text_field.dart';
import '../../utils/style/color/app_colors.dart';
import '../../utils/style/images/images.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      SvgPicture.asset(
                        AppImage.shopGo2,
                        height: 90,
                        width: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomText.customSizedText(
                            text: 'Create\nYour Account',
                            size: 28,
                            maxLine: 2,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CustomTextFields.appTextField(
                          borderColor: viewModel.nameError == ''
                              ? Colors.transparent
                              : Colors.red,
                          hintText: 'Username',
                          keBoardType: TextInputType.name,
                          controller: viewModel.usernameController,
                          prefixIcon: Icons.person,
                        ),
                      ),
                      CustomText.errorText(
                        errorText: viewModel.nameError,
                        visible: viewModel.nameError != '',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFields.appTextField(
                          keBoardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          borderColor: viewModel.emailError == ''
                              ? Colors.transparent
                              : Colors.red,
                          controller: viewModel.emailController,
                          prefixIcon: Icons.email,
                        ),
                      ),
                      CustomText.errorText(
                        errorText: viewModel.emailError,
                        visible: viewModel.emailError != '',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFields.appTextField(
                          hintText: '+90123456789',
                          keBoardType: TextInputType.number,
                          borderColor: viewModel.phoneError == ''
                              ? Colors.transparent
                              : Colors.red,
                          controller: viewModel.phoneController,
                          prefixIcon: Icons.phone,
                        ),
                      ),
                      CustomText.errorText(
                        errorText: viewModel.phoneError,
                        visible: viewModel.phoneError != '',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFields.appTextField(
                          onSuffixPressed: () {
                            viewModel.rebuildUi();
                            if (viewModel.visible) {
                              viewModel.visible = false;
                            } else {
                              viewModel.visible = true;
                            }
                          },
                          borderColor: viewModel.passwordError == ''
                              ? Colors.transparent
                              : Colors.red,
                          hintText: 'Password',
                          controller: viewModel.passwordController,
                          prefixIcon: Icons.lock,
                          suffixIcon: viewModel.visible == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          obscureText: viewModel.visible,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFields.appTextField(
                          onSuffixPressed: () {
                            viewModel.rebuildUi();
                            if (viewModel.obscureConfirmText) {
                              viewModel.obscureConfirmText = false;
                            } else {
                              viewModel.obscureConfirmText = true;
                            }
                          },
                          borderColor: viewModel.passwordError == ''
                              ? Colors.transparent
                              : Colors.red,
                          hintText: 'Confirm password',
                          controller: viewModel.confirmPasswordController,
                          prefixIcon: Icons.lock,
                          suffixIcon: viewModel.obscureConfirmText == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          obscureText: viewModel.obscureConfirmText,
                        ),
                      ),
                      CustomText.errorText(
                        errorText: viewModel.passwordError,
                        visible: viewModel.passwordError != '',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: viewModel.isChecked,
                              activeColor: AppColors.seconderyColor,
                              onChanged: (bool? newBool) {
                                viewModel.rebuildUi();
                                viewModel.isChecked = newBool!;
                              },
                            ),
                            CustomText.customSizedText(
                                text: 'Remember me',
                                size: 12,
                                color: AppColors.greyColor),
                          ],
                        ),
                      ),
                      Material(
                        child: customAnimatedButton(
                          text: 'Sign Up',
                          onPressed: () {
                            viewModel.animateButton();
                          },
                          height: 46.0,
                          width: 350.0,
                          controller: viewModel.btnController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText.customSizedText(
                                text: 'Already have account? ',
                                size: 10,
                                color: AppColors.greyColor),
                            GestureDetector(
                              onTap: () {
                                viewModel.navigateToLogInView();
                              },
                              child: CustomText.customSizedText(
                                  text: 'Login',
                                  size: 12,
                                  color: AppColors.blackColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
