// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/pages/detail_page.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 50, left: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// PROFILE IMAGE
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(60),
//                 child: Image.asset(
//                   "images/pharmacy.jpg",
//                   width: screenWidth * 0.12,
//                   height: screenWidth * 0.12,
//                   fit: BoxFit.cover,
//                 ),
//               ),

//               const SizedBox(height: 30),

//               Text("Your Trusted", style: AppWidget.headlineTextStyle(26)),
//               Text("Online Pharmacy", style: AppWidget.lightTextStyle(28)),

//               const SizedBox(height: 30),

//               /// SEARCH BAR
//               Padding(
//                 padding: const EdgeInsets.only(right: 30),
//                 child: Container(
//                   padding: const EdgeInsets.only(left: 30),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 227, 222, 247),
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(color: Colors.white, width: 1.5),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Search Medicines....",
//                       hintStyle: AppWidget.lightTextStyle(18),
//                       suffixIcon: Container(
//                         margin: const EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: const Icon(Icons.search, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               /// CATEGORY LIST
//               SizedBox(
//                 height: 50,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     categoryItem("All Medicines", allmedicine, () {
//                       setState(() {
//                         allmedicine = true;
//                         supplement = vitamins = herbal = false;
//                       });
//                     }),
//                     const SizedBox(width: 30),
//                     categoryItem("Supplement", supplement, () {
//                       setState(() {
//                         supplement = true;
//                         allmedicine = vitamins = herbal = false;
//                       });
//                     }),
//                     const SizedBox(width: 30),
//                     categoryItem("Vitamins", vitamins, () {
//                       setState(() {
//                         vitamins = true;
//                         allmedicine = supplement = herbal = false;
//                       });
//                     }),
//                     const SizedBox(width: 30),
//                     categoryItem("Herbal", herbal, () {
//                       setState(() {
//                         herbal = true;
//                         allmedicine = supplement = vitamins = false;
//                       });
//                     }),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               /// FEATURED MEDICINE
//               Container(
//                 margin: const EdgeInsets.only(right: 30),
//                 width: double.infinity,
//                 height: screenWidth * 0.35,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color(0xffbab3a6),
//                       Color(0xffddd7cd),
//                       Color(0xffa59c8f),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                   child: Image.asset(
//                     "images/medicine.jpg",
//                     width: screenWidth * 0.35,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 30),

//               /// MEDICINE ITEMS → CLICK OPENS DETAIL PAGE
//               SizedBox(
//                 height: screenWidth * 0.32,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     medicineCard(
//                       context: context,
//                       image: "images/medicine1.jpg",
//                       name: "Unique Medicine",
//                       brand: "Oxmas",
//                       price: "\$100",
//                       description: "Unique Medicine by Oxmas for general health.",
//                     ),
//                     medicineCard(
//                       context: context,
//                       image: "images/medicine2.jpg",
//                       name: "Health Plus",
//                       brand: "MediCare",
//                       price: "\$80",
//                       description: "Health Plus by MediCare supports wellness.",
//                     ),
//                     medicineCard(
//                       context: context,
//                       image: "images/medicine3.jpg",
//                       name: "Vita Boost",
//                       brand: "Wellness",
//                       price: "\$60",
//                       description: "Vita Boost by Wellness helps strengthen immunity.",
//                     ),
//                     medicineCard(
//                       context: context,
//                       image: "images/medicine4.jpg",
//                       name: "Herbal Care",
//                       brand: "NatureAid",
//                       price: "\$70",
//                       description: "Herbal Care by NatureAid for natural healing.",
//                     ),
//                     medicineCard(
//                       context: context,
//                       image: "images/medicine5.jpg",
//                       name: "Energy Plus",
//                       brand: "LifeForce",
//                       price: "\$90",
//                       description: "Energy Plus by LifeForce boosts energy and vitality.",
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 40),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget categoryItem(String title, bool selected, VoidCallback onTap) {
//     return selected
//         ? AppWidget.selectedCategory(title)
//         : GestureDetector(
//             onTap: onTap,
//             child: Center(
//               child: Text(title, style: AppWidget.lightTextStyle(20)),
//             ),
//           );
//   }
// }

// /// MEDICINE CARD (TAP → DETAIL PAGE)
// Widget medicineCard({
//   required BuildContext context,
//   required String image,
//   required String name,
//   required String brand,
//   required String price,
//   required String description,
// }) {
//   final screenWidth = MediaQuery.of(context).size.width;

//   return GestureDetector(
//     behavior: HitTestBehavior.opaque,
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => DetailPage(
//             image: image,
//             name: name,
//             price: price,
//             description: description,
//           ),
//         ),
//       );
//     },
//     child: Container(
//       margin: const EdgeInsets.only(right: 20),
//       width: screenWidth * 0.25,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         gradient: const LinearGradient(
//           colors: [
//             Color(0xffbab3a6),
//             Color(0xffddd7cd),
//             Color(0xffa59c8f),
//           ],
//         ),
//       ),
//       child: Stack(
//         children: [
//           Center(
//             child: Image.asset(
//               image,
//               width: screenWidth * 0.18,
//               fit: BoxFit.contain,
//             ),
//           ),
//           Positioned(
//             bottom: 15,
//             left: 15,
//             right: 15,
//             child: Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(230, 200, 193, 181),
//                 borderRadius: BorderRadius.circular(25),
//                 border: Border.all(color: Colors.white, width: 1.5),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(name, style: AppWidget.whiteTextStyle(18)),
//                       Text(brand, style: AppWidget.lightTextStyle(14)),
//                     ],
//                   ),
//                   Text(price, style: AppWidget.whiteTextStyle(18)),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;

//   Stream? productStream;

//   Future<void> getOnLoad() async {
//     productStream = await DatabaseMethods().getallProducts("Medicine");
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getOnLoad();
//   }

//   /// ================= PRODUCTS LIST =================
//   Widget allProducts() {
//     return StreamBuilder(
//       stream: productStream,
//       builder: (context, AsyncSnapshot snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return ListView.builder(
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: snapshot.data.docs.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot ds = snapshot.data.docs[index];

//             return Container(
//               margin: const EdgeInsets.only(right: 30, bottom: 20),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Stack(
//                 children: [
//                   /// PRODUCT IMAGE
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(30),
//                     child: Image.asset(
//                       "images/medicine.png",
//                       height: 300,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),

//                   /// BOTTOM PRODUCT DETAILS
//                   Positioned(
//                     bottom: 20,
//                     left: 20,
//                     right: 20,
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(230, 200, 193, 181),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.white, width: 1.5),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   ds["Name"],
//                                   style: AppWidget.whiteTextStyle(20),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                               Text(
//                                 "\$${ds["Price"]}",
//                                 style: AppWidget.whiteTextStyle(22),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 5),
//                           Text(
//                             ds["BrandName"],
//                             style: AppWidget.whiteTextStyle(18),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   /// ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TOP FIXED PHARMACY IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 "images/pharmacy.jpg",
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// TITLE
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Your Trusted", style: AppWidget.headlineTextStyle(26)),
//                 Text("Online Pharmacy", style: AppWidget.lightTextStyle(28)),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// SCROLLABLE CONTENT
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               children: [
//                 /// SEARCH BAR
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 30),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 225, 219, 248),
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.white, width: 1.5),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Medicine...",
//                         hintStyle: AppWidget.lightTextStyle(18),
//                         suffixIcon: Container(
//                           margin: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: const Icon(Icons.search, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// CATEGORY LIST
//                 SizedBox(
//                   height: 50,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       allmedicine
//                           ? AppWidget.selectedCategory("All Medicine")
//                           : _category("All Medicine", () {
//                               setState(() {
//                                 allmedicine = true;
//                                 supplement = vitamins = herbal = false;
//                               });
//                             }),
//                       const SizedBox(width: 30),
//                       supplement
//                           ? AppWidget.selectedCategory("Supplement")
//                           : _category("Supplement", () {
//                               setState(() {
//                                 allmedicine = false;
//                                 supplement = true;
//                                 vitamins = herbal = false;
//                               });
//                             }),
//                       const SizedBox(width: 30),
//                       vitamins
//                           ? AppWidget.selectedCategory("Vitamins")
//                           : _category("Vitamins", () {
//                               setState(() {
//                                 allmedicine = false;
//                                 supplement = false;
//                                 vitamins = true;
//                                 herbal = false;
//                               });
//                             }),
//                       const SizedBox(width: 30),
//                       herbal
//                           ? AppWidget.selectedCategory("Herbal")
//                           : _category("Herbal", () {
//                               setState(() {
//                                 allmedicine = false;
//                                 supplement = false;
//                                 vitamins = false;
//                                 herbal = true;
//                               });
//                             }),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// FIREBASE PRODUCTS
//                 allProducts(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _category(String title, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Center(
//         child: Text(title, style: AppWidget.lightTextStyle(20)),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;

//   Stream? productStream;

//   Future<void> getOnLoad() async {
//     productStream = await DatabaseMethods().getallProducts("Medicine");
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getOnLoad();
//   }

//   /// ================= PRODUCTS GRID =================
//   Widget allProducts() {
//     return StreamBuilder(
//       stream: productStream,
//       builder: (context, AsyncSnapshot snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         return GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: snapshot.data.docs.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // like your image
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//             childAspectRatio: 0.65,
//           ),
//           itemBuilder: (context, index) {
//             DocumentSnapshot ds = snapshot.data.docs[index];

//             return Container(
//               decoration: BoxDecoration(
//                 color: const Color(0xffcfc8bb),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Column(
//                 children: [
//                   /// PRODUCT IMAGE
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(14),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(22),
//                         child: Image.asset(
//                           "images/medicine.png",
//                           fit: BoxFit.contain,
//                           width: double.infinity,
//                         ),
//                       ),
//                     ),
//                   ),

//                   /// PRODUCT INFO
//                   Container(
//                     margin: const EdgeInsets.all(10),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 14, vertical: 12),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(230, 200, 193, 181),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.black, width: 1.5),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// NAME + PRICE
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 ds["Name"],
//                                 style: AppWidget.blackTextStyle(16),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                             Text(
//                               "\$${ds["Price"]}",
//                               style: AppWidget.blackTextStyle(18),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 6),

//                         /// BRAND
//                         Text(
//                           ds["BrandName"],
//                           style: AppWidget.blackTextStyle(14),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   /// ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TOP IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 "images/pharmacy.jpg",
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// TITLE
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Your Trusted", style: AppWidget.headlineTextStyle(26)),
//                 Text("Online Pharmacy", style: AppWidget.lightTextStyle(28)),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// MAIN CONTENT
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.only(
//                   left: 20, right: 20, bottom: 20),
//               children: [
//                 /// SEARCH BAR
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 30),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 225, 219, 248),
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.white, width: 1.5),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Medicine...",
//                         hintStyle: AppWidget.lightTextStyle(18),
//                         suffixIcon: Container(
//                           margin: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child:
//                               const Icon(Icons.search, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// CATEGORY LIST
//                 SizedBox(
//                   height: 50,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       allmedicine
//                           ? AppWidget.selectedCategory("All Medicine")
//                           : _category("All Medicine", () {
//                               setState(() {
//                                 allmedicine = true;
//                                 supplement = vitamins = herbal = false;
//                               });
//                             }),
//                       const SizedBox(width: 30),
//                       supplement
//                           ? AppWidget.selectedCategory("Supplement")
//                           : _category("Supplement", () {
//                               setState(() {
//                                 allmedicine = false;
//                                 supplement = true;
//                                 vitamins = herbal = false;
//                               });
//                             }),
//                       const SizedBox(width: 30),
//                       vitamins
//                           ? AppWidget.selectedCategory("Vitamins")
//                           : _category("Vitamins", () {
//                               setState(() {
//                                 allmedicine = false;
//                                 supplement = false;
//                                 vitamins = true;
//                                 herbal = false;
//                               });
//                             }),
//                       const SizedBox(width: 30),
//                       herbal
//                           ? AppWidget.selectedCategory("Herbal")
//                           : _category("Herbal", () {
//                               setState(() {
//                                 allmedicine = false;
//                                 supplement = false;
//                                 vitamins = false;
//                                 herbal = true;
//                               });
//                             }),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// FIREBASE PRODUCTS
//                 allProducts(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _category(String title, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Center(
//         child: Text(title, style: AppWidget.lightTextStyle(20)),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;

//   Stream? productStream;

//   Future<void> getOnLoad() async {
//     productStream = await DatabaseMethods().getallProducts("Medicine");
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getOnLoad();
//   }

//   /// ================= HORIZONTAL PRODUCTS =================
//   Widget allProducts() {
//     return SizedBox(
//       height: 260, // ✅ FIXED HEIGHT (IMPORTANT)
//       child: StreamBuilder(
//         stream: productStream,
//         builder: (context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data.docs.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot ds = snapshot.data.docs[index];

//               return Container(
//                 width: 230, // ✅ CARD WIDTH
//                 margin: const EdgeInsets.only(right: 20),
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xffcfc8bb),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// PRODUCT IMAGE
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Image.asset(
//                         "images/medicine.png",
//                         height: 130,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),

//                     const SizedBox(height: 12),

//                     /// PRODUCT INFO
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 10),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(230, 200, 193, 181),
//                         borderRadius: BorderRadius.circular(18),
//                         border: Border.all(color: Colors.black, width: 1.2),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           /// NAME + PRICE
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   ds["Name"],
//                                   style: AppWidget.blackTextStyle(14),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                               Text(
//                                 "\$${ds["Price"]}",
//                                 style: AppWidget.blackTextStyle(15),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 4),

//                           /// BRAND
//                           Text(
//                             ds["BrandName"],
//                             style: AppWidget.blackTextStyle(12),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TOP IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 "images/pharmacy.jpg",
//                 width: 80,
//                 height: 80,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// TITLE
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Your Trusted",
//                     style: AppWidget.headlineTextStyle(26)),
//                 Text("Online Pharmacy",
//                     style: AppWidget.lightTextStyle(28)),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// MAIN CONTENT
//           Expanded(
//             child: ListView(
//               padding:
//                   const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               children: [
//                 /// SEARCH BAR
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 30),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 225, 219, 248),
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(color: Colors.white, width: 1.5),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Medicine...",
//                         hintStyle: AppWidget.lightTextStyle(18),
//                         suffixIcon: Container(
//                           margin: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child:
//                               const Icon(Icons.search, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// CATEGORY LIST
//                  SizedBox(height: 30.0,),  
//           Container(
//             height: 50,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//               allmedicine? AppWidget.selectedCategory("All Medicine"):GestureDetector(
//               onTap: ()async{
//                 allmedicine=true;
//                 supplement=false;
//                 vitamins=false;
//                 herbal=false;

//                productStream= await DatabaseMethods().getallProducts("Medicine");
//                 setState(() {
                  
//                 });
//               },
//               child: Container(
//                 height: 50,
//                 child: Center(child: Text("All Medicine", style: AppWidget.lightTextStyle(20.0),)))),
// ///////////////////              
//               SizedBox(width: 30.0,),
//               supplement? AppWidget.selectedCategory("Supplements"):GestureDetector(
//               onTap: ()async{
//                 allmedicine=false;
//                 supplement=true;
//                 vitamins=false;
//                 herbal=false;
//                 productStream= await DatabaseMethods().getallProducts("Supplements");
//                 setState(() {
                  
//                 });
//               },
//               child: Container(
//                 height: 50,
//                 child: Center(child: Text("Supplements", style: AppWidget.lightTextStyle(20.0),)))),   
            
// ////////////////
//           SizedBox(width: 30.0,),
//               vitamins? AppWidget.selectedCategory("Vitamins"):GestureDetector(
//               onTap: ()async{
//                 allmedicine=false;
//                 supplement=false;
//                 vitamins=true;
//                 herbal=false;
//                 productStream= await DatabaseMethods().getallProducts("Vitamins");
//                 setState(() {
                  
//                 });
//               },
//               child: Container(
//                 height: 50,
//                 child: Center(child: Text("Vitamins", style: AppWidget.lightTextStyle(20.0),)))), 

// ////////////////////
//                 SizedBox(width: 30.0,),
//               herbal? AppWidget.selectedCategory("Herbal"):GestureDetector(
//               onTap: ()async{
//                 allmedicine=false;
//                 supplement=false;
//                 vitamins=false;
//                 herbal=true;
//                 productStream= await DatabaseMethods().getallProducts("Herbal");
//                 setState(() {
                  
//                 });
//               },
//               child: Container(
//                 height: 50,
//                 child: Center(child: Text("Herbal", style: AppWidget.lightTextStyle(20.0),)))),   
               
//             ],),
//           ),

//                 const SizedBox(height: 20),

//                 /// FIREBASE PRODUCTS (HORIZONTAL SLIDER)
//                 allProducts(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget _category(String title, VoidCallback onTap) {
//   //   return GestureDetector(
//   //     onTap: onTap,
//   //     child: Center(
//   //       child: Text(title, style: AppWidget.lightTextStyle(20)),
//   //     ),
//   //   );
//   // }
//  }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:online_pharmacy/pages/detail_page.dart';
// import 'package:online_pharmacy/pages/wallet.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;
//   Stream? productStream;

//   Future<void> getOnLoad() async {
//     productStream = await DatabaseMethods().getallProducts("Medicine");
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getOnLoad();
//   }

//   /// ================= HORIZONTAL PRODUCTS =================
//   Widget allProducts() {
//     return SizedBox(
//       height: 320,
//       child: Container(
//         child: StreamBuilder(
//           stream: productStream,
//           builder: (context, AsyncSnapshot snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(child: CircularProgressIndicator());
//             }
        
//             return ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data.docs.length,
//               itemBuilder: (context, index) {
//                 DocumentSnapshot ds = snapshot.data.docs[index];
        
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (_) => DetailPage(
//       image: "images/medicine.png",
//       name: ds["Name"],
//       price: "\$${ds["Price"]}",
//       description: ds["Product Description"] ?? "No description available",
//       walletBalance: walletBalance, // from your Wallet page
//       updateWalletBalance: (newBalance) {
//         setState(() {
//           walletBalance = newBalance;
//         });
//       },
//     ),
//   ),
// );

//                   },
//                   child: Container(
//                     width: 280,
//                     margin: const EdgeInsets.only(right: 20),
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: const Color(0xffcfc8bb),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Image.asset(
//                             "images/medicine.png",
//                             height: 160,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 12, vertical: 16),
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(230, 200, 193, 181),
//                             borderRadius: BorderRadius.circular(18),
//                             border:
//                                 Border.all(color: Colors.black, width: 1.2),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       ds["Name"],
//                                       style: AppWidget.blackTextStyle(16),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                   Text(
//                                     "\$${ds["Price"]}",
//                                     style: AppWidget.blackTextStyle(16),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 ds["BrandName"],
//                                 style: AppWidget.blackTextStyle(13),
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }

//   /// ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TOP IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 "images/pharmacy.jpg",
//                 width: 150,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// TITLE
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Your Trusted",
//                     style: AppWidget.headlineTextStyle(26)),
//                 Text("Online Pharmacy",
//                     style: AppWidget.lightTextStyle(28)),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// MAIN CONTENT
//           Expanded(
//             child: ListView(
//               padding:
//                   const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               children: [
//                 /// SEARCH BAR
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 30),
//                     decoration: BoxDecoration(
//                       color:
//                           const Color.fromARGB(255, 225, 219, 248),
//                       borderRadius: BorderRadius.circular(30),
//                       border:
//                           Border.all(color: Colors.white, width: 1.5),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Medicine...",
//                         hintStyle: AppWidget.lightTextStyle(18),
//                         suffixIcon: Container(
//                           margin: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: const Icon(Icons.search,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// ✅ CATEGORY LIST (RESTORED)
//                 SizedBox(
//                   height: 50,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       allmedicine
//                           ? AppWidget.selectedCategory("All Medicine")
//                           : _category("All Medicine", () async {
//                               allmedicine = true;
//                               supplement =
//                                   vitamins = herbal = false;
//                               productStream =
//                                   await DatabaseMethods()
//                                       .getallProducts("Medicine");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       supplement
//                           ? AppWidget.selectedCategory("Supplements")
//                           : _category("Supplements", () async {
//                               allmedicine = false;
//                               supplement = true;
//                               vitamins = herbal = false;
//                               productStream =
//                                   await DatabaseMethods()
//                                       .getallProducts("Supplements");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       vitamins
//                           ? AppWidget.selectedCategory("Vitamins")
//                           : _category("Vitamins", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = true;
//                               herbal = false;
//                               productStream =
//                                   await DatabaseMethods()
//                                       .getallProducts("Vitamins");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       herbal
//                           ? AppWidget.selectedCategory("Herbal")
//                           : _category("Herbal", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = false;
//                               herbal = true;
//                               productStream =
//                                   await DatabaseMethods()
//                                       .getallProducts("Herbal");
//                               setState(() {});
//                             }),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// PRODUCTS
//                 allProducts(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _category(String title, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Center(
//         child: Text(title, style: AppWidget.lightTextStyle(20)),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:online_pharmacy/pages/detail_page.dart';
// import 'package:online_pharmacy/pages/wallet.dart';

// class Home extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;
//   const Home({super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;
//   Stream? productStream;

//   /// ✅ WALLET BALANCE STATE (FIX)
//   int walletBalance = 200;

//   Future<void> getOnLoad() async {
//     productStream = await DatabaseMethods().getallProducts("Medicine");
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getOnLoad();
//   }

//   /// ================= HORIZONTAL PRODUCTS =================
//   Widget allProducts() {
//     return SizedBox(
//       height: 320,
//       child: StreamBuilder(
//         stream: productStream,
//         builder: (context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data.docs.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot ds = snapshot.data.docs[index];

//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => DetailPage(
//                         image: "images/medicine.png",
//                         name: ds["Name"],
//                         price: "\$${ds["Price"]}",
//                         description: ds["Product Description"] ??
//                             "No description available",

//                         /// ✅ PASS WALLET DATA
//                         walletBalance: walletBalance,
//                         updateWalletBalance: (int newBalance) {
//                           setState(() {
//                             walletBalance = newBalance;
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   width: 280,
//                   margin: const EdgeInsets.only(right: 20),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: const Color(0xffcfc8bb),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.asset(
//                           "images/medicine.png",
//                           height: 160,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 16),
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(230, 200, 193, 181),
//                           borderRadius: BorderRadius.circular(18),
//                           border: Border.all(color: Colors.black, width: 1.2),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     ds["Name"],
//                                     style: AppWidget.blackTextStyle(16),
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 Text(
//                                   "\$${ds["Price"]}",
//                                   style: AppWidget.blackTextStyle(16),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               ds["BrandName"],
//                               style: AppWidget.blackTextStyle(13),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TOP IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 "images/pharmacy.jpg",
//                 width: 150,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// TITLE
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Your Trusted",
//                     style: AppWidget.headlineTextStyle(26)),
//                 Text("Online Pharmacy",
//                     style: AppWidget.lightTextStyle(28)),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// MAIN CONTENT
//           Expanded(
//             child: ListView(
//               padding:
//                   const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               children: [
//                 /// SEARCH BAR
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 30),
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 225, 219, 248),
//                       borderRadius: BorderRadius.circular(30),
//                       border:
//                           Border.all(color: Colors.white, width: 1.5),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Medicine...",
//                         hintStyle: AppWidget.lightTextStyle(18),
//                         suffixIcon: Container(
//                           margin: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: const Icon(Icons.search,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// CATEGORIES
//                 SizedBox(
//                   height: 50,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       allmedicine
//                           ? AppWidget.selectedCategory("All Medicine")
//                           : _category("All Medicine", () async {
//                               allmedicine = true;
//                               supplement = vitamins = herbal = false;
//                               productStream = await DatabaseMethods()
//                                   .getallProducts("Medicine");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       supplement
//                           ? AppWidget.selectedCategory("Supplements")
//                           : _category("Supplements", () async {
//                               allmedicine = false;
//                               supplement = true;
//                               vitamins = herbal = false;
//                               productStream = await DatabaseMethods()
//                                   .getallProducts("Supplements");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       vitamins
//                           ? AppWidget.selectedCategory("Vitamins")
//                           : _category("Vitamins", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = true;
//                               herbal = false;
//                               productStream = await DatabaseMethods()
//                                   .getallProducts("Vitamins");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       herbal
//                           ? AppWidget.selectedCategory("Herbal")
//                           : _category("Herbal", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = false;
//                               herbal = true;
//                               productStream = await DatabaseMethods()
//                                   .getallProducts("Herbal");
//                               setState(() {});
//                             }),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// PRODUCTS
//                 allProducts(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _category(String title, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Center(
//         child: Text(title, style: AppWidget.lightTextStyle(20)),
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:online_pharmacy/pages/detail_page.dart';

// class Home extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Home({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;
//   Stream? productStream;

//   late int walletBalance;

//   @override
//   void initState() {
//     super.initState();
//     walletBalance = widget.walletBalance;
//     getOnLoad();
//   }

//   Future<void> getOnLoad() async {
//     productStream = await DatabaseMethods().getallProducts("Medicine");
//     setState(() {});
//   }

//   /// ================= HORIZONTAL PRODUCTS =================
//   Widget allProducts() {
//     return SizedBox(
//       height: 320,
//       child: StreamBuilder(
//         stream: productStream,
//         builder: (context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             );
//           }

//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data.docs.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot ds = snapshot.data.docs[index];

//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => DetailPage(
//                         image: "images/medicine.png",
//                         name: ds["Name"],
//                         price: "\$${ds["Price"]}",
//                         description:
//                             ds["Product Description"] ?? "No description available",
//                         walletBalance: walletBalance,
//                         updateWalletBalance: (int newBalance) {
//                           setState(() => walletBalance = newBalance);
//                           widget.updateWalletBalance(newBalance);
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   width: 280,
//                   margin: const EdgeInsets.only(right: 20),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.asset(
//                           "images/medicine.png",
//                           height: 160,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 16),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.surface,
//                           borderRadius: BorderRadius.circular(18),
//                           border: Border.all(
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .outline
//                                 .withOpacity(0.3),
//                           ),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     ds["Name"],
//                                     style:
//                                         Theme.of(context).textTheme.bodyLarge,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 Text(
//                                   "\$${ds["Price"]}",
//                                   style:
//                                       Theme.of(context).textTheme.bodyLarge,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               ds["BrandName"],
//                               style:
//                                   Theme.of(context).textTheme.bodySmall,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TOP IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 "images/pharmacy.jpg",
//                 width: 150,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// TITLE
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Your Trusted",
//                     style: AppWidget.headlineTextStyle(26)),
//                 Text("Online Pharmacy",
//                     style: AppWidget.lightTextStyle(28)),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// MAIN CONTENT
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               children: [
//                 /// SEARCH BAR
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 30),
//                     decoration: BoxDecoration(
//                       color: theme.cardColor,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(
//                         color: theme.colorScheme.outline.withOpacity(0.3),
//                       ),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Medicine...",
//                         hintStyle: AppWidget.lightTextStyle(18),
//                         suffixIcon: Container(
//                           margin: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             color: theme.colorScheme.primary,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: const Icon(Icons.search,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// CATEGORIES
//                 SizedBox(
//                   height: 50,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       allmedicine
//                           ? AppWidget.selectedCategory("All Medicine")
//                           : _category("All Medicine", () async {
//                               allmedicine = true;
//                               supplement = vitamins = herbal = false;
//                               productStream = await DatabaseMethods()
//                                   .getallProducts("Medicine");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       supplement
//                           ? AppWidget.selectedCategory("Supplements")
//                           : _category("Supplements", () async {
//                               allmedicine = false;
//                               supplement = true;
//                               vitamins = herbal = false;
//                               productStream = await DatabaseMethods()
//                                   .getallProducts("Supplements");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       vitamins
//                           ? AppWidget.selectedCategory("Vitamins")
//                           : _category("Vitamins", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = true;
//                               herbal = false;
//                               productStream = await DatabaseMethods()
//                                   .getallProducts("Vitamins");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       herbal
//                           ? AppWidget.selectedCategory("Herbal")
//                           : _category("Herbal", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = false;
//                               herbal = true;
//                               productStream = await DatabaseMethods()
//                                   .getallProducts("Herbal");
//                               setState(() {});
//                             }),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// PRODUCTS
//                 allProducts(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _category(String title, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Center(
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:online_pharmacy/pages/detail_page.dart';

// class Home extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Home({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;
//   Stream? productStream;

//   late int walletBalance;

//   @override
//   void initState() {
//     super.initState();
//     walletBalance = widget.walletBalance;
//     getOnLoad();
//   }

//   Future<void> getOnLoad() async {
//     productStream = await DatabaseMethods().getallProducts("Medicine");
//     setState(() {});
//   }

//   /// ================= HORIZONTAL PRODUCTS =================
//   Widget allProducts() {
//     return SizedBox(
//       height: 320,
//       child: StreamBuilder(
//         stream: productStream,
//         builder: (context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             );
//           }

//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data.docs.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot ds = snapshot.data.docs[index];

//               final String imageUrl = ds.data().toString().contains("image_url")
//                   ? ds["image_url"]
//                   : "";

//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => DetailPage(
//                         image: imageUrl,
//                         name: ds["product_name"],
//                         price: "\$${ds["price"]}",
//                         description:
//                             ds["description"] ?? "No description available",
//                         walletBalance: walletBalance,
//                         updateWalletBalance: (int newBalance) {
//                           setState(() => walletBalance = newBalance);
//                           widget.updateWalletBalance(newBalance);
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   width: 280,
//                   margin: const EdgeInsets.only(right: 20),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.network(
//                           imageUrl,
//                           height: 160,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Image.asset(
//                               "images/medicine.png",
//                               height: 160,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 16),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.surface,
//                           borderRadius: BorderRadius.circular(18),
//                           border: Border.all(
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .outline
//                                 .withOpacity(0.3),
//                           ),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     ds["product_name"],
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 Text(
//                                   "\$${ds["price"]}",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyLarge,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               ds["brand_name"],
//                               style:
//                                   Theme.of(context).textTheme.bodySmall,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TOP IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 "images/pharmacy.jpg",
//                 width: 150,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// TITLE
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Your Trusted",
//                     style: AppWidget.headlineTextStyle(26)),
//                 Text("Online Pharmacy",
//                     style: AppWidget.lightTextStyle(28)),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           /// MAIN CONTENT
//           Expanded(
//             child: ListView(
//               padding:
//                   const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               children: [
//                 /// SEARCH BAR
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 30),
//                     decoration: BoxDecoration(
//                       color: theme.cardColor,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(
//                         color:
//                             theme.colorScheme.outline.withOpacity(0.3),
//                       ),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Medicine...",
//                         hintStyle: AppWidget.lightTextStyle(18),
//                         suffixIcon: Container(
//                           margin: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             color: theme.colorScheme.primary,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: const Icon(Icons.search,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// CATEGORIES
//                 SizedBox(
//                   height: 50,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       allmedicine
//                           ? AppWidget.selectedCategory("All Medicine")
//                           : _category("All Medicine", () async {
//                               allmedicine = true;
//                               supplement = vitamins = herbal = false;
//                               productStream =
//                                   await DatabaseMethods()
//                                       .getallProducts("Medicine");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       supplement
//                           ? AppWidget.selectedCategory("Supplements")
//                           : _category("Supplements", () async {
//                               allmedicine = false;
//                               supplement = true;
//                               vitamins = herbal = false;
//                               productStream =
//                                   await DatabaseMethods()
//                                       .getallProducts("Supplements");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       vitamins
//                           ? AppWidget.selectedCategory("Vitamins")
//                           : _category("Vitamins", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = true;
//                               herbal = false;
//                               productStream =
//                                   await DatabaseMethods()
//                                       .getallProducts("Vitamins");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       herbal
//                           ? AppWidget.selectedCategory("Herbal")
//                           : _category("Herbal", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = false;
//                               herbal = true;
//                               productStream =
//                                   await DatabaseMethods()
//                                       .getallProducts("Herbal");
//                               setState(() {});
//                             }),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// PRODUCTS
//                 allProducts(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _category(String title, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Center(
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ),
//     );
//   }
// }


/////////////WORKING SAHI TRHA NEECHE WALA///////////

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:online_pharmacy/pages/detail_page.dart';

// class Home extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Home({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool allmedicine = true, supplement = false, vitamins = false, herbal = false;
//   Stream? productStream;
//   late int walletBalance;

//   @override
//   void initState() {
//     super.initState();
//     walletBalance = widget.walletBalance;
//     getOnLoad();
//   }

//   Future<void> getOnLoad() async {
//     productStream = await DatabaseMethods().getallProducts("Medicine");
//     setState(() {});
//   }

//   /// ================= HORIZONTAL PRODUCTS =================
//   Widget allProducts() {
//     return SizedBox(
//       height: 320,
//       child: StreamBuilder(
//         stream: productStream,
//         builder: (context, AsyncSnapshot snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             );
//           }

//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data.docs.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot ds = snapshot.data.docs[index];
//               final String imageUrl = ds.data().toString().contains("image_url")
//                   ? ds["image_url"]
//                   : "";

//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => DetailPage(
//                         image: imageUrl,
//                         name: ds["product_name"],
//                         price: "\$${ds["price"]}",
//                         description: ds["description"] ?? "No description available",
//                         walletBalance: walletBalance,
//                         updateWalletBalance: (int newBalance) {
//                           setState(() => walletBalance = newBalance);
//                           widget.updateWalletBalance(newBalance);
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   width: 280,
//                   margin: const EdgeInsets.only(right: 20),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: Image.network(
//                           imageUrl,
//                           height: 200,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Image.asset(
//                               "images/medicine.png",
//                               height: 200,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                         decoration: BoxDecoration(
//                           color: Theme.of(context).colorScheme.surface,
//                           borderRadius: BorderRadius.circular(18),
//                           border: Border.all(
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .outline
//                                 .withOpacity(0.3),
//                           ),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     ds["product_name"],
//                                     style: Theme.of(context).textTheme.bodyLarge,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 Text(
//                                   "\$${ds["price"]}",
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 2),
//                             Text(
//                               ds["brand_name"],
//                               style: Theme.of(context).textTheme.bodySmall,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   /// ================= UI =================
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TOP IMAGE
//           Padding(
//             padding: const EdgeInsets.only(top: 50, left: 20),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//                 "images/pharmacy.jpg",
//                 width: 150,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),

//           /// TITLE
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Your Trusted", style: AppWidget.headlineTextStyle(26)),
//                 Text("Online Pharmacy", style: AppWidget.lightTextStyle(28)),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),

//           /// MAIN CONTENT
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               children: [
//                 /// SEARCH BAR
//                 Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: Container(
//                     padding: const EdgeInsets.only(left: 30),
//                     decoration: BoxDecoration(
//                       color: theme.cardColor,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(
//                         color: theme.colorScheme.outline.withOpacity(0.3),
//                       ),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Medicine...",
//                         hintStyle: AppWidget.lightTextStyle(18),
//                         suffixIcon: Container(
//                           margin: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             color: theme.colorScheme.primary,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: const Icon(Icons.search, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 /// CATEGORIES
//                 SizedBox(
//                   height: 50,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       allmedicine
//                           ? AppWidget.selectedCategory("All Medicine")
//                           : _category("All Medicine", () async {
//                               allmedicine = true;
//                               supplement = vitamins = herbal = false;
//                               productStream =
//                                   await DatabaseMethods().getallProducts("Medicine");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       supplement
//                           ? AppWidget.selectedCategory("Supplements")
//                           : _category("Supplements", () async {
//                               allmedicine = false;
//                               supplement = true;
//                               vitamins = herbal = false;
//                               productStream =
//                                   await DatabaseMethods().getallProducts("Supplements");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       vitamins
//                           ? AppWidget.selectedCategory("Vitamins")
//                           : _category("Vitamins", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = true;
//                               herbal = false;
//                               productStream =
//                                   await DatabaseMethods().getallProducts("Vitamins");
//                               setState(() {});
//                             }),
//                       const SizedBox(width: 30),
//                       herbal
//                           ? AppWidget.selectedCategory("Herbal")
//                           : _category("Herbal", () async {
//                               allmedicine = false;
//                               supplement = false;
//                               vitamins = false;
//                               herbal = true;
//                               productStream =
//                                   await DatabaseMethods().getallProducts("Herbal");
//                               setState(() {});
//                             }),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 /// PRODUCTS
//                 allProducts(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _category(String title, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Center(
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ),
//     );
//   }
// }

/////WORKING SAHI TRHA UPER WALA////


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_pharmacy/services/database.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';
import 'package:online_pharmacy/pages/detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  final int walletBalance;
  final Function(int) updateWalletBalance;

  const Home({
    super.key,
    required this.walletBalance,
    required this.updateWalletBalance,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool allmedicine = true, supplement = false, vitamins = false, herbal = false;
  Stream? productStream;
  late int walletBalance;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    walletBalance = widget.walletBalance;
    getOnLoad();
    fetchWallet();
  }

  /// ================= FETCH WALLET =================
  Future<void> fetchWallet() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get();

    if (doc.exists) {
      walletBalance = doc["wallet"];
      widget.updateWalletBalance(walletBalance);
      setState(() {});
    }
  }

  Future<void> getOnLoad() async {
    productStream = await DatabaseMethods().getallProducts("Medicine");
    setState(() {});
  }

  /// ================= HORIZONTAL PRODUCTS =================
  Widget allProducts() {
    return SizedBox(
      height: 650,
      child: StreamBuilder(
        stream: productStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          }

          // Filter products by search query
          final filteredDocs = snapshot.data.docs.where((ds) {
            return ds["product_name"]
                .toString()
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
          }).toList();

          return GridView.builder(
  scrollDirection: Axis.horizontal,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // ✅ 2 rows
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    childAspectRatio: 0.65, // adjust card height/width
  ),
            itemCount: filteredDocs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = filteredDocs[index];

              final String imageUrl =
                  ds.data().toString().contains("image_url")
                      ? ds["image_url"]
                      : "";

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        image: imageUrl,
                        name: ds["product_name"],
                        price: "\$${ds["price"]}",
                        description:
                            ds["description"] ?? "No description available",
                        walletBalance: walletBalance,
                        updateWalletBalance: (int newBalance) {
                          setState(() => walletBalance = newBalance);
                          widget.updateWalletBalance(newBalance);
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 280,
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return Image.asset(
                              "images/medicine.png",
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .outline
                                .withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    ds["product_name"],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "\$${ds["price"]}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge,
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              ds["brand_name"],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// ================= UI =================
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                "images/pharmacy.jpg",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Trusted",
                    style: AppWidget.headlineTextStyle(26)),
                Text("Online Pharmacy",
                    style: AppWidget.lightTextStyle(28)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              children: [
                /// ================= SEARCH FIELD =================
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    padding: const EdgeInsets.only(left: 30),
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: theme.colorScheme.outline.withOpacity(0.3),
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Medicine...",
                        hintStyle: AppWidget.lightTextStyle(18),
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(Icons.search,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      allmedicine
                          ? AppWidget.selectedCategory("All Medicine")
                          : _category("All Medicine", () async {
                              allmedicine = true;
                              supplement = vitamins = herbal = false;
                              productStream =
                                  await DatabaseMethods()
                                      .getallProducts("Medicine");
                              setState(() {});
                            }),
                      const SizedBox(width: 30),
                      supplement
                          ? AppWidget.selectedCategory("Supplements")
                          : _category("Supplements", () async {
                              allmedicine = false;
                              supplement = true;
                              vitamins = herbal = false;
                              productStream =
                                  await DatabaseMethods()
                                      .getallProducts("Supplements");
                              setState(() {});
                            }),
                      const SizedBox(width: 30),
                      vitamins
                          ? AppWidget.selectedCategory("Vitamins")
                          : _category("Vitamins", () async {
                              allmedicine = false;
                              supplement = false;
                              vitamins = true;
                              herbal = false;
                              productStream =
                                  await DatabaseMethods()
                                      .getallProducts("Vitamins");
                              setState(() {});
                            }),
                      const SizedBox(width: 30),
                      herbal
                          ? AppWidget.selectedCategory("Herbal")
                          : _category("Herbal", () async {
                              allmedicine = false;
                              supplement = false;
                              vitamins = false;
                              herbal = true;
                              productStream =
                                  await DatabaseMethods()
                                      .getallProducts("Herbal");
                              setState(() {});
                            }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                allProducts(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _category(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
