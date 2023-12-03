import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_app/src/shared/presentation/widgets/cached_image_widget.dart';
import 'package:ny_times_app/src/core/router/app_route_enum.dart';
import 'package:ny_times_app/src/core/styles/app_colors.dart';
import 'package:ny_times_app/src/core/utils/constant/app_constants.dart';
import 'package:ny_times_app/src/core/helper/helper.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';

class ArticleCardWidget extends StatefulWidget {
  final ArticleModel nyTimesModel;

  const ArticleCardWidget({Key? key, required this.nyTimesModel})
      : super(key: key);

  @override
  State<ArticleCardWidget> createState() => _ArticleCardWidgetState();
}

class _ArticleCardWidgetState extends State<ArticleCardWidget> {
  String? smallImageUrl;
  String? bigImageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Small image for list item
    // Check if somethings happened and do not return media
    // If everything seems to be in order we will display the image
    // else display solid circle instead
    if (widget.nyTimesModel.media != null &&
        widget.nyTimesModel.media!.isNotEmpty) {
      if (widget.nyTimesModel.media!.first.mediaMetadata != null &&
          widget.nyTimesModel.media!.first.mediaMetadata!.isNotEmpty) {
        smallImageUrl =
            widget.nyTimesModel.media!.first.mediaMetadata!.first.url;
      }
    }

    // Big image for view and zoom it
    // Check if somethings happened and do not return media
    // If everything seems to be in order we will display the image
    // else display solid circle instead
    if (widget.nyTimesModel.media != null &&
        widget.nyTimesModel.media!.isNotEmpty) {
      if (widget.nyTimesModel.media!.last.mediaMetadata != null &&
          widget.nyTimesModel.media!.last.mediaMetadata!.isNotEmpty) {
        bigImageUrl = widget.nyTimesModel.media!.last.mediaMetadata!.last.url;
      }
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circle Avatar
          if (smallImageUrl != null) ...{
            Hero(
              tag: bigImageUrl!,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteEnum.photoViewPage.name,
                    arguments: {
                      "path": bigImageUrl!,
                      "fromNet": true,
                    },
                  );
                },
                child: CachedImageWidget(
                  imageUrl: smallImageUrl!,
                  radius: 200,
                  width: 70.sp,
                ),
              ),
            )
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
                AppRouteEnum.articleDetailsPage.name,
                arguments: widget.nyTimesModel,
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
