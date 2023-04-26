import 'package:ny_times_app/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:ny_times_app/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralDialogWidget extends StatefulWidget {
  final String? icon;
  final String? title;
  final String content;
  final TextStyle? contentStyle;
  final TextAlign? contentAlign;
  final Function? cancelCallback;
  final Function? callback;
  final EdgeInsets contentPadding;
  final String? primaryButtonName;
  final String? secondaryButtonName;
  final double? height;
  final bool isVerticalButton;

  const GeneralDialogWidget(
      {Key? key,
      this.icon,
      this.title,
      this.height,
      this.isVerticalButton = false,
      required this.content,
      this.contentStyle,
      this.contentAlign,
      this.cancelCallback,
      this.callback,
      this.primaryButtonName,
      this.secondaryButtonName,
      this.contentPadding = const EdgeInsets.all(15)})
      : super(key: key);

  @override
  State<GeneralDialogWidget> createState() => _GeneralDialogWidgetState();
}

class _GeneralDialogWidgetState extends State<GeneralDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).dialogBackgroundColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: widget.contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // General icon
                  if (widget.icon != null) ...[
                    Image.asset(
                      widget.icon!,
                      width: 80.h,
                      height: 80.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                  // General title
                  if (widget.title != null) ...[
                    Text(
                      widget.title!,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                  SizedBox(
                    height: widget.height,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.content,
                        textAlign: widget.contentAlign ?? TextAlign.center,
                        style: widget.contentStyle ??
                            Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  // Actions
                  if (widget.isVerticalButton) ...{
                    Column(
                      children: [
                        if (widget.primaryButtonName != null) ...[
                          Flexible(
                            child: ButtonWidget(
                              horizontalPadding: 20.w,
                              text: widget.primaryButtonName!,
                              onPressed: () {
                                widget.callback?.call();
                              },
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 10.h,
                        ),
                        if (widget.secondaryButtonName != null) ...[
                          Flexible(
                            child: ButtonWidget(
                              horizontalPadding: 20.w,
                              text: widget.secondaryButtonName!,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.gray,
                                  ),
                              borderColor: AppColors.gray,
                              onPressed: () {
                                widget.cancelCallback?.call();
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  } else ...{
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.secondaryButtonName != null) ...[
                          Flexible(
                            child: ButtonWidget(
                              horizontalPadding: 20.w,
                              text: widget.secondaryButtonName!,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.gray,
                                  ),
                              borderColor: AppColors.gray,
                              onPressed: () {
                                widget.cancelCallback?.call();
                              },
                              backgroundColor: AppColors.white,
                            ),
                          ),
                        ],
                        SizedBox(
                          width: 10.w,
                        ),
                        if (widget.primaryButtonName != null) ...[
                          Flexible(
                            child: ButtonWidget(
                              horizontalPadding: 20.w,
                              text: widget.primaryButtonName!,
                              onPressed: () {
                                widget.callback?.call();
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  }
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
