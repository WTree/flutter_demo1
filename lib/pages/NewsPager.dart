//http://jtbk.sinaapp.com/xiaoliao/andriod10/index.php?lastTime=1579491618&cid=joke

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/Utils/TimeUtils.dart';
import 'package:flutter_app1/http/HttpManger.dart';
import 'package:flutter_app1/member/Joy.dart';
import 'package:flutter_app1/pages/JoyDetailPage.dart';
import 'package:flutter_app1/views/ErrorView.dart';
import 'package:flutter_app1/views/list/BaseListStateHelper.dart';

class NewsPager extends StatefulWidget {
  NewsPager({Key key}) : super(key: key);

  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends BaseListStateHelper<NewsPager> {

  List<Joy> data;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: <Widget>[
      new RefreshIndicator(
          child: new ListView.builder(
              itemCount: data == null ? 0 : data.length+getOtherListSize(),
              controller: listscrollController,
              itemBuilder: (context, index) {
                if (index == data.length) {
                  return getDefaultListFootWidget();
                } else {
                  final joy = data.elementAt(index);
                  return getItemWidget(joy);
                }
              }),
          onRefresh: onRefresh),
      ErrorView(errorControl)
    ]);
  }

  @override
  Future<void> onRefresh() {
    super.onRefresh();
    return loadData(true);
  }

  gotoNextPage() {
    if (!isExitNextPage || loadStatus == LoadingStatus.STATUS_LOADING) {
      return null;
    }
    print("loading next page");
    setState(() {
      loadStatus = LoadingStatus.STATUS_LOADING;
    });
    loadData(false);
  }

  @override
  void retryLoad() {
    // TODO: implement retryLoad
    setState(() {
      errorControl.status = ErrorStatus.STATUS_LOADING;
    });
    onRefresh();
    print("重试########");
  }

  @override
  void initState() {
    super.initState();
    loadData(true);

  }

  int endTime = 1582019579;

  String defaultTime = "1579491618";

  Future loadData(bool isRefresh) async {
    int timeCur = TimeUtils.currentTImeMillis();

    String time = "";
    if (isRefresh || data == null || data.isEmpty) {
      time = ((timeCur / 1000).round()).toString();
    } else {
      int length = data.length - 1;
      time = data.elementAt(length).time;
    }

    print("begin load data===>:$isRefresh");
    try {
      String url =
          "http://jtbk.sinaapp.com/xiaoliao/andriod10/index.php?lastTime=$time&cid=joke";
      print(url);
      Response response = await HttpManger.instance.dio.get(url);

      String jsonStr = response.data;
      List<dynamic> listJson = json.decode(jsonStr);

      List<Joy> data = listJson.map((value) => Joy.fromJson(value)).toList();

      int size = data.length;
      print("parse data size of===>:$size");

//      List<Joy> data=response.extra.forEach((key,value) => Joy.fromJson(value));
      if (isRefresh) {
        setState(() {
          this.data = data;
          loadStatus = LoadingStatus.STATUS_IDEL;
          errorControl.status = ErrorStatus.STATUS_HIDE;
        });
      } else {
        setState(() {
          if (data == null) {
            this.data = data;
          } else {
            this.data.addAll(data);
          }
          loadStatus = LoadingStatus.STATUS_IDEL;
          errorControl.status = ErrorStatus.STATUS_HIDE;
        });
      }
      if (data != null && !data.isEmpty) {
        int lastTime = int.parse(data.elementAt(data.length - 1).time);
        if (lastTime < endTime) {
          setState(() {
            isExitNextPage = false;
            print("没有下一页了");
          });
        }
      } else {
        setState(() {
          isExitNextPage = false;
          print("没有下一页了2");
        });
      }

      return 1;
    } catch (e) {
      setState(() {
        if(this.data==null||this.data.isEmpty){
          this.errorControl.status = ErrorStatus.STATUS_RETRY;
        }

      });

      print(e);
      return null;
    }
  }

  Widget getItemWidget(Joy joy) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(10.0),
          child: getItemWidgetImpl(joy.content)),
      onTap: () {
        String conte = joy.content;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JoyDetailPage(content: conte),
            ));
      },
    );
  }


}

Widget getItemWidgetImpl(String text) {
  return new Container(
    decoration: new BoxDecoration(
      border: new Border.all(color: Color(0xffeeeeee), width: 0.5),
      color: Color(0xfffffff),
    ),
    child: new Text(text),
  );
}
