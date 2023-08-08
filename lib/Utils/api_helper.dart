import 'dart:convert';

import 'package:apicallingexam/Screen/Home_Screen/Model/home_model.dart';
import 'package:http/http.dart' as http;
class ApiHelper
{
  static ApiHelper apiHelper = ApiHelper._();
  ApiHelper._();

  Future<List<HomeModel>> apicall()
  async {
    String link = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/";
    var respone = await http.get(Uri.parse(link),headers:  {
      'X-RapidAPI-Key': '0879344c6dmsha1627f90fd35f77p1ad740jsne6f395c3cb33',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com' });
    List json = jsonDecode(respone.body);
    print(json);
    List<HomeModel> bhagavat = json.map((e)=> HomeModel.fromJson(e)).toList();
    return bhagavat;
  }
}