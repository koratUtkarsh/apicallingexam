import 'package:apicallingexam/Screen/Ditial_screen/View/ditial_screen.dart';
import 'package:apicallingexam/Screen/Home_Screen/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => HomeScreen(),),
        GetPage(name: '/ditial', page: () => DitialScreen(),)
      ],
    ),
  );
}