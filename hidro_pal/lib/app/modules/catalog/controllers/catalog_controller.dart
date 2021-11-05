import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");
    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    return products.orderBy("time", descending: true).snapshots();
  }

  void deleteProduct(String docId) async {
    DocumentReference docRef = firestore.collection("products").doc(docId);
    try {
      Get.defaultDialog(
        title: "Delete Data",
        middleText: "Apakah kamu yakin akan menghapus data ini?",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
        },
        textConfirm: "YES",
        textCancel: "NO",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }
}
