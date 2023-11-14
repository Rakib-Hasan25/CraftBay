import 'package:ecommerce/presentation/state_holders/CartListcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key,required this.paymentUrl});


  final String paymentUrl;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController _webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)//which device can open
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {

  },
  onPageFinished: (String url) {
      if(url.endsWith("tran_type=success")){
        navigateBack();
      }
  },
  onWebResourceError: (WebResourceError error) {

  },
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse(widget.paymentUrl));
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Payment') ,
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
  void navigateBack(){
    Navigator.pop(context);
    Get.snackbar('Payment Successfull', 'your ordered is confirmed',
    snackPosition: SnackPosition.BOTTOM
    );
    Get.find<CartListController>().getCartList();
  }


}
