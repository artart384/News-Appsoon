import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/news.dart';

class Controller extends GetxController {
  var tag = 0.obs;
  var isLoading = false.obs;
  var codeCountry = 'gb'.obs;
  var imageCountry = 'assets/gb.png'.obs;
  var isChange = false.obs;
  var category = 'sports'.obs;
  final dio = Dio();
  StreamController<News>? streamController;
  StreamController<News>? streamHeadlines;
  List<String> options = [
    'Football',
    'Basketball',
    'Tennis',
    'Baseball',


  ];
  var urlHeadCate =
      'https://newsapi.org/v2/top-headlines?country=gb&apiKey=2d2f31e87ca748f5ae69451ca818f537'
          .obs;
  //Headlines Country
  String urlHeadlines =
      'https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=2d2f31e87ca748f5ae69451ca818f537';
  //Headlines Country With Category

  //Everything about
  var urlEverything =
      'https://newsapi.org/v2/everything?q=sports&apiKey=2d2f31e87ca748f5ae69451ca818f537'
          .obs;

  var errorMsg = ''.obs;

  Future<News> getData() async {
    final res = await dio.get(urlEverything.value);
    if (res.statusCode == 200) {
      return News.fromJson(res.data);
    } else {
      errorMsg.value = res.statusCode.toString();
      throw Exception(res.statusCode);
    }
  }

  Future<News> getDataHeadlines() async {
    String url = urlHeadCate.value;
    final res = await dio.get(url);
    if (res.statusCode == 200) {
      return News.fromJson(res.data);
    } else {
      errorMsg.value = res.statusCode.toString();
      throw Exception(res.statusCode);
    }
  }

  Stream<News> streamData(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getData();
    }
  }

  formatDate(String publishedAt) {
    DateTime date = DateTime.parse(publishedAt);
    String formatDate = DateFormat('dd MMM yyy').format(date);
    return formatDate;
  }

  changeHeight() {
    Future.delayed(const Duration(milliseconds: 310));
    isChange.value = !isChange.value;
  }
}
