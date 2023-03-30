import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../model/news.dart';
import 'top_headlines.dart';

// ignore: must_be_immutable
class ListHeadlines extends StatelessWidget {
  News newsModel;
  ListHeadlines({super.key, required this.newsModel});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: newsModel.articles!.length,
        itemBuilder: (context, index, realIndex) => Center(
              child: TopHeadlines(
                content: newsModel.articles?.elementAt(index).content ?? '',
                desc: newsModel.articles?.elementAt(index).description ?? '',
                contextSuper: context,
                author:
                    newsModel.articles?.elementAt(index).author ?? 'Unknown',
                imageUrl: newsModel.articles?.elementAt(index).urlToImage ??
                    'https://www.memagazine.co.th/wp-content/uploads/2020/03/BREAKING-NEWS.png',
                title: newsModel.articles?.elementAt(index).title ?? 'Untitled',
                publishedAt: newsModel.articles?.elementAt(index).publishedAt ??
                    'Unknown',
              ),
            ),
        options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            disableCenter: true,
            viewportFraction: 1.05,
            height: 360));
  }
}
