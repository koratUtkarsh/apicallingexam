import 'package:apicallingexam/Screen/Home_Screen/Controller/home_controller.dart';
import 'package:apicallingexam/Screen/Home_Screen/Model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DitialScreen extends StatefulWidget {
  const DitialScreen({Key? key}) : super(key: key);

  @override
  State<DitialScreen> createState() => _DitialScreenState();
}

class _DitialScreenState extends State<DitialScreen> {
  HomeController homeController = Get.put(HomeController(),);
  int index = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Ditale Screen"),backgroundColor: Colors.brown),
      body: FutureBuilder(
        future: homeController.getApi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}",
            );
          } else if (snapshot.hasData) {
            return Container(
              height: 500,
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: 200,
                      child: Center(
                        child: Text(
                          "${homeController.Data[index].chapterSummary}",
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    ),);
  }
}