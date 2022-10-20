import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_study_app/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import '../../configs/themes/app_colors.dart';
import 'package:flutter_study_app/routes/app_routes.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient:mainGradient(context)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width*0.2 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Icon(Icons.star,size:65),
            const SizedBox(height: 40),
            const Text(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                ),

                "This is a study app.toh bakchodi nhi sabke liye banaya hai maje se padhna..."),
              const SizedBox(height: 40),
              AppCircleButton(
              onTap: ()=> null,
              child: const Icon(Icons.arrow_forward,size:35),

            ),
          ],
          ),
        ),
      ),
    );
  }
}
