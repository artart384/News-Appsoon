import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/controller.dart';
import '../view/main_view.dart';

// ignore: must_be_immutable
class Country extends StatelessWidget {
  String imageUrl, nameCountry, codeCountry;
  Country(
      {super.key,
      required this.imageUrl,
      required this.nameCountry,
      required this.codeCountry});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());
    return MaterialButton(
      onPressed: () {
        controller.urlHeadCate.value =
            'https://newsapi.org/v2/top-headlines?country=$codeCountry&category=business&apiKey=4a112fa802ff4cbd9928a0e0b2708a15';
        controller.tag.value = 0;
        controller.imageCountry.value = 'assets/$codeCountry.png';
        controller.codeCountry.value = codeCountry;
        Navigator.pop(context);
        Get.offAll(const MainView());
      },
      child: Row(children: [
        SizedBox(
          width: 50,
          height: 30,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          nameCountry,
          style: GoogleFonts.dmSans(),
        )
      ]),
    );
  }
}
