import 'package:flutter_study_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController{
  final allPaperImages =<String>[].obs;
  
  @override
  void OnReady(){
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics",
    ];
    try{

      print(allPaperImages);
      for(var img in imgName){
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages.add(imgUrl!);
        print(imgUrl);
      }
    }catch(e){
      print(e);
    }
  }
}