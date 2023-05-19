import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sunray_news/app/theme/theme_constants.dart';
import 'package:sunray_news/app/widgets/loading_indicator.dart';

class ArticleWebView extends StatefulWidget {
  ArticleWebView({super.key});
  static String route = '/article_web_view';

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  String urlToContent = '';

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;
  GlobalKey webViewKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    //
    webViewController?.loadUrl(
        urlRequest: URLRequest(url: Uri.parse(urlToContent)));
    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            options: PullToRefreshOptions(
              color: Colors.red,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    urlToContent = ModalRoute.of(context)!.settings.arguments.toString();
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(url: Uri.parse(urlToContent)),
                pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  setState(() {
                    urlToContent = url.toString();
                  });
                },
                onLoadStop: (controller, url) async {
                  pullToRefreshController?.endRefreshing();
                  setState(() {
                    urlToContent = url.toString();
                  });
                },
                onLoadError: (controller, url, code, message) {
                  pullToRefreshController?.endRefreshing();
                },
              )),
          Container(
            decoration: BoxDecoration(color: lightTheme.colorScheme.secondary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.grey.shade400,
                      )),
                  IconButton(
                      onPressed: () {
                        PullToRefreshController(
                            onRefresh: () => webViewController?.reload());
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.grey.shade400,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
