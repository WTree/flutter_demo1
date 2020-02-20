import 'package:flutter/material.dart';

enum LoadingStatus {
  //正在加载中
  STATUS_LOADING,
  //数据加载完毕
  STATUS_COMPLETED,
  //空闲状态
  STATUS_IDEL
}

abstract class BaseListStateHelper<T extends StatefulWidget> extends State {
  bool _isExitNextPage = true;

  bool get isExitNextPage => _isExitNextPage;

  set isExitNextPage(bool value) {
    _isExitNextPage = value;
  }



  //这个方法必须再次调用
  Future<void>  onRefresh(){
    _isExitNextPage=true;
    return null;
  }
  void gotoNextPage(){

  }
  Widget getDefaultListFootWidget() {
    return new Offstage(
        offstage: !_isExitNextPage,
        child: new SizedBox(
            height: 48,
            child: new Align(
                alignment: Alignment.center,
                child: new SizedBox(
                    width: 40,
                    height: 40,
                    child: new CircularProgressIndicator()))));
  }


}
