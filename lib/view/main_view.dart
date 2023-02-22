import 'dart:convert';
import 'package:chips_choice/chips_choice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/error.dart';
import '../controller/controller.dart';
import '../model/news.dart';
import '../view_model/custom_appbar.dart';
import '../view_model/list_headlines.dart';
import '../view_model/single_list_news.dart';
import 'list_news.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());

    return Scaffold(
      backgroundColor: const Color(0xfffbfaff),
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
        elevation: 0,
        backgroundColor: const Color(0xfffbfaff),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              'Top Headlines',
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: const Color(0xff454d73)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: FutureBuilder<News>(
              future: controller.getDataHeadlines(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  if (snapshot.error.runtimeType == DioError) {
                    DioError error = snapshot.error as DioError;
                    ApiError apiError = ApiError.fromJson(
                        jsonDecode(error.response.toString()));
                    return Center(
                      child: Text(apiError.message.toString()),
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return ListHeadlines(newsModel: snapshot.data!);
                }
                return const CircularProgressIndicator(
                  backgroundColor: Colors.red,
                );
              },
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ChipsChoice<int>.single(
                value: controller.tag.value,
                onChanged: (val) {
                  controller.tag.value = val;
                  String category =
                      controller.options.elementAt(controller.tag.value);
                  controller.category.value = category.toLowerCase();
                  controller.urlHeadCate.value =
                      'https://newsapi.org/v2/top-headlines?country=${controller.codeCountry.value}&category=${category.toLowerCase()}&apiKey=4a112fa802ff4cbd9928a0e0b2708a15';

                  controller.urlEverything.value =
                      'https://newsapi.org/v2/everything?q=${category.toLowerCase()}&apiKey=4a112fa802ff4cbd9928a0e0b2708a15';
                  Get.offAll(const MainView(),
                      duration: const Duration(microseconds: 1));
                },
                choiceItems: C2Choice.listFrom<int, String>(
                  source: controller.options,
                  value: (i, v) => i,
                  label: (i, v) => v,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: FutureBuilder<News>(
                future: controller.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    return Column(
                      children: [
                        SingleListNews(newsModel: snapshot.data!, index: 1),
                        SingleListNews(
                          newsModel: snapshot.data!,
                          index: 2,
                        ),
                        Center(
                          child: MaterialButton(
                            child: Text(
                              'View More',
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                            onPressed: () => Get.to(ListNews(
                              newsModel: snapshot.data!,
                            )),
                          ),
                        )
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                }),
          )
        ]),
      ),
    );
  }
}
