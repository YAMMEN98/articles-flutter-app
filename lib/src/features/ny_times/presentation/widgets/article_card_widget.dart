import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_app/src/core/common_feature/presentation/widgets/cached_image_widget.dart';
import 'package:ny_times_app/src/core/styles/app_colors.dart';
import 'package:ny_times_app/src/core/util/constant/app_constants.dart';
import 'package:ny_times_app/src/core/util/helper.dart';
import 'package:ny_times_app/src/features/ny_times/data/entities/ny_times_model.dart';

class ArticleCardWidget extends StatefulWidget {
  final NyTimesModel nyTimesModel;

  const ArticleCardWidget({Key? key, required this.nyTimesModel})
      : super(key: key);

  @override
  State<ArticleCardWidget> createState() => _ArticleCardWidgetState();
}

class _ArticleCardWidgetState extends State<ArticleCardWidget> {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Check if somethings happened and do not return media
    // If everything seems to be in order we will display the image
    // else display solid circle instead
    if (widget.nyTimesModel.media != null &&
        widget.nyTimesModel.media!.isNotEmpty) {
      if (widget.nyTimesModel.media!.first.mediaMetadata != null &&
          widget.nyTimesModel.media!.first.mediaMetadata!.isNotEmpty) {
        imageUrl = widget.nyTimesModel.media!.first.mediaMetadata!.first.url;
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle Avatar
          if (imageUrl != null) ...{
            CachedImageWidget(
              imageUrl: imageUrl!,
              radius: 200,
              width: 70.sp,
            ),
          } else ...{
            SizedBox(
              width: 70.sp,
              child: CircleAvatar(
                backgroundColor: AppColors.gray,
                radius: 40,
              ),
            )
          },

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
                  widget.nyTimesModel.title ?? defaultStr,
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
                  widget.nyTimesModel.abstract ?? defaultStr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.darkGray),
                ),

                // Space
                SizedBox(
                  height: 5.h,
                ),

                // Published date
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 15,
                      color: AppColors.gray,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Flexible(
                      child: Text(
                        widget.nyTimesModel.publishedDate ?? defaultStr,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.darkGray),
                        textAlign: TextAlign.end,
                      ),
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
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/web_view_page",
                arguments: widget.nyTimesModel.url,
              );
            },
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
