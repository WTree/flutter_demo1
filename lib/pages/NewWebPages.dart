
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
class NewWebPages extends StatelessWidget{


  String title;
  String url;


  NewWebPages(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CupertinoApp(

      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(

          middle: Text(this.title),

        ),


        child:
        WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),


    );
  }

}