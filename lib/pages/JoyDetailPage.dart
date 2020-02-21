

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoyDetailPage extends StatelessWidget{


  String content;

  JoyDetailPage({this.content}){
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CupertinoApp(
      title: "笑话详情",
//      theme: CupertinoThemeData(barBackgroundColor: Color(0xffffffff),primaryColor: Colors.blue),
      color: Colors.red,
      home:  CupertinoPageScaffold(
        backgroundColor: Colors.yellow,
        resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          leading:GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Row(
              children: <Widget>[
                Icon(CupertinoIcons.left_chevron),
                Text('Back',style: TextStyle(color: CupertinoColors.activeBlue)),
              ],
            ),
          ) ,
          middle: Text("Cupertino App bar"),
          backgroundColor: Colors.blue,
        ),

        child: new JoyDetailPageFull(content: content,),
      )

      ,
    );
  }
}

class JoyDetailPageFull extends StatefulWidget{


  String content;

  JoyDetailPageFull({Key key,this.content}):super(key:key);

  _JoyDetailPageFullState createState()=> _JoyDetailPageFullState(content: content);
}

class _JoyDetailPageFullState extends State<JoyDetailPageFull>{

  String content;

  _JoyDetailPageFullState({this.content}){
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text(content);;
  }
}