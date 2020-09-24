import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: camel_case_types
class recipe_view extends StatefulWidget {

  final String postUrl;
  recipe_view({this.postUrl});

  @override
  _recipe_viewState createState() => _recipe_viewState();
}

// ignore: camel_case_types
class _recipe_viewState extends State<recipe_view> {

  String finalUrl;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {

    if(widget.postUrl.contains("http://")){
      finalUrl = widget.postUrl.replaceAll("http://", "https://");
    }else {
      finalUrl = widget.postUrl;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: Platform.isIOS ? 60: 30, right: 24, left: 24, bottom: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueGrey, Colors.blueGrey[900]]
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          child: Icon(Icons.arrow_back,size: 20,color: Colors.white,)
                      ),
                    ),
                    Text(
                      "Recipe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Saver",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                  initialUrl: finalUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController){
                    setState(() {
                      _controller.complete(webViewController);
                    });
                  },
                ),
            )
            ],
          ),
        ),
    );
  }
}
