import 'package:ny_times_app/src/core/common_feature/presentation/pages/app_drawer_page.dart';
import 'package:ny_times_app/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../util/helper.dart';

class BackgroundPage extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool withDrawer;
  final Function()? drawerCallBack;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool topSafeArea;
  final bool bottomSafeArea;

  const BackgroundPage({
    required this.child,
    this.backgroundColor,
    this.withDrawer = false,
    this.drawerCallBack,
    this.scaffoldKey,
    Key? key,
    this.topSafeArea = true,
    this.bottomSafeArea = true,
  }) : super(key: key);

  @override
  State<BackgroundPage> createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  bool isCallFromDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      backgroundColor: widget.backgroundColor == null
          ? Colors.transparent
          : Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      onDrawerChanged: (isOpened) {
        if (!isOpened) {
          if (!isCallFromDrawer) {
            if (widget.drawerCallBack != null) {
              widget.drawerCallBack!();
            }
          }
          isCallFromDrawer = false;
        }
      },
      drawer: widget.withDrawer
          ? Drawer(
              width: 0.7.w,
              child: AppDrawerPage(),
            )
          : null,
      body: SafeArea(
        bottom: widget.bottomSafeArea,
        top: widget.topSafeArea,
        child: widget.child,
      ),
    );
  }
}
