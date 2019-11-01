import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsFullStory extends StatelessWidget {
  final String _url;
  NewsFullStory(this._url);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body:  WebView(
          initialUrl: _url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}