import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarDetailNews extends StatelessWidget {
  const CustomAppBarDetailNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            width: 50,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.black12,
                    shape: const CircleBorder()),
                onPressed: () {
                  Get.back();
                },
                child: const Center(

                )),
          ),
        ),

      ],
    );
  }
}
