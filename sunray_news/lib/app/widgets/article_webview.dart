import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sunray_news/app/theme/theme_constants.dart';

class ArticleWebView extends StatefulWidget {
  ArticleWebView({super.key});
  static String route = '/article_web_view';

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  String urlToContent = '';
  String source = '';
  InAppWebViewController? webViewController;
  double progress = 0;

  PullToRefreshController? pullToRefreshController;
  GlobalKey webViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    //
    webViewController?.loadUrl(
        urlRequest: URLRequest(url: Uri.parse(urlToContent)));

    //
    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            options: PullToRefreshOptions(
              color: lightTheme.colorScheme.secondary,
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

    //
  }

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments;
    urlToContent = (arg as Map)['url'];
    source = (arg as Map)['source'];

    log('arg val ${ModalRoute.of(context)!.settings.arguments} source ${(arg as Map)['source']} and ${(arg as Map)['source'].runtimeType}');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(27, 69, 113, 1),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey.shade400,
              )),
          title: Text(
            source.toString(),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  webViewController?.reload();
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.grey.shade400,
                ))
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(2),
              child: progress < 1.0
                  ? SizedBox(
                      child: LinearProgressIndicator(
                        value: progress,
                        color: lightTheme.colorScheme.secondary,
                      ),
                    )
                  : SizedBox()),
        ),
        // backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: InAppWebView(
                  key: webViewKey,
                  initialUrlRequest: URLRequest(url: Uri.parse(urlToContent)),
                  pullToRefreshController: pullToRefreshController,
                  // initialOptions: options,
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    setState(() {
                      urlToContent = url.toString();
                    });
                  },
                  onProgressChanged: (con, progress) {
                    if (progress == 100) {
                      pullToRefreshController?.endRefreshing();
                    }
                    setState(() {
                      this.progress = progress / 100;
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
          ],
        ),
      ),
    );
  }
}

/** COOKIES STUFFS
 * 
 * 
 * // get the CookieManager instance
CookieManager cookieManager = CookieManager.instance();

// set the expiration date for the cookie in milliseconds
final expiresDate = DateTime.now().add(Duration(days: 3)).millisecondsSinceEpoch;
final url = WebUri("https://flutter.dev/");

// set the cookie
await cookieManager.setCookie(
  url: url,
  name: "myCookie",
  value: "myValue",
  expiresDate: expiresDate,
  isSecure: true,
);

// get cookies
List<Cookie> cookies = await cookieManager.getCookies(url: url);

// get a cookie
Cookie? cookie = await cookieManager.getCookie(url: url, name: "myCookie");

// delete a cookie
await cookieManager.deleteCookie(url: url, name: "myCookie");

// delete cookies
await cookieManager.deleteCookies(url: url, domain: ".flutter.dev");
 * 
 */


/**
 * Container(
              decoration:
                  BoxDecoration(color: lightTheme.colorScheme.secondary),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
              ),
            )
 */

/**
 * progress < 1.0
                ? SizedBox(
                    height: 3,
                    child: LinearProgressIndicator(
                      value: progress,
                      color: lightTheme.colorScheme.secondary,
                    ),
                  )
                : SizedBox(),
 */