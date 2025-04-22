import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/reusable_component/app_colors.dart';
import '../../core/reusable_component/app_styles.dart';
import '../../core/widget/custom_text_form_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  TextEditingController fullNameController =
  TextEditingController(text: "Abdelrahman Mostafa");
  TextEditingController emailController =
  TextEditingController(text: "abdo@gmail.com");
  TextEditingController passwordController =
  TextEditingController(text: "**********");
  TextEditingController mobileController =
  TextEditingController(text: "01158009696");
  TextEditingController addressController =
  TextEditingController(text: "Nasr City");
  bool fullNameReadOnly = true;
  bool emailReadOnly = true;
  bool passwordReadOnly = true;
  bool mobileReadOnly = true;
  bool addressReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Welcome, Abdelrahman",
                  style: AppStyles.medium18Header,
                ),
                IconButton(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
            AutoSizeText(
              "abdo@gmail.com",
              style: AppStyles.medium14LightPrimary,
            ),
            SizedBox(
              height: 40.h,
            ),
            AutoSizeText(
              "Your full name",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: fullNameReadOnly,
              keyboardType: TextInputType.name,
              controller: fullNameController,
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(
                  onPressed: () {
                    fullNameReadOnly = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your E-mail",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              readonly: emailReadOnly,
              isPassword: false,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(
                  onPressed: () {
                    emailReadOnly = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your password",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isObscureText: true,
              readonly: passwordReadOnly,
              isPassword: false,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(
                  onPressed: () {
                    passwordReadOnly = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your mobile number",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: mobileReadOnly,
              keyboardType: TextInputType.phone,
              controller: mobileController,
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(
                  onPressed: () {
                    mobileReadOnly = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
            AutoSizeText(
              "Your Address",
              style: AppStyles.medium18Header,
            ),
            CustomTextFormField(
              isPassword: false,
              readonly: addressReadOnly,
              keyboardType: TextInputType.streetAddress,
              controller: addressController,
              borderColor: AppColors.primary30Opacity,
              suffixIcon: IconButton(
                  onPressed: () {
                    addressReadOnly = false;
                    setState(() {});
                  },
                  icon: const Icon(Icons.edit)),
              textStyle: AppStyles.medium14PrimaryDark,
            ),
          ],
        ),
      ),
    );
  }
}
