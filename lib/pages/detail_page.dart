// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class DetailPage extends StatefulWidget {
//   final String image;
//   final String name;
//   final String price;
//   final String description;

//   const DetailPage({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.description,
//   });

//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   int quantity = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// BACK BUTTON
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30.0),
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                       ),
//                       child: const Icon(Icons.arrow_back, color: Colors.black),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// MEDICINE IMAGE
//                 Center(
//                   child: Image.asset(
//                     widget.image,
//                     width: MediaQuery.of(context).size.width * 0.7,
//                     height: MediaQuery.of(context).size.height * 0.45,
//                     fit: BoxFit.contain,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// DETAILS CARD
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   margin: const EdgeInsets.symmetric(horizontal: 30),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(122, 255, 255, 255),
//                     border: Border.all(color: Colors.white, width: 2),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// TITLE & QUANTITY
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Text(widget.name, style: AppWidget.headlineTextStyle(20)),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(159, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     if (quantity > 1) setState(() => quantity--);
//                                   },
//                                   child: const Icon(Icons.remove, color: Colors.black),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Text(quantity.toString(), style: AppWidget.headlineTextStyle(18)),
//                                 const SizedBox(width: 12),
//                                 GestureDetector(
//                                   onTap: () => setState(() => quantity++),
//                                   child: const Icon(Icons.add, color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       /// DESCRIPTION
//                       Text("Description", style: AppWidget.lightTextStyle(16)),
//                       const SizedBox(height: 10),
//                       Text(widget.description, style: AppWidget.lightTextStyle(15)),

//                       const SizedBox(height: 20),

//                       /// PRICE & ORDER BUTTON
//                       Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(159, 255, 255, 255),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Total Price", style: AppWidget.lightTextStyle(16)),
//                                 Text(widget.price, style: AppWidget.headlineTextStyle(20)),
//                               ],
//                             ),
//                             Container(
//                               height: 50,
//                               width: 180,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text("Order Now", style: AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class DetailPage extends StatefulWidget {
//   final String image;
//   final String name;
//   final String price;
//   final String description;

//   const DetailPage({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.description,
//   });

//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   int quantity = 1;

//   /// Calculate total price dynamically
//   double get totalPrice {
//     // Remove any non-numeric characters and parse as double
//     double price = double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
//     return price * quantity;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// BACK BUTTON
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30.0),
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                       ),
//                       child: const Icon(Icons.arrow_back, color: Colors.black),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// MEDICINE IMAGE
//                 Center(
//                   child: Image.asset(
//                     widget.image,
//                     width: MediaQuery.of(context).size.width * 0.7,
//                     height: MediaQuery.of(context).size.height * 0.45,
//                     fit: BoxFit.contain,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// DETAILS CARD
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   margin: const EdgeInsets.symmetric(horizontal: 30),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(122, 255, 255, 255),
//                     border: Border.all(color: Colors.white, width: 2),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// TITLE & QUANTITY
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Text(widget.name, style: AppWidget.headlineTextStyle(20)),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(159, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     if (quantity > 1) setState(() => quantity--);
//                                   },
//                                   child: const Icon(Icons.remove, color: Colors.black),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Text(quantity.toString(), style: AppWidget.headlineTextStyle(18)),
//                                 const SizedBox(width: 12),
//                                 GestureDetector(
//                                   onTap: () => setState(() => quantity++),
//                                   child: const Icon(Icons.add, color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       /// DESCRIPTION
//                       Text("Description", style: AppWidget.lightTextStyle(16)),
//                       const SizedBox(height: 10),
//                       Text(widget.description, style: AppWidget.lightTextStyle(15)),

//                       const SizedBox(height: 20),

//                       /// PRICE & ORDER BUTTON
//                       Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(159, 255, 255, 255),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Total Price", style: AppWidget.lightTextStyle(16)),
//                                 Text(
//                                   "\$${totalPrice.toStringAsFixed(2)}",
//                                   style: AppWidget.headlineTextStyle(20),
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               height: 50,
//                               width: 180,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text("Order Now", style: AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class DetailPage extends StatefulWidget {
//   final String image;
//   final String name;
//   final String price;
//   final String description;

//   const DetailPage({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.description,
//   });

//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   int quantity = 1;

//   /// Calculate total price dynamically
//   double get totalPrice {
//     double price = double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
//     return price * quantity;
//   }

//   /// Save order to Firestore
//   Future<void> placeOrder() async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').add({
//         'product_name': widget.name,
//         'quantity': quantity,
//         'total_price': totalPrice,
//         'image': widget.image,
//         'ordered_at': Timestamp.now(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("${widget.name} x $quantity added to your orders!")),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to place order: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// BACK BUTTON
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30.0),
//                   child: GestureDetector(
//                     onTap: () => Navigator.pop(context),
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                       ),
//                       child: const Icon(Icons.arrow_back, color: Colors.black),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// MEDICINE IMAGE
//                 Center(
//                   child: Image.asset(
//                     widget.image,
//                     width: MediaQuery.of(context).size.width * 0.7,
//                     height: MediaQuery.of(context).size.height * 0.45,
//                     fit: BoxFit.contain,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// DETAILS CARD
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   margin: const EdgeInsets.symmetric(horizontal: 30),
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(122, 255, 255, 255),
//                     border: Border.all(color: Colors.white, width: 2),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /// TITLE & QUANTITY
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             child: Text(widget.name, style: AppWidget.headlineTextStyle(20)),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(159, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Row(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     if (quantity > 1) setState(() => quantity--);
//                                   },
//                                   child: const Icon(Icons.remove, color: Colors.black),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Text(quantity.toString(), style: AppWidget.headlineTextStyle(18)),
//                                 const SizedBox(width: 12),
//                                 GestureDetector(
//                                   onTap: () => setState(() => quantity++),
//                                   child: const Icon(Icons.add, color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 20),

//                       /// DESCRIPTION
//                       Text("Description", style: AppWidget.lightTextStyle(16)),
//                       const SizedBox(height: 10),
//                       Text(widget.description, style: AppWidget.lightTextStyle(15)),

//                       const SizedBox(height: 20),

//                       /// PRICE & ORDER BUTTON
//                       Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: const Color.fromARGB(159, 255, 255, 255),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Total Price", style: AppWidget.lightTextStyle(16)),
//                                 Text(
//                                   "\$${totalPrice.toStringAsFixed(2)}",
//                                   style: AppWidget.headlineTextStyle(20),
//                                 ),
//                               ],
//                             ),

//                             /// ✅ ORDER NOW BUTTON
//                             GestureDetector(
//                               onTap: placeOrder,
//                               child: Container(
//                                 height: 50,
//                                 width: 180,
//                                 decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: Center(
//                                   child: Text("Order Now", style: AppWidget.whiteTextStyle(18)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class DetailPage extends StatefulWidget {
//   final String image;
//   final String name;
//   final String price;
//   final String description;

//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const DetailPage({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.description,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   int quantity = 1;

//   double get unitPrice =>
//       double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

//   double get totalPrice => unitPrice * quantity;

//   /// ================= PLACE ORDER =================
//   Future<void> placeOrder() async {
//     if (widget.walletBalance < totalPrice) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Insufficient wallet balance"),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     try {
//       // 1️⃣ Deduct wallet
//       widget.updateWalletBalance(
//         widget.walletBalance - totalPrice.toInt(),
//       );

//       // 2️⃣ Save order to Firestore
//       await FirebaseFirestore.instance.collection('orders').add({
//         'product_name': widget.name,
//         'quantity': quantity,
//         'unit_price': unitPrice,
//         'total_price': totalPrice,
//         'image': widget.image,
//         'ordered_at': Timestamp.now(),
//       });

//       // 3️⃣ Success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("${widget.name} x $quantity ordered successfully"),
//           backgroundColor: Colors.green,
//         ),
//       );

//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Failed to place order: $e"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.only(top: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// BACK BUTTON
//               Padding(
//                 padding: const EdgeInsets.only(left: 30),
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(60),
//                     ),
//                     child: const Icon(Icons.arrow_back),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               /// IMAGE
//               Center(
//                 child: Image.asset(
//                   widget.image,
//                   width: MediaQuery.of(context).size.width * 0.7,
//                   height: MediaQuery.of(context).size.height * 0.45,
//                   fit: BoxFit.contain,
//                 ),
//               ),

//               const SizedBox(height: 20),

//               /// DETAILS
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(122, 255, 255, 255),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.white, width: 2),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// TITLE + QUANTITY
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             widget.name,
//                             style: AppWidget.headlineTextStyle(20),
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(159, 255, 255, 255),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   if (quantity > 1) {
//                                     setState(() => quantity--);
//                                   }
//                                 },
//                                 child: const Icon(Icons.remove),
//                               ),
//                               const SizedBox(width: 12),
//                               Text(
//                                 quantity.toString(),
//                                 style: AppWidget.headlineTextStyle(18),
//                               ),
//                               const SizedBox(width: 12),

//                               /// ✅ PREVENT EXCEEDING WALLET
//                               GestureDetector(
//                                 onTap: () {
//                                   final nextTotal =
//                                       (quantity + 1) * unitPrice;

//                                   if (nextTotal > widget.walletBalance) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                         content: Text(
//                                             "Wallet balance is too low"),
//                                         backgroundColor: Colors.orange,
//                                       ),
//                                     );
//                                     return;
//                                   }

//                                   setState(() => quantity++);
//                                 },
//                                 child: const Icon(Icons.add),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 20),

//                     /// DESCRIPTION
//                     Text("Description",
//                         style: AppWidget.lightTextStyle(16)),
//                     const SizedBox(height: 10),
//                     Text(widget.description,
//                         style: AppWidget.lightTextStyle(15)),

//                     const SizedBox(height: 20),

//                     /// WALLET INFO
//                     Text(
//                       "Wallet Balance: \$${widget.walletBalance}",
//                       style: AppWidget.lightTextStyle(16),
//                     ),

//                     const SizedBox(height: 15),

//                     /// PRICE + ORDER
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(159, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Total Price",
//                                   style: AppWidget.lightTextStyle(16)),
//                               Text(
//                                 "\$${totalPrice.toStringAsFixed(2)}",
//                                 style: AppWidget.headlineTextStyle(20),
//                               ),
//                             ],
//                           ),

//                           /// ORDER NOW
//                           GestureDetector(
//                             onTap: placeOrder,
//                             child: Container(
//                               height: 50,
//                               width: 180,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text("Order Now",
//                                     style: AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
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
// }

/////////WRKING SAHI WLA NEECHE WALA

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class DetailPage extends StatefulWidget {
//   final String image;
//   final String name;
//   final String price;
//   final String description;

//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const DetailPage({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//     required this.description,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   int quantity = 1;

//   double get unitPrice =>
//       double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

//   double get totalPrice => unitPrice * quantity;

//   /// ================= PLACE ORDER =================
//   Future<void> placeOrder() async {
//     if (totalPrice > widget.walletBalance) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Insufficient wallet balance"),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     try {
//       // Deduct wallet
//       int remainingWallet = widget.walletBalance - totalPrice.toInt();
//       widget.updateWalletBalance(remainingWallet);

//       // Save order to Firestore
//       await FirebaseFirestore.instance.collection('orders').add({
//         'product_name': widget.name,
//         'quantity': quantity,
//         'unit_price': unitPrice,
//         'total_price': totalPrice,
//         'image': widget.image,
//         'ordered_at': Timestamp.now(),
//       });

//       // Success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("${widget.name} x $quantity ordered successfully"),
//           backgroundColor: Colors.green,
//         ),
//       );

//       Navigator.pop(context);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Failed to place order: $e"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   void incrementQuantity() {
//     final nextTotal = (quantity + 1) * unitPrice;
//     if (nextTotal > widget.walletBalance) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Wallet balance is too low"),
//           backgroundColor: Colors.orange,
//         ),
//       );
//       return;
//     }
//     setState(() => quantity++);
//   }

//   void decrementQuantity() {
//     if (quantity > 1) setState(() => quantity--);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.only(top: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// BACK BUTTON
//               Padding(
//                 padding: const EdgeInsets.only(left: 30),
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(60),
//                     ),
//                     child: const Icon(Icons.arrow_back),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               /// IMAGE
//               /// IMAGE
// Center(
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(20),
//     child: Image.network(
//       widget.image,
//       width: MediaQuery.of(context).size.width * 0.7,
//       height: MediaQuery.of(context).size.height * 0.45,
//       fit: BoxFit.contain,
//       errorBuilder: (context, error, stackTrace) {
//         return Image.asset(
//           "images/medicine.png",
//           width: MediaQuery.of(context).size.width * 0.7,
//           height: MediaQuery.of(context).size.height * 0.45,
//           fit: BoxFit.contain,
//         );
//       },
//       loadingBuilder: (context, child, loadingProgress) {
//         if (loadingProgress == null) return child;
//         return SizedBox(
//           height: 200,
//           child: Center(
//             child: CircularProgressIndicator(
//               color: Theme.of(context).colorScheme.primary,
//             ),
//           ),
//         );
//       },
//     ),
//   ),
// ),


//               const SizedBox(height: 20),

//               /// DETAILS
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(122, 255, 255, 255),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.white, width: 2),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// TITLE + QUANTITY
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             widget.name,
//                             style: AppWidget.headlineTextStyle(20),
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 15, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(159, 255, 255, 255),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: decrementQuantity,
//                                 child: const Icon(Icons.remove),
//                               ),
//                               const SizedBox(width: 12),
//                               Text(
//                                 quantity.toString(),
//                                 style: AppWidget.headlineTextStyle(18),
//                               ),
//                               const SizedBox(width: 12),
//                               GestureDetector(
//                                 onTap: incrementQuantity,
//                                 child: const Icon(Icons.add),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 20),

//                     /// DESCRIPTION
//                     Text("Description", style: AppWidget.lightTextStyle(16)),
//                     const SizedBox(height: 10),
//                     Text(widget.description, style: AppWidget.lightTextStyle(15)),

//                     const SizedBox(height: 20),

//                     /// WALLET INFO
//                     Text(
//                       "Wallet Balance: \$${widget.walletBalance}",
//                       style: AppWidget.lightTextStyle(16),
//                     ),

//                     const SizedBox(height: 15),

//                     /// PRICE + ORDER
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(159, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Total Price",
//                                   style: AppWidget.lightTextStyle(16)),
//                               Text(
//                                 "\$${totalPrice.toStringAsFixed(2)}",
//                                 style: AppWidget.headlineTextStyle(20),
//                               ),
//                             ],
//                           ),

//                           /// ORDER NOW
//                           GestureDetector(
//                             onTap: placeOrder,
//                             child: Container(
//                               height: 50,
//                               width: 180,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text("Order Now",
//                                     style: AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
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
// }
//////////WORKING SAHI WALA UPEER WALA

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailPage extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String description;

  final int walletBalance;
  final Function(int) updateWalletBalance;

  const DetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.walletBalance,
    required this.updateWalletBalance,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  double get unitPrice =>
      double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

  double get totalPrice => unitPrice * quantity;

  /// ================= DEDUCT WALLET & LOG TRANSACTION =================
  Future<void> deductWallet(int amount) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

    // Get existing transactions
    final snapshot = await userRef.get();
    List<Map<String, dynamic>> transactions = [];
    if (snapshot.exists) {
      transactions = List<Map<String, dynamic>>.from(snapshot.get('transactions') ?? []);
    }

    // Create debit transaction
    final newTransaction = {
      'title': 'Order Payment',
      'subtitle': 'Purchased ${widget.name} x $quantity',
      'amount': -amount,
      'date': DateTime.now().toIso8601String(),
      'image': 'images/credit-card-payment.png', // debit icon
    };
    transactions.insert(0, newTransaction);

    int newBalance = widget.walletBalance - amount;

    // Update Firestore
    await userRef.set({
      'walletBalance': newBalance,
      'transactions': transactions,
    }, SetOptions(merge: true));

    // Update UI
    widget.updateWalletBalance(newBalance);
  }

  /// ================= PLACE ORDER =================
  Future<void> placeOrder() async {
    if (totalPrice > widget.walletBalance) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Insufficient wallet balance"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      // Step 1: Save order to Firestore first
      await FirebaseFirestore.instance.collection('orders').add({
        'product_name': widget.name,
        'quantity': quantity,
        'unit_price': unitPrice,
        'total_price': totalPrice,
        'image': widget.image,
        'ordered_at': Timestamp.now(),
        'user_id': FirebaseAuth.instance.currentUser!.uid,
      });

      // Step 2: Deduct wallet only after order succeeds
      await deductWallet(totalPrice.toInt());

      // Step 3: Show success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${widget.name} x $quantity ordered successfully"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to place order: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void incrementQuantity() {
    final nextTotal = (quantity + 1) * unitPrice;
    if (nextTotal > widget.walletBalance) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Wallet balance is too low"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    setState(() => quantity++);
  }

  void decrementQuantity() {
    if (quantity > 1) setState(() => quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// BACK BUTTON
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// IMAGE
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.image,
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.45,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "images/medicine.png",
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.45,
                        fit: BoxFit.contain,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// DETAILS
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(122, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE + QUANTITY
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: AppWidget.headlineTextStyle(20),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(159, 255, 255, 255),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: decrementQuantity,
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                quantity.toString(),
                                style: AppWidget.headlineTextStyle(18),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: incrementQuantity,
                                child: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// DESCRIPTION
                    Text("Description", style: AppWidget.lightTextStyle(16)),
                    const SizedBox(height: 10),
                    Text(widget.description, style: AppWidget.lightTextStyle(15)),
                    const SizedBox(height: 20),

                    

                    /// PRICE + ORDER
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(159, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Price", style: AppWidget.lightTextStyle(16)),
                              Text(
                                "\$${totalPrice.toStringAsFixed(2)}",
                                style: AppWidget.headlineTextStyle(20),
                              ),
                            ],
                          ),

                          /// ORDER NOW
                          GestureDetector(
                            onTap: placeOrder,
                            child: Container(
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text("Order Now", style: AppWidget.whiteTextStyle(18)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
