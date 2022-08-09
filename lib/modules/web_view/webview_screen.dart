import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

 final String url;
 WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0xFF1F948B),
            )
        ),
        title: Row(
          children: const [
            SizedBox(
              width: 70,
            ),
            Text(
              'News',
              style: TextStyle(
                  fontSize: 25
              ),
            ),
            Text(
              'App',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1F948B),
                  fontSize: 25
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }


}