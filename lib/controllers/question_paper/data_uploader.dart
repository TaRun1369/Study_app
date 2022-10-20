import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
  final loadingStatus = LoadingStatus.loading.obs;
  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String,dynamic> manifestMap = await json.decode(manifestContent);
    // loading json file and printing path...
    final papersInAssets = await manifestMap.keys.where((path)=>path.startsWith("assets/DB/papers") && path.contains(".json")).toList();
    List<QuestionPaperModel> questionPapers = [];
    print(papersInAssets);
    print("load");
    for(var paper in papersInAssets){
      String stringPaperContent = await rootBundle.loadString(paper);
      print(stringPaperContent);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    print("'Items number${questionPapers[0].id}");
    var batch = fireStore.batch();
    
    for(var paper in questionPapers){
      batch.set(questionPaperRF.doc(paper.id), {
        'title': paper.title,
        'image_url': paper.imageUrl,
        'description':paper.description,
        'time_seconds':paper.timeSeconds,
        'questions_count':paper.questions==null?0:paper.questions!.length


      });
      for(var questions in paper.questions!){
        final questionPath = questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath,{
          'question':questions.question,
          'correct_answer':questions.correctAnswer
        });
        for(var answer in questions.answers){
          batch.set(questionPath.collection("answers").doc(answer.identifier),{
            "identifier":answer.identifier,
            "answer": answer.answer
          });
        }
      }
    }
    try{
      await batch.commit();
      loadingStatus.value = LoadingStatus.completed;
    }catch (error){
      print("error");
    }
  }
}

