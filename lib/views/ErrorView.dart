import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/views/ctrl/ErrorViewControl.dart';

enum ErrorStatus {
  STATUS_HIDE,
  STATUS_RETRY,
  STATUS_FOOT_RETRY,
  STATUS_LOADING
}

class ErrorView extends StatefulWidget {
  ErrorViewControl control;

  ErrorView(this.control);

  _ErrorViewState createState() => _ErrorViewState(control);
}


class _ErrorViewState extends State<ErrorView> {
  ErrorViewControl control;

  _ErrorViewState(this.control);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Offstage(
        offstage: this.control.status == ErrorStatus.STATUS_HIDE,
        child: Stack(children: <Widget>[
          Offstage(
            //loading
            offstage:
                this.control.status == ErrorStatus.STATUS_LOADING ? false : true,
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Offstage(
              //error text

              offstage:
                  this.control.status == ErrorStatus.STATUS_RETRY ? false : true,
              child: GestureDetector(
                child: Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(control.text,
                        style: new TextStyle(
                            fontSize: 18, color: Color(0xff333333))),
                  ),
                ),
                  onTap:retry,
              ),
          ),
        ]));
  }

  void retry(){
    if(control.retry!=null){
      control.retry();
    }
  }
}
