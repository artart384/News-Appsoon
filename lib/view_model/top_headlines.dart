import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../view/detail_news.dart';

// ignore: must_be_immutable
class TopHeadlines extends StatelessWidget {
  String imageUrl, title, author, publishedAt, content, desc;
  BuildContext contextSuper;
  TopHeadlines(
      {super.key,
      required this.author,
      required this.imageUrl,
      required this.content,
      required this.desc,
      required this.publishedAt,
      required this.title,
      required this.contextSuper});
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(contextSuper).size.height;
    DateTime date = DateTime.parse(publishedAt);
    String formatDate = DateFormat('dd MMM yyy').format(date);

    return MaterialButton(
      onPressed: () => Get.to(
          DetailNews(
              content: content,
              author: author,
              desc: desc,
              imageUrl: imageUrl,
              publishedAt: publishedAt,
              title: title),
          transition: Transition.leftToRightWithFade),
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 1.5,
            offset: const Offset(0, 0),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
        width: sizeHeight,
        child: Column(
          children: [
            SizedBox(
              height: 230,
              width: sizeWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: const Color(0xff454d73)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          author,
                          style: GoogleFonts.dmSans(
                              fontSize: 16, color: Colors.grey.shade700),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        formatDate,
                        style: GoogleFonts.dmSans(
                            fontSize: 16, color: Colors.grey.shade700),
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
