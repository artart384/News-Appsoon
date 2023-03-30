import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/controller.dart';
import 'country.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateNow = DateTime.now();
    DateTime date = DateTime.parse(dateNow.toString());
    String formatDate = DateFormat('dd MMM yyy').format(date);
    var controller = Get.put(Controller());
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Obx(
              () => CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  controller.imageCountry.value,
                ),
                child: MaterialButton(
                    elevation: 1000,
                    onPressed: () => showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('Select Country'),
                              content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Country(
                                        codeCountry: 'us',
                                        imageUrl: 'assets/us.png',
                                        nameCountry: 'United State America'),
                                    Country(
                                        codeCountry: 'gb',
                                        imageUrl: 'assets/gb.png',
                                        nameCountry: 'United Kingdom'),
                                    Country(
                                        codeCountry: 'th',
                                        imageUrl: 'assets/th.png',
                                        nameCountry: 'Thailand'),

                                  ]),
                            );
                          },
                        )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(formatDate),
          ],
        ),
      ),
    );
  }
}
