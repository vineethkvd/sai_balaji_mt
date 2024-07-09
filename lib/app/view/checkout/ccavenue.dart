import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webCC extends StatefulWidget {
 String paymentLink;
 webCC( {Key? key, required this.paymentLink}) : super(key: key);

  @override
  State<webCC> createState() => _webCCState();
}

class _webCCState extends State<webCC> {
 // var payUrl = '';
  // var controller =;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(widget.paymentLink))),
    ));
  }
}
