import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class FetchNews{
  static fetchNews()async{
 Response response = await get (Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e824cf703c8f4103b303db92c029d0ad"));
 Map body_data = jsonDecode(response.body);
  print(body_data);
  }
}
