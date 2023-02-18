import 'package:flutter/material.dart';
import '../model/news.dart';
import '../view_model/custom_appbar_detail_news.dart';
import '../view_model/single_list_news.dart';

// ignore: must_be_immutable
class ListNews extends StatelessWidget {
  News newsModel;
  ListNews({super.key, required this.newsModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: const CustomAppBarDetailNews(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: newsModel.articles!.length,
            itemBuilder: (context, index) => SingleListNews(
                  newsModel: newsModel,
                  index: index,
                )),
      ),
    );
  }
}
