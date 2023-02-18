import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';
import 'package:rxdart/rxdart.dart';

import '../model/news.dart';

class Controller extends GetxController {
  var tag = 0.obs;
  var isLoading = false.obs;
  var codeCountry = 'id'.obs;
  var imageCountry = 'assets/id.png'.obs;
  var isChange = false.obs;
  var category = 'business'.obs;
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

  @override
  void onInit() {
    streamController = BehaviorSubject(sync: true);
    streamHeadlines = BehaviorSubject(sync: true);
    loadPosts();
    loadPostsHeadlines();
    getData();
    getDataHeadlines();
    ever(
        errorMsg,
        (_) =>
            showToast(errorMsg.value, duration: const Duration(seconds: 10)));
    super.onInit();
  }

  Future<News> getData() async {
    http.Response res = await http.get(Uri.parse(urlEverything.value));
    if (res.statusCode == 200) {
      return News.fromJson(json.decode(res.body));
    } else {
      errorMsg.value = res.statusCode.toString();
      throw Exception(res.statusCode);
    }
  }

  Future<News> getDataHeadlines() async {
    String url = urlHeadCate.value;
    http.Response res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return News.fromJson(json.decode(res.body));
    } else {
      errorMsg.value = res.statusCode.toString();
      throw Exception(res.statusCode);
    }
  }

  loadPosts() async {
    getData().then((response) async {
      streamController!.add(response);
      return response;
    });
  }

  loadPostsHeadlines() async {
    getDataHeadlines().then((responseHead) async {
      streamHeadlines!.add(responseHead);
      return responseHead;
    });
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
