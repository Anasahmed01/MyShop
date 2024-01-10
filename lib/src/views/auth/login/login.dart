import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/src/views/auth/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../reusable_widgets/buttons/app_buttons.dart';
import '../../../reusable_widgets/text/text.dart';
import '../../../reusable_widgets/text_field/text_field.dart';
import '../../../utils/style/color/app_colors.dart';
import '../../../utils/style/images/images.dart';
import '../../../utils/validation/validation.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LogInViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                // reverse: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Center(
                          child: SvgPicture.asset(AppImage.shopGo2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: CustomText.customSizedText(
                            text: 'Login',
                            size: 30,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: Center(
                          child: CustomText.customSizedText(
                              text: 'Your Account',
                              size: 30,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: CustomTextFields.appTextField(
                                  hintText: 'Email',
                                  controller: viewModel.emailController,
                                  prefixIcon: Icons.email,
                                  // onChanged: (value) {
                                  //   validateEmail(value);
                                  // },
                                  validator: (value) => validateEmail(value)),
                            ),
                            CustomTextFields.appTextField(
                              onSuffixPressed: () {
                                viewModel.rebuildUi();
                                if (viewModel.visible) {
                                  viewModel.visible = false;
                                } else {
                                  viewModel.visible = true;
                                }
                              },
                              hintText: 'Password',
                              controller: viewModel.passwordController,
                              prefixIcon: Icons.lock,
                              suffixIcon: viewModel.visible == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              // onChanged: (value) {
                              //   validatePassword(value);
                              // },
                              obscureText: viewModel.visible,
                              validator: (value) => validatePassword(value),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Checkbox(
                                      //   value: viewModel.isChecked,
                                      //   activeColor: AppColors.seconderyColor,
                                      //   onChanged: (bool? newBool) {
                                      //     viewModel.rebuildUi();
                                      //     viewModel.isChecked = newBool!;

                                      //     final isValidForm = viewModel
                                      //         .formKey.currentState!
                                      //         .validate();
                                      //   },
                                      // ),
                                      CustomText.customSizedText(
                                          text: 'Remember me',
                                          size: 12,
                                          color: AppColors.greyColor),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //NavService.phoneAuthView();
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 24.0),
                                        child: CustomText.customSizedText(
                                            text: 'Forgot Password?',
                                            size: 12.5,
                                            color: AppColors.greyColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Material(
                              child: customAnimatedButton(
                                text: 'Log In',
                                onPressed:
                                    //viewModel.isChecked ?
                                    () {
                                  viewModel.formKey.currentState!.validate()
                                      ? viewModel.animateButton()
                                      : viewModel.btnController.reset();
                                },
                                height: 46.0,
                                width: 350.0,
                                controller: viewModel.btnController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Divider(
                      //           thickness: 0.8,
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(right: 15.0, left: 15),
                      //         child: Text(
                      //           'Or Continue With',
                      //           style: TextStyle(fontSize: 12),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Divider(
                      //           thickness: 0.8,
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     customButtonChild(
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(10),
                      //         child: Image.asset(
                      //           AppImage.facebook,
                      //           height: 20,
                      //           width: 20,
                      //         ),
                      //       ),
                      //     ),
                      //     customButtonChild(
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(10),
                      //         child: Image.asset(
                      //           AppImage.google,
                      //           height: 20,
                      //           width: 20,
                      //         ),
                      //       ),
                      //     ),
                      //     customButtonChild(
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(10),
                      //         child: Image.asset(
                      //           AppImage.apple,
                      //           height: 20,
                      //           width: 20,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText.customSizedText(
                                text: "Don't have account? ",
                                size: 10,
                                color: AppColors.greyColor),
                            GestureDetector(
                              onTap: () {
                                viewModel.navigateToSignUpView();
                              },
                              child: CustomText.customSizedText(
                                  text: 'Signup',
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
