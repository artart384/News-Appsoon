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
                    backgroundColor: Colors.white,
                    shape: const CircleBorder()),
                onPressed: () {
                  Get.back();
                },
                child: const Center(
                  child: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.black,
                    size: 30,
                  ),
                )),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            width: 50,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: Colors.white,
                    shape: const CircleBorder()),
                onPressed: () {},
                child: Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          'assets/share.png',
                          fit: BoxFit.cover,
                        )))),
          ),
        ),
      ],
    );
  }
}
