import 'package:flutter/material.dart';
import 'package:flutter_app1/Toggle.dart';
import 'package:flutter_app1/pages/NewsPager.dart';

class MainPageLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'List test',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPageState();
  }
}

class _TabItem {
  String name, activeIcon, normalIcon;

  int index;

  _TabItem(this.name, this.activeIcon, this.normalIcon, this.index);
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages;
  int _selectIndex = 0;

  final itemNames = [
    _TabItem('首页', 'assets/images/ic_assets_select.png',
        'assets/images/ic_assets.png', 0),
    _TabItem('Dapp', 'assets/images/ic_dapp_select.png',
        'assets/images/ic_dapp.png', 1)
  ];
  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    if (pages == null) {
      pages = [ToggleApp(), NewsPager()];
    }

    if (itemList == null) {
      itemList = itemNames
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(
                item.normalIcon,
                width: 20.0,
                height: 20.0,
              ),
              title: Text(
                item.name,
//            style: TextStyle(inherit:false,fontSize: 11.0),
              ),
              activeIcon:
                  Image.asset(item.activeIcon, width: 20.0, height: 20)))
          .toList();
    }
  }

  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: _selectIndex != index,
      child: TickerMode(
        enabled: _selectIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _getPagesWidget(0),
          _getPagesWidget(1),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: SafeArea(
          child: SizedBox(
              height: 50,
              child: BottomNavigationBar(
                items: itemList,

                onTap: (int index) {
                  setState(() {
                    _selectIndex = index;
                  });
                },
                selectedFontSize: 11,
                unselectedFontSize: 11,
                selectedLabelStyle: TextStyle(color: Colors.blue),
                unselectedLabelStyle: TextStyle(color: Colors.black),
                iconSize: 20,
                currentIndex: _selectIndex,
//        fixedColor: Colors.blue,
//        type: BottomNavigationBarType.fixed,
              ))),
    );
  }
}
