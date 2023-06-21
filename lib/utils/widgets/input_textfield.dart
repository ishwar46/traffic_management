import 'package:flutter/material.dart';
import 'package:remittonepal/utils/app_colors.dart';

import '../dimension.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final double bottomPadding;
  final bool obscureText;
  final bool readOnly;

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.bottomPadding = 16,
    this.obscureText = false,
    this.readOnly = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Text(
              label,
              style: textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.textLight
                  //fontSize: 14,
                  ),
            ),
          if (label.isNotEmpty) const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: TextFormField(
              style: textTheme.labelLarge!
                  .copyWith(color: AppColors.textBlack, fontSize: 15),
              controller: controller,
              showCursor: false,
              maxLines: 1,
              obscureText: obscureText,
              readOnly: readOnly,
              validator: validator,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppColors.blackLight),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppColors.blackLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppColors.blackLight),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppColors.blackLight),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: AppColors.blackLight),
                ),
                fillColor: AppColors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                counterText: "",
                hintText: hintText,
                hintStyle: textTheme.titleLarge!.copyWith(
                  color: AppColors.textLight.withOpacity(0.2),
                  fontSize: 14,
                ),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
