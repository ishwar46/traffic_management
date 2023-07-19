// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:trafficnepal/presentation/home/ui/home_page.dart';
// import 'package:trafficnepal/presentation/register/register_page.dart';
// import '../../utils/app_colors.dart';
// import '../../utils/widgets/input_textfield.dart';
// import '../components/custom_button.dart';
// import '../components/page_header.dart';
// import '../components/page_heading.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   //
//   final _loginFormKey = GlobalKey<FormState>();
//   String? versionName;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: const Color(0xffEEF1F3),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const PageHeader(),
//             Expanded(
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(
//                     top: Radius.circular(20),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Form(
//                     key: _loginFormKey,
//                     child: Column(
//                       children: [
//                         const PageHeading(
//                           title: 'Smart Traffic Nepal',
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           'Login',
//                           style: TextStyle(
//                             color: AppColors.primaryColor,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         CustomInputField(
//                             labelText: 'Email',
//                             hintText: 'Your email id',
//                             validator: (textValue) {
//                               if (textValue == null || textValue.isEmpty) {
//                                 return 'Email is required!';
//                               }
//                               if (!EmailValidator.validate(textValue)) {
//                                 return 'Please enter a valid email';
//                               }
//                               return null;
//                             }),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         CustomInputField(
//                           labelText: 'Password',
//                           hintText: 'Your password',
//                           obscureText: true,
//                           suffixIcon: true,
//                           validator: (textValue) {
//                             if (textValue == null || textValue.isEmpty) {
//                               return 'Password is required!';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         Container(
//                           width: size.width * 0.80,
//                           alignment: Alignment.centerRight,
//                           child: GestureDetector(
//                             // onTap: () => {
//                             //   Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPasswordPage()))
//                             // },
//                             child: const Text(
//                               'Forget password?',
//                               style: TextStyle(
//                                 color: Color(0xff939393),
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         CustomFormButton(
//                           innerText: 'Login',
//                           onPressed: _handleLoginUser,
//                         ),
//                         const SizedBox(
//                           height: 18,
//                         ),
//                         SizedBox(
//                           width: size.width * 0.8,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 'Don\'t have an account ? ',
//                                 style: TextStyle(
//                                     fontSize: 13,
//                                     color: Color(0xff939393),
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               GestureDetector(
//                                 onTap: () => {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => RegisterPage()))
//                                 },
//                                 child: const Text(
//                                   'Sign-up',
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       color: Color(0xff748288),
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Column(
//                 children: [
//                   Text(
//                     "© ${DateTime.now().year} Smart Traffic Nepal",
//                     style: const TextStyle(
//                         color: AppColors.primaryColor, fontSize: 12),
//                   ),
//                   Text(
//                     "Version $versionName",
//                     style: const TextStyle(
//                         color: AppColors.primaryColor, fontSize: 10),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _handleLoginUser() {
//     // login user
//     if (_loginFormKey.currentState!.validate()) {
//       //easyLoading
//       EasyLoading.show(status: 'loading...');
//       Future.delayed(const Duration(seconds: 2), () {
//         EasyLoading.dismiss();
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) =>  new Dashboard()));
//       });
//     }
//   }
// }
