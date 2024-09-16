import 'package:api_covid/model/hoaxes.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HoaxDetail extends StatefulWidget {
  const HoaxDetail({super.key, required this.hoaxItem});

  final Hoaxes hoaxItem;

  @override
  State<HoaxDetail> createState() => _HoaxDetailState();
}

class _HoaxDetailState extends State<HoaxDetail> {

  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {

    setState(() {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onHttpError: (HttpResponseError error) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse('${widget.hoaxItem.url}'));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.hoaxItem.title ?? 'Detail Hoax'}'),
      ),
      body: WebViewWidget(controller: _controller!,),
    );
  }
}
