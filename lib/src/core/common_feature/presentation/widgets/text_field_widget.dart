import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_app/src/core/styles/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Function(String? value)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autoValidateMode;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFieldWidget({
    Key? key,
    this.controller,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autoValidateMode,
    this.focusNode,
    this.inputFormatters,
    this.maxLines,
    this.contentPadding,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    double defaultBorderWidth = 1;
    double defaultBorderRadius = 15;
    Color defaultColor = AppColors.gray;
    TextStyle hintStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: AppColors.gray,
        );

    TextStyle textStyle = Theme.of(context).textTheme.bodyLarge!;
    return SizedBox(
      height: widget.height?.h,
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        autovalidateMode:
            widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        cursorColor: Theme.of(context).iconTheme.color,
        style: widget.textStyle ?? textStyle,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ?? hintStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? defaultBorderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? defaultColor,
              width: widget.borderWidth ?? defaultBorderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? defaultBorderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? defaultColor,
              width: widget.borderWidth ?? defaultBorderWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? defaultBorderRadius),
            borderSide: BorderSide(
              color: AppColors.red,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                widget.borderRadius ?? defaultBorderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? defaultColor,
              width: widget.borderWidth ?? defaultBorderWidth,
            ),
          ),
        ),
      ),
    );
  }
}
