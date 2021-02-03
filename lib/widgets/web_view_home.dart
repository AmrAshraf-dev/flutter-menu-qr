import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewHome extends StatefulWidget {
  @override
  WebViewHomeState createState() => WebViewHomeState();
}

class WebViewHomeState extends State<WebViewHome> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        // initialUrl: 'https://zebra-qr.com/new/restaurant/register',
        initialUrl: 'https://zebra-qr.com/items',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
