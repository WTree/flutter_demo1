import 'package:flutter_app1/views/ErrorView.dart';
typedef onRetry = void Function();
class ErrorViewControl{

  onRetry retry;

  var _status=ErrorStatus.STATUS_LOADING;
  var _text="网络错误,请重试";

  get status => _status;

  set status(value) {
    _status = value;
  }

  get text => _text;

  set text(value) {
    _text = value;
  }

  ErrorViewControl({this.retry});


}