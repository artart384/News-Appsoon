import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../view_model/custom_appbar_detail_news.dart';

// ignore: must_be_immutable
class DetailNews extends StatelessWidget {
  String imageUrl, title, desc, content, publishedAt, author;
  DetailNews(
      {super.key,
      required this.content,
      required this.author,
      required this.desc,
      required this.imageUrl,
      required this.publishedAt,
      required this.title});
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    DateTime date = DateTime.parse(publishedAt);
    String formatDate = DateFormat('dd MMM yyy').format(date);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: const CustomAppBarDetailNews(),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: sizeWidth,
            height: sizeHeight / 3.4,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
              width: sizeWidth,
              margin: const EdgeInsets.fromLTRB(20, 20, 30, 10),
              child: Text(
                title,
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w900,
                    fontSize: 26,
                    color: const Color(0xff000000)),
                textAlign: TextAlign.center,
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Text(
                author,
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16, color: Colors.black87),
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Text(
                formatDate,
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16, color: Colors.black87),
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Text(
              desc,
              style:
                  GoogleFonts.dmSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Text(
              content,
              style:
                  GoogleFonts.dmSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
          )
        ]),
      ),
    );
  }
}
