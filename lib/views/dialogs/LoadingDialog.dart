import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  String text;

  LoadingDialog({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: new Center(
        child: new SizedBox(
          width: 120,
          height: 120,
          child: new Container(
            decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ))),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Padding(
                    padding: const EdgeInsets.only(
                        top: 20,
                    ),

                    child: new Text(text,
                      style: new TextStyle(fontSize: 12),
                    ),


                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
