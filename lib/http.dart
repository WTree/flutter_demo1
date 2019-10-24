import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

loadData() async{

  String dataYrl= "https://jsonplaceholder.typicode.com/posts";
  http.Response response= await http.get(dataYrl);




}
