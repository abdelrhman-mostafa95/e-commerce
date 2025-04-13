import 'package:flutter/material.dart';

import '../../core/widget/text_form_field.dart';

class SignUp extends StatelessWidget {
  static const String routeName = '/signup';
  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF004182),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                        'Full Name',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      CustomTextFormField(
                        hint: 'enter your full name',
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please, Enter your full name';
                          }
                          return null;
                        },
                        controller: fullName,
                        isSecureText: false,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
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
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      CustomTextFormField(
                        hint: 'enter your mobile number',
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please, Enter your mobile number';
                          }
                          return null;
                        },
                        controller: mobileNumber,
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
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      CustomTextFormField(
                        hint: 'enter your email address',
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please, Enter your email';
                          }
                          return null;
                        },
                        controller: email,
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
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      CustomTextFormField(
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
                        controller: password,
                        isSecureText: false,
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
                      SizedBox(height: 12,)
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
    if(formKey.currentState?.validate() == true){}
  }
}
