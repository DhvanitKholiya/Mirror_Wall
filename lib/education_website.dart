import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EduWebsite extends StatefulWidget {
  const EduWebsite({Key? key}) : super(key: key);

  @override
  State<EduWebsite> createState() => _EduWebsiteState();
}

class _EduWebsiteState extends State<EduWebsite> {

  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {

    String data = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(data)),
        onWebViewCreated: (val){
          inAppWebViewController = val;
        },
      ),
    );
  }
}
