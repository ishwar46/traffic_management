import 'package:flutter/material.dart';
import 'package:remittonepal/utils/app_colors.dart';
import 'package:remittonepal/utils/dimension.dart';
import 'package:remittonepal/utils/widgets/input_textfield.dart';
import 'package:remittonepal/utils/widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
              ),
              color: AppColors.primaryColor,
              iconSize: 26,
            ),
          ],
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: Dimension.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                child: RichText(
                    text: TextSpan(
                        text: "Welcome\nto",
                        style: textTheme.displaySmall!
                            .copyWith(color: AppColors.textBlack, fontSize: 30),
                        children: [
                      TextSpan(
                          text: " Smart",
                          style: textTheme.displaySmall!.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor)),
                      TextSpan(
                          text: " Traffic",
                          style: textTheme.displaySmall!.copyWith(
                              fontSize: 30,
                              color: AppColors.red,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " Nepal",
                          style: textTheme.displaySmall!.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor)),
                    ])),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Log into your account",
                style:
                    textTheme.labelLarge!.copyWith(color: AppColors.blackLight),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                label: "Phone Number",
                hintText: "",
              ),
              const CustomTextField(
                label: "Password",
                hintText: "",
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: textTheme.titleSmall!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomRoundedButtom(
                title: "Sign In",
                onPressed: () {},
                verticalPadding: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text("Or"),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 57,
                      width: 57,
                      child: Image.asset("assets/img/face.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Login with Face ID",
                      style: textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Don’t have an account? ",
                            style: textTheme.labelLarge!
                                .copyWith(color: AppColors.textLight),
                            children: [
                          TextSpan(
                              text: "Register ",
                              style: textTheme.titleSmall!.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: "here.",
                            style: textTheme.labelLarge!
                                .copyWith(color: AppColors.textLight),
                          ),
                        ]))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
