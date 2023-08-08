import 'package:apicallingexam/Screen/Home_Screen/Controller/home_controller.dart';
import 'package:apicallingexam/Screen/Home_Screen/Model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          centerTitle: true,
          title: Text("Bhagavat Gita"),),
        body: FutureBuilder(
          future: homeController.getApi(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: homeController.Data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/ditial',arguments: index);
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                      margin: EdgeInsets.all(5),
                      child: ListTile(

                        textColor: Colors.brown,
                        autofocus: true,
                        title: Text("${homeController.Data[index].nameTranslated}"),
                        subtitle: Text("${homeController.Data[index].id}"),
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
