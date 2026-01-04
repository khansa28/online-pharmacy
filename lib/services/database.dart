// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseMethods {

//   /// ================= ADD USER =================
//   Future<void> addUserInfo(
//       Map<String, dynamic> userInfoMap,
//       String id,
//       ) async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(id)
//         .set(userInfoMap);
//   }

//   /// ================= ADD PRODUCT =================
//   Future<void> addProduct(Map<String, dynamic> productInfoMap) async {
//     await FirebaseFirestore.instance
//         .collection("products") // ✅ correct collection
//         .add(productInfoMap);
//   }

//   /// ================= GET PRODUCTS BY CATEGORY =================
//   Stream<QuerySnapshot> getallProducts(String category) {
//     return FirebaseFirestore.instance
//         .collection("products")        // ✅ correct collection
//         .where("category", isEqualTo: category) // ✅ correct field
//         .snapshots();
//   }

//   /// ================= GET ALL PRODUCTS (OPTIONAL) =================
//   Stream<QuerySnapshot> getAllProducts() {
//     return FirebaseFirestore.instance
//         .collection("products")
//         .snapshots();
//   }

//   /// ================= SEARCH PRODUCTS (OPTIONAL - FUTURE USE) =================
//   Stream<QuerySnapshot> searchProducts(String query) {
//     return FirebaseFirestore.instance
//         .collection("products")
//         .where("product_name", isGreaterThanOrEqualTo: query)
//         .where("product_name", isLessThanOrEqualTo: '$query\uf8ff')
//         .snapshots();
//   }
// }

////Working above///



import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  /// ================= ADD USER =================
  Future<void> addUserInfo(
    Map<String, dynamic> userInfoMap,
    String id,
  ) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  /// ================= ADD PRODUCT =================
  Future<void> addProduct(Map<String, dynamic> productInfoMap) async {
    await FirebaseFirestore.instance
        .collection("products") // ✅ correct collection
        .add(productInfoMap);
  }

  /// ================= GET PRODUCTS BY CATEGORY =================
  Stream<QuerySnapshot> getallProducts(String category) {
    return FirebaseFirestore.instance
        .collection("products") // ✅ correct collection
        .where("category", isEqualTo: category) // ✅ correct field
        .snapshots();
  }

  /// ================= GET ALL PRODUCTS (OPTIONAL) =================
  Stream<QuerySnapshot> getAllProducts() {
    return FirebaseFirestore.instance
        .collection("products")
        .snapshots();
  }

  /// ================= SEARCH PRODUCTS (OPTIONAL - FUTURE USE) =================
  Stream<QuerySnapshot> searchProducts(String query) {
    return FirebaseFirestore.instance
        .collection("products")
        .where("product_name", isGreaterThanOrEqualTo: query)
        .where("product_name", isLessThanOrEqualTo: '$query\uf8ff')
        .snapshots();
  }

  /// ================= UPDATE WALLET =================
  Future<void> updateWallet(String userId, int newBalance) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .update({
      "wallet": newBalance,
    });
  }

  /// ================= GET WALLET (REAL TIME) =================
  Stream<DocumentSnapshot> getUserWallet(String userId) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .snapshots();
  }
}
