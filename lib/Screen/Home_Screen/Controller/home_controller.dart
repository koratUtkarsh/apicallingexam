import 'package:apicallingexam/Screen/Home_Screen/Model/home_model.dart';
import 'package:apicallingexam/Utils/api_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  List<dynamic> Data = [];
  Future<List> getApi()
  async {
    Data = await ApiHelper.apiHelper.apicall();
    return Data;
  }
}