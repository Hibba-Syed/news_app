import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailView extends StatefulWidget {
  String newsUrl;

   DetailView({super.key,required this.newsUrl}) ;

  @override
  State<DetailView> createState() => _DetailViewState();

}
class _DetailViewState extends State<DetailView> {
  @override
  void initState() {

    super.initState();
    setState(() {
      widget.newsUrl = widget.newsUrl.contains("http:")
          ? widget.newsUrl.replaceAll("http:", "https:")
          : widget.newsUrl;
    });
  }
  final Completer<WebViewController> controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: widget.newsUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            setState(() {
              controller.complete(webViewController);
            });

          },

        ),
      ),
    );
  }
}
