import 'package:ny_times_app/src/core/styles/app_colors.dart';
import 'package:ny_times_app/src/core/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ToastTypeEnum { info, success, error }

class AppSnackBar {
  static late Flushbar snackBar;

  // static GlobalKey<ScaffoldState> scaffoldKey;

  static init() {
    snackBar = Flushbar();
  }

  static void show(
      BuildContext context, String text, ToastTypeEnum type) async {
    Color backgroundColor;
    switch (type) {
      case ToastTypeEnum.success:
        backgroundColor = AppColors.green;
        break;
      case ToastTypeEnum.error:
        backgroundColor = AppColors.red;
        break;
      default:
        backgroundColor = AppColors.darkGray;
    }

    snackBar.dismiss();
    snackBar = Flushbar(
      duration: const Duration(seconds: 4),
      message: text,
      messageColor: AppColors.white,
      backgroundColor: backgroundColor,
      borderRadius: BorderRadius.circular(15),
      icon: type == ToastTypeEnum.success
          ? SvgPicture.asset(
              Helper.getSvgPath("check.svg"),
              height: 15.h,
              width: 15.h,
            )
          : SvgPicture.asset(
              Helper.getSvgPath("alert.svg"),
              height: 15.h,
              width: 15.h,
            ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 30.h,
      ),
    );
    snackBar.show(context);
  }

  static void showWithUndo(String text, ToastTypeEnum type,
      Function undoCallback, Function deleteCallback, BuildContext context) {
    Color backgroundColor = const Color(0xFFF05454);
    late Flushbar flush;
    flush = Flushbar(
      duration: const Duration(seconds: 4),
      messageText: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.h,
        ),
      ),
      backgroundColor: backgroundColor,
      flushbarPosition: FlushbarPosition.BOTTOM,
      onStatusChanged: (status) {
        if (FlushbarStatus.DISMISSED == status) {}
      },
      mainButton: TextButton(
        child: Text(
          "Back",
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.normal,
              ),
        ),
        onPressed: () {
          flush.dismiss();
          undoCallback();
        },
      ),
    );
    flush.show(context).then((value) {
      if (!flush.isDismissed()) {
        deleteCallback();
      }
    });
  }
}
