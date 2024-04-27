import 'dart:developer';

import 'package:bab_alomda_assessment/core/exports/exports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String url;

  const ArticleWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  double webProgress = 0;
  late final WebViewController controller;
  @override
  void initState() {
    log(widget.url);
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            if (webProgress < 1)
              SizedBox(
                height: 5,
                child: LinearProgressIndicator(
                  color: AppColors.appOrangeColor,
                  backgroundColor: AppColors.appBGColor,
                  value: webProgress,
                ),
              ),
            Expanded(
              child: WebViewWidget(
                controller: controller
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {
                        setState(() {
                          webProgress = progress / 100;
                        });
                      },
                      onPageStarted: (String url) {},
                      onPageFinished: (String url) {},
                      onWebResourceError: (WebResourceError error) {},
                      onNavigationRequest: (NavigationRequest request) {
                        return NavigationDecision.navigate;
                      },
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
