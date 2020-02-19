import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app1/views/dialogs/LoadingDialog.dart';

class ToggleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(

      title: 'toggle App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new ToggleAppPage(),

    );

  }

}


class ToggleAppPage extends StatefulWidget{
  ToggleAppPage({Key key}) : super(key:key);


//  @override
//  _MyHomePageState createState() => _MyHomePageState();


    @override
  _ToggleAppPageState createState() => new _ToggleAppPageState();




}

 showLoading(BuildContext context){

  showDialog(context: context,

    barrierDismissible: false,
    builder: (BuildContext context){
        return new LoadingDialog(text:" 正在加载...",);
    }
  );
}

class _ToggleAppPageState extends State<ToggleAppPage>{

  bool toggle =true;
  void _toggle(){
    setState(() {
      toggle =!toggle;
    });
  }

  _getToggleChild(){
    if(toggle){
      return new Text('Toggle One');
    }else {
      return new MaterialButton(onPressed: () {},child: new Text('Toggle Two'));
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Toggle App'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getToggleChild(),
          new Text("Row two"),
        ],

      ),
      
      floatingActionButton: new FloatingActionButton(
//          onPressed: _toggle,
          onPressed: (){
            showLoading(context);
          },
          tooltip: 'update Text',
          child: new Icon(Icons.update),
      ),
      
    );
  }


}
