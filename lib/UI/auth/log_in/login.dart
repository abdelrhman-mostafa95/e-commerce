import 'package:ecommerce_app_v2/UI/auth/log_in/cubit/log_in_view_model.dart';
import 'package:ecommerce_app_v2/UI/auth/log_in/cubit/login_states.dart';
import 'package:ecommerce_app_v2/UI/auth/sign_up/sign_up.dart';
import 'package:ecommerce_app_v2/UI/core/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../core/widget/dialog_utils.dart';

class Login extends StatelessWidget {
  static const String routeName = '/login';
  var formKeyLogin = GlobalKey<FormState>();
  LoginViewModel viewModel = getIt<LoginViewModel>();


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading ...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              negActionName: 'ok');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: 'Login Successfully',
              negActionName: 'ok');
        }
      },
  child: Scaffold(
        backgroundColor: Color(0xFF004182),
        body: SingleChildScrollView(
          child: Form(
            key: formKeyLogin,
            child: Center(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset('assets/images/route.jpg'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back To Route',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'email',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      CustomFormField(
                        hint: 'enter your email',
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
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
                        height: MediaQuery.of(context).size.height * 0.01,
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
                        isSecureText: false,
                        keyboardType: TextInputType.name,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            validatorTestField();
                            viewModel.login();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xFF003366),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignUp.routeName);
                          },
                          child: const Text(
                            "Don't have an account? Create Account",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
    ),
);
  }
  void validatorTestField(){
    if(formKeyLogin.currentState?.validate() == true){}
  }
}
