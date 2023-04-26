import 'package:flutter_svg/flutter_svg.dart';
import 'package:ny_times_app/src/core/styles/app_colors.dart';
import 'package:ny_times_app/src/core/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    Future.delayed(
      Duration(
        seconds: 1,
      ),
      () {
        Navigator.pushNamed(context, "/ny_times_page");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Image.asset(
            Helper.getImagePath("logo.png"),
            color: Helper.isDarkTheme()?AppColors.white:null,
            width: 300.w,
            height: 300.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
