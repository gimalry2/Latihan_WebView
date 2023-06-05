import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class webViewPage extends StatefulWidget{
  const webViewPage({Key? key}) : super(key: key);
  
  @override

  State<webViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<webViewPage>{
  WebViewController? _controller;

  @override
  void initState(){
    super.initState();
    var javaScriptMode = JavaScriptMode.unrestricted;
    _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress){
          // Update loading bar.
        },
        onPageStarted: (String url){},
        onPageFinished: (String url){},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
     )
     ..loadRequest(Uri.parse('https://fst.uinsgd.ac.id/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Website FST UIN"),
          actions: const [],
        ),
        body: WebViewWidget(controller: _controller!));
  }
}