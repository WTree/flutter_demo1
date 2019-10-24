

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ToastUtils.dart';

class ListPager extends StatelessWidget{


  @override
  Widget build(BuildContext context){

    return new MaterialApp(

      title: 'List test',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new ListAppPage(),
    );
  }


}

class ListAppPage extends StatefulWidget{


  ListAppPage({Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ListAppPageState();
  }
}

class _ListAppPageState extends State<ListAppPage>{
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('List app'),
      ),
      body: new ListView(children:  _getListData()),
    );
  }

  _getListData(){

    List<Widget> widgets=[];
    for(int i=0;i<20;i++){
//      widgets.add(new Padding(padding: new EdgeInsets.all(10.0),child: new Text(" Row $i",)));
      widgets.add( new GestureDetector(
        child: new Padding(padding: new EdgeInsets.all(10.0),child:  getItemWidget(i)),
        onTap: (){
//          print("点击了");
          showTaost("点击了  $i");
        },
      ));
    }

    return widgets;
  }


  List<String> urls=['https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2685897558,1331788678&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2299113196,3410006479&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1502005339,3009167188&fm=26&gp=0.jpg',
    'http://img1.imgtn.bdimg.com/it/u=3732955117,228667764&fm=26&gp=0.jpg',
    'http://img1.imgtn.bdimg.com/it/u=176431714,508216047&fm=26&gp=0.jpg',
    'http://img5.imgtn.bdimg.com/it/u=3037784022,481363763&fm=26&gp=0.jpg'
  ];

  Widget getItemWidget(int i) {
    //BoxFit 可设置展示图片时 的填充方式
    try{
      return new Image(image: new NetworkImage(urls[i%urls.length]), fit: BoxFit.cover);
    }catch(e){
      return Container();
    }

  }
}