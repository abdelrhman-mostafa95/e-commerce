import 'package:ecommerce_app_v2/UI/auth/sign_up/cubit/sign_in_states.dart';
import 'package:ecommerce_app_v2/UI/auth/sign_up/cubit/sign_up_view_model.dart';
import 'package:ecommerce_app_v2/UI/core/widget/dialog_utils.dart';
import 'package:ecommerce_app_v2/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widget/text_form_field.dart';

class SignUp extends StatelessWidget {
  static const String routeName = '/signup';
  var formKeyRegister = GlobalKey<FormState>();
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading ...');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              negActionName: 'ok');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Register Successfully',
              negActionName: 'ok');
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF004182),
          body: SingleChildScrollView(
            child: Form(
              key: formKeyRegister,
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/route.jpg'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Name',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            CustomFormField(
                              hint: 'enter your full name',
                              validator: (input) {
                                if (input == null || input.trim().isEmpty) {
                                  return 'Please, Enter your full name';
                                }
                                return null;
                              },
                              controller: viewModel.nameController,
                              isSecureText: false,
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            CustomFormField(
                              hint: 'enter your mobile number',
                              validator: (input) {
                                if (input == null || input.trim().isEmpty) {
                                  return 'Please, Enter your mobile number';
                                }
                                return null;
                              },
                              controller: viewModel.phoneController,
                              isSecureText: false,
                              keyboardType: TextInputType.name,
                            ),
                            Text(
                              'E-mail Address',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            CustomFormField(
                              hint: 'enter your email address',
                              validator: (input) {
                                if (input == null || input.trim().isEmpty) {
                                  return 'Please, Enter your email';
                                }
                                return null;
                              },
                              controller: viewModel.emailController,
                              isSecureText: false,
                              keyboardType: TextInputType.name,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            CustomFormField(
                              hint: 'enter your password',
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return 'Please, Enter your password';
                                }
                                if (input.length < 6) {
                                  return 'Password must be more than 6 char';
                                }
                                return null;
                              },
                              controller: viewModel.passwordController,
                              isSecureText: true,
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Confirm Password',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            CustomFormField(
                              hint: 'Confirm enter your password',
                              validator: (input) {
                                if (input == null || input.isEmpty) {
                                  return 'Please, Enter your password';
                                }
                                if (input.length < 6) {
                                  return 'Password must be more than 6 char';
                                }
                                return null;
                              },
                              controller: viewModel.rePasswordController,
                              isSecureText: true,
                              keyboardType: TextInputType.name,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  validatorTestField();
                                  viewModel.register();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Color(0xFF003366),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validatorTestField() {
    if (formKeyRegister.currentState?.validate() == true) {}
  }
}
