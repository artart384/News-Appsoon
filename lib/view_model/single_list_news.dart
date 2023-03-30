import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../model/news.dart';
import '../view/detail_news.dart';

// ignore: must_be_immutable
class SingleListNews extends StatelessWidget {
  News newsModel;
  int index;
  SingleListNews({super.key, required this.index, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    DateTime date =
        DateTime.parse(newsModel.articles?.elementAt(index).publishedAt ?? '');
    String formatDate = DateFormat('dd MMM yyy').format(date);
    return MaterialButton(
      onPressed: () => Get.to(
          DetailNews(
              content: newsModel.articles?.elementAt(index).author ?? '',
              author: newsModel.articles?.elementAt(index).author ?? 'Unknown',
              desc: newsModel.articles?.elementAt(index).description ?? '',
              imageUrl: newsModel.articles?.elementAt(index).urlToImage ??
                  'https://www.memagazine.co.th/wp-content/uploads/2020/03/BREAKING-NEWS.png',
              publishedAt:
                  newsModel.articles?.elementAt(index).publishedAt ?? '',
              title: newsModel.articles?.elementAt(index).title ?? 'Untitled'),
          transition: Transition.leftToRightWithFade),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        width: sizeWidth,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: sizeWidth * 0.25,
                height: 150,
                child: Image.network(
                  newsModel.articles?.elementAt(index).urlToImage ??
                      'https://www.memagazine.co.th/wp-content/uploads/2020/03/BREAKING-NEWS.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: sizeWidth * 0.59,
                    child: Text(
                      newsModel.articles?.elementAt(index).title ?? 'Untitled',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          color: const Color(0xff000000)),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            formatDate,
                            style: GoogleFonts.dmSans(
                                fontSize: 14, color: Colors.black87),
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.time,
                            color: Colors.black87,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '10 Min',
                            style: GoogleFonts.dmSans(
                                fontSize: 14, color: Colors.black87),
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
