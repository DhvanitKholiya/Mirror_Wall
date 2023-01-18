import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io';

class Sony extends StatefulWidget {
  const Sony({Key? key}) : super(key: key);

  @override
  State<Sony> createState() => _SonyState();
}

class _SonyState extends State<Sony> {
  InAppWebViewController? inAppWebViewController;
  late PullToRefreshController pullToRefreshController;

  @override
  void initState() {
    pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        if (Platform.isAndroid) {
          await inAppWebViewController!.reload();
        } else if (Platform.isIOS) {
          await inAppWebViewController!.loadUrl(
              urlRequest:
              URLRequest(url: await inAppWebViewController!.getUrl()));
        }
      },
      options: PullToRefreshOptions(color: Colors.transparent),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async{
            await inAppWebViewController!.loadUrl(urlRequest: URLRequest(url: Uri.parse("https://www.sonyliv.com/")));
          }, icon: const Icon(Icons.home)),
          IconButton(onPressed: () async{
            if(await inAppWebViewController!.canGoBack()) {
              inAppWebViewController!.goBack();
            }
          }, icon: const Icon(Icons.arrow_back_ios_rounded)),
        ],
        title: const Text(
          "Welcome to Sony LIV",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Color(0xff203354),
        centerTitle: true,
      ),
      body: InAppWebView(
        pullToRefreshController: pullToRefreshController,
        onLoadStop: (controller, url) async {},
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://www.sonyliv.com/"),
        ),
        onWebViewCreated: (val) async {
          setState(() {
            inAppWebViewController = val;
          });
        },
      ),
    );
  }
}
