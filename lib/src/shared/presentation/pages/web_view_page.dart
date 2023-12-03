import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_app/src/shared/presentation/pages/background_page.dart';
import 'package:ny_times_app/src/shared/presentation/widgets/app_loader.dart';
import 'package:ny_times_app/src/shared/presentation/widgets/arrow_back_button_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String link;

  const WebViewPage({Key? key, required this.link}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? webViewController;

  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController!.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {
          setState(() {
            isLoading = false;
          });
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    );
    webViewController!.loadRequest(Uri.parse(widget.link));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      bottomSafeArea: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pop(context);
              },
              child: ArrowBackButtonWidget(),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Expanded(
              child: isLoading
                  ? const Center(
                      child: AppLoader(),
                    )
                  : _buildWebView())
        ],
      ),
    );
  }

  bool isLoading = true;

  // Build widget if content is url
  Widget _buildWebView() {
    if (webViewController == null) {
      return const SizedBox();
    }
    return WebViewWidget(
      controller: webViewController!,
    );
  }

// Build widget if content is HTML
// Widget _buildWebHtml() {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
//     child: Html(
//       data: widget.content,
//       style: {
//         "body": Style(color: Theme.of(context).textTheme.bodyLarge!.color, fontSize: FontSize.medium),
//       },
//     ),
//   );
// }
}
