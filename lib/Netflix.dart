import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Netflix extends StatefulWidget {
  const Netflix({Key? key}) : super(key: key);

  @override
  State<Netflix> createState() => _NetflixState();
}

class _NetflixState extends State<Netflix> {

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
            await inAppWebViewController!.loadUrl(urlRequest: URLRequest(url: Uri.parse("https://www.netflix.com/in/")));
          }, icon: Icon(Icons.home)),
          IconButton(onPressed: () async{
            if(await inAppWebViewController!.canGoBack()) {
              inAppWebViewController!.goBack();
            }
          }, icon: Icon(Icons.arrow_back_ios_rounded)),
        ],
        title: const Text(
          "Welcome to Netflix",
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
        onLoadStop: (controller, url) async {
          await pullToRefreshController.endRefreshing();
        },
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://www.netflix.com/in/"),
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
