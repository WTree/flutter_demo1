import 'package:flutter/material.dart';
import 'package:flutter_app1/natives/NativeToastUtils.dart';
import 'package:flutter_app1/pages/CamerPage.dart';
import 'package:flutter_app1/pages/NewWebPages.dart';
import 'package:flutter_app1/pages/QrCodePger.dart';
import 'package:flutter_app1/views/dialogs/LoadingDialog.dart';

class ToggleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'toggle App',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new ToggleAppPage(),
    );
  }
}

class ToggleAppPage extends StatefulWidget {
  ToggleAppPage({Key key}) : super(key: key);

//  @override
//  _MyHomePageState createState() => _MyHomePageState();

  @override
  _ToggleAppPageState createState() => new _ToggleAppPageState();
}

showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new LoadingDialog(
          text: " 正在加载1...",
        );
      });
}

//显示底部弹窗
showBottomSheetMenu(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          color: Colors.transparent,
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10)),
            ),
            child: new Center(child: new Text("this is modal sheet")),
          ),
        );
      });
}

class _ToggleAppPageState extends State<ToggleAppPage> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text('Toggle One');
    } else {
      return new MaterialButton(
          onPressed: () {}, child: new Text('Toggle Two'));
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
          new SizedBox(
            width: 120,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                  border: new Border.all(color: Color(0xffff0000), width: 0.5),
                  color: Color(0xff939393),
                  borderRadius: new BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x99ffff00),
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                    BoxShadow(
                        color: Color(0x9900ff00), offset: Offset(1.0, 1.9)),
                    BoxShadow(color: Color(0xff0000ff))
                  ]),
            ),
          ),
          new SizedBox(
            width: 300,
            height: 45,
            child: Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xffffff00), width: 0.5),
                  gradient: RadialGradient(
                      colors: [Color(0xffffff00), Color(0xff00ffff)],
                      radius: 1,
                      tileMode: TileMode.mirror)),
            ),
          ),
          new SizedBox(
            width: 300,
            height: 45,
            child: Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xffffff00), width: 0.5),
                  gradient: SweepGradient(
                      colors: [Color(0xffffff00), Color(0xff00ffff)],
                      startAngle: 0,endAngle: 1*3.14)),
            ),
          ),
          new SizedBox(
            width: 300,
            height: 45,
            child: Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xffffff00), width: 0.5),
                  gradient: LinearGradient(
                      colors: [Color(0xffffff00), Color(0xff00ffff)],
                      )),
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
//          onPressed: _toggle,
        onPressed: () {
//          showLoading(context);
//          showBottomSheetMenu(context);
//          NativeToastUtils.showToast(message: "测试toast");
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CamperPage(),
              ));

        },
        tooltip: 'update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}
