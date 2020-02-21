import 'package:flutter/material.dart';
import 'package:flutter_app1/views/ctrl/ErrorViewControl.dart';

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

  ScrollController _listscrollController = new ScrollController();

  ErrorViewControl _errorControl;
  var _loadStatus = LoadingStatus.STATUS_IDEL;
  BaseListStateHelper(){
    errorControl=ErrorViewControl(retry: retryLoad);
  }

  bool get isExitNextPage => _isExitNextPage;

  set isExitNextPage(bool value) {
    _isExitNextPage = value;
  }


  //listView 的滚动监听
  ScrollController get listscrollController => _listscrollController;

  int getOtherListSize(){
    return isExitNextPage?1:0;
  }

  get errorControl => _errorControl;

  set errorControl(value) {
    _errorControl = value;
  } //这个方法必须再次调用
  Future<void>  onRefresh(){
    _isExitNextPage=true;
    return null;
  }


  get loadStatus => _loadStatus;

  set loadStatus(value) {
    _loadStatus = value;
  }


  @override
  void initState() {
    super.initState();
    listensListScroll();
  }
  void gotoNextPage(){

  }
  void retryLoad(){

  }

  void listensListScroll(){
    _listscrollController.addListener(() {

      if (!isExitNextPage || _loadStatus == LoadingStatus.STATUS_LOADING) {
        return;
      }

      if (_listscrollController.position.pixels ==
          _listscrollController.position.maxScrollExtent) {
        gotoNextPage();
      }
    });

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
  @override
  void dispose() {
    super.dispose();
    _listscrollController.dispose();
  }

}
