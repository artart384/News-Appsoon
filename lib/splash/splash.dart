import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/controller.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    var controller = Get.put(Controller());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: sizeWidth,
        height: sizeHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/splash1.png'),
              Stack(
                children: [
                  Obx(
                    () => AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: sizeWidth / 1.5,
                      height: !controller.isChange.value ? 0 : 85,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'GSportNews',
                            style: GoogleFonts.dmSans(fontSize: 20),
                          )),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: sizeWidth / 1.5,
                    height: 60,
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText('Welcome To',
                            textAlign: TextAlign.center,
                            textStyle: GoogleFonts.dmSans(fontSize: 40),
                            speed: const Duration(milliseconds: 300)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
