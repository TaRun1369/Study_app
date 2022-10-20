import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';


Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageService extends GetxService{
  // Loading images from firebase storage section

  Future <String?> getImage(String? imgName) async {
    print("hello");
    if(imgName == null){
      return null;
    }
    try{
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child("${imgName.toLowerCase()}.png");

          var imgUrl = await urlRef.getDownloadURL();
          print(imgUrl);
          return imgUrl;
    }catch(e){
      print(e);
      return null;
    }
  }
}