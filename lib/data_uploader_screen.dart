import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/controllers/question_paper/data_uploader.dart';
import 'firebase_ref/loading_status.dart';


class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({Key? key}) : super(key: key);
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Obx(()=>Text(controller.loadingStatus.value == LoadingStatus.completed?"uploading completed":
        "uploading...")),
      ),
    );
  }
}
