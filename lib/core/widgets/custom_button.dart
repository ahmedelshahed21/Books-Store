import 'package:books_store/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({super.key, required this.child, this.onPressed, this.borderRadius, this.backgroundColor, this.textColor, this.fontSize});
  final String child;
  final void Function()? onPressed;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft:  Radius.circular(12),
          )
        )
      ),
      onPressed: onPressed,
      child: Text(child,
        style: Styles.textStyle18.copyWith(
          color: textColor ?? Colors.black ,
          fontWeight: FontWeight.w900,
          fontSize: fontSize
        ),
      ),
    );
  }
}