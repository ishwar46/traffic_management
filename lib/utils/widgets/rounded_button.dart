import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomRoundedButtom extends StatefulWidget {
  CustomRoundedButtom({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.color,
    this.horizontalPadding = 12,
    this.verticalPadding = 10,
    this.fontSize = 16,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w700,
    this.bordercolor,
    this.horizontalMargin = 0,
    this.icon,
    this.preicon,
    this.borderRadius = 4,
    this.padding,
  }) : super(key: key);
  final String title;
  final Function()? onPressed;
  double width;
  final bool isLoading;
  final Color? color;
  final EdgeInsets? padding;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final Color textColor;
  final double borderRadius;
  final Color? bordercolor;
  final FontWeight fontWeight;
  final double horizontalMargin;
  final IconData? icon;
  final IconData? preicon;

  @override
  CustomRoundedButtomState createState() => CustomRoundedButtomState();
}

class CustomRoundedButtomState extends State<CustomRoundedButtom> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: widget.width,
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      child: Material(
        color: (widget.color ?? AppColors.primaryColor),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: Container(
            padding: widget.padding ??
                EdgeInsets.symmetric(
                  vertical: widget.verticalPadding,
                  horizontal: widget.horizontalPadding,
                ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: widget.bordercolor ?? AppColors.primaryColor,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.preicon != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        widget.preicon,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  Text(
                    widget.title,
                    style: _theme.textTheme.displaySmall!.copyWith(
                      fontWeight: widget.fontWeight,
                      color: widget.textColor,
                      fontSize: widget.fontSize,
                    ),
                  ),
                  if (widget.icon != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        widget.icon,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeOut,
                    child: widget.isLoading
                        ? Container(
                            height: 14,
                            width: 14,
                            margin: const EdgeInsets.only(left: 8),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
