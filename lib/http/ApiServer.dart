
import 'package:dio/dio.dart';
import 'package:flutter_app1/member/Joy.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;

//part  'ApiServer.g.dart';
@RestApi(baseUrl: "http://jtbk.sinaapp.com/")
abstract class ApiServer{




//  factory ApiServer(Dio dio) = _ApiServer;

  @GET("xiaoliao/andriod10/index.php?&cid=joke")
  Future<List<Joy>> getJoy(@Query("lastTime") String lastTime);



}




