import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/news.dart';

class Controller extends GetxController {
  var tag = 0.obs;
  var isLoading = false.obs;
  var codeCountry = 'id'.obs;
  var imageCountry = 'assets/id.png'.obs;
  var isChange = false.obs;
  var category = 'business'.obs;
  final dio = Dio();
  StreamController<News>? streamController;
  StreamController<News>? streamHeadlines;
  List<String> options = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
    'Politics',
    'Automotive',
    'Education',
    'Fashion',
    'Travel',
    'Food',
  ];
  var urlHeadCate =
      'https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=4a112fa802ff4cbd9928a0e0b2708a15'
          .obs;
  //Headlines Country
  String urlHeadlines =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=4a112fa802ff4cbd9928a0e0b2708a15';
  //Headlines Country With Category

  //Everything about
  var urlEverything =
      'https://newsapi.org/v2/everything?q=business&apiKey=4a112fa802ff4cbd9928a0e0b2708a15'
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
