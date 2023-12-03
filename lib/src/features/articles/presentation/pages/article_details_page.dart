import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_app/src/shared/presentation/pages/background_page.dart';
import 'package:ny_times_app/src/shared/presentation/widgets/arrow_back_button_widget.dart';
import 'package:ny_times_app/src/shared/presentation/widgets/cached_image_widget.dart';
import 'package:ny_times_app/src/shared/presentation/widgets/custom_app_bar_widget.dart';
import 'package:ny_times_app/src/core/router/app_route_enum.dart';
import 'package:ny_times_app/src/core/styles/app_colors.dart';
import 'package:ny_times_app/src/core/translations/l10n.dart';
import 'package:ny_times_app/src/core/utils/constant/app_constants.dart';
import 'package:ny_times_app/src/core/helper/helper.dart';
import 'package:ny_times_app/src/features/articles/domain/models/article_model.dart';

class ArticleDetailsPage extends StatefulWidget {
  final ArticleModel model;

  const ArticleDetailsPage({Key? key, required this.model})
      : super(key: key);

  @override
  State<ArticleDetailsPage> createState() => _NyTimesArticlesPageState();
}

class _NyTimesArticlesPageState extends State<ArticleDetailsPage> {
  String? imageUrl;
  String? imageCaption;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Big image for view and zoom it
    // Check if somethings happened and do not return media
    // If everything seems to be in order we will display the image
    // else display solid circle instead
    if (widget.model.media != null && widget.model.media!.isNotEmpty) {
      if (widget.model.media!.last.mediaMetadata != null &&
          widget.model.media!.last.mediaMetadata!.isNotEmpty) {
        imageUrl = widget.model.media!.last.mediaMetadata!.last.url;
        imageCaption = widget.model.media!.last.caption;
      }
    }
    return BackgroundPage(
      withDrawer: true,
      child: Column(
        children: [
          // Custom App Bar
          CustomAppBarWidget(
            title: Text(
              "${S.of(context).article_details} - ${widget.model.section ?? defaultStr}",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            leading: ArrowBackButtonWidget(),
          ),

          // Details
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title, abstract attribute and published date
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: Helper.getHorizontalSpace(),
                          ),

                          // Title
                          Text(
                            widget.model.title ?? defaultStr,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                          ),

                          // Space
                          SizedBox(
                            height: Helper.getHorizontalSpace() / 2,
                          ),

                          // Title
                          Text(
                            widget.model.abstract ?? defaultStr,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),

                          // Space
                          SizedBox(
                            height: Helper.getHorizontalSpace() * 2,
                          ),

                          // Caption
                          Text(
                            widget.model.byline ?? defaultStr,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                            textAlign: TextAlign.start,
                          ),

                          // Space
                          SizedBox(
                            height: 3.h,
                          ),

                          // Published Date
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                  widget.model.publishedDate ?? defaultStr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: AppColors.darkGray),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),

                          // Space
                          SizedBox(
                            height: Helper.getHorizontalSpace(),
                          ),
                        ],
                      )),

                  // Image
                  GestureDetector(
                    onTap: () {
                      if (imageUrl != null) {
                        // display image if it is available
                        Navigator.pushNamed(
                          context,
                          AppRouteEnum.photoViewPage.name,
                          arguments: {
                            "path": imageUrl!,
                            "fromNet": true,
                          },
                        );
                      }
                    },
                    child: Stack(
                      children: [
                        Hero(
                          tag: imageUrl ?? defaultStr,
                          child: CachedImageWidget(
                            imageUrl: imageUrl ?? defaultStr,
                            height: ScreenUtil().screenHeight * 0.4,
                            width: ScreenUtil().screenWidth,
                          ),
                        ),

                        // Shadow
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  AppColors.primaryColor.withOpacity(0.7),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0.7, 0.9],
                              ),
                            ),
                          ),
                        ),

                        // Caption
                        // Display Caption when image not valid
                        if (imageUrl == null)
                          Positioned(
                            bottom: 10.h,
                            left: 10.w,
                            right: 10.w,
                            child: Text(
                              imageCaption ?? defaultStr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Adx keywords attribute
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Helper.getHorizontalSpace(),
                          ),

                          // Adx keywords
                          Text(
                            widget.model.adxKeywords ?? defaultStr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(wordSpacing: 3, letterSpacing: 1),
                          ),

                          // Space
                          SizedBox(
                            height: Helper.getHorizontalSpace() * 3,
                          ),

                          // See more
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRouteEnum.weViewPage.name,
                                arguments: widget.model.url,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).see_more,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        wordSpacing: 3,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                )
                              ],
                            ),
                          ),

                          // Space
                          SizedBox(
                            height: Helper.getHorizontalSpace(),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
