import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_app/src/core/styles/app_colors.dart';
import 'package:ny_times_app/src/core/util/helper.dart';

class ArticleCardWidget extends StatefulWidget {
  const ArticleCardWidget({Key? key}) : super(key: key);

  @override
  State<ArticleCardWidget> createState() => _ArticleCardWidgetState();
}

class _ArticleCardWidgetState extends State<ArticleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle Avatar
          CircleAvatar(
            backgroundColor: AppColors.gray,
          ),

          // Space
          SizedBox(
            width: Helper.getVerticalSpace(),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Text(
                  "SupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupportedSupported",
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),

                // Space
                SizedBox(
                  height: Helper.getVerticalSpace() * 2,
                ),

                Text(
                  "sdlkajsldkj kajsdkljaslkdjaklsd",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.darkGray),
                ),

                // Space
                SizedBox(
                  height: 5.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 20,
                      color: AppColors.gray,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "01/01/2023",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.darkGray),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Space
          SizedBox(
            width: Helper.getVerticalSpace(),
          ),

          // Arrow icon
          IconButton(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
