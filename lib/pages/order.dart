// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Order extends StatefulWidget {
//   const Order({super.key});

//   @override
//   State<Order> createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Order Page", style: AppWidget.headlineTextStyle(30.0)),
//               const SizedBox(height: 20),

//               Expanded(
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('orders')
//                       .orderBy('ordered_at', descending: true)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return const Center(child: Text("No orders placed yet."));
//                     }

//                     final orders = snapshot.data!.docs;

//                     return ListView.builder(
//                       itemCount: orders.length,
//                       itemBuilder: (context, index) {
//                         final order = orders[index];

//                         return Container(
//                           margin: const EdgeInsets.only(bottom: 20),
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 225, 219, 248),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               /// Product Image
//                               Container(
//                                 decoration: BoxDecoration(
//                                   gradient: const LinearGradient(
//                                     colors: [
//                                       Color(0xffbab3a6),
//                                       Color(0xffddd7cd),
//                                       Color(0xffa59c8f)
//                                     ],
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                   ),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: Image.asset(
//                                   order['image'],
//                                   height: 120,
//                                   width: 120,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),

//                               const SizedBox(width: 20),

//                               /// Product Details
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       order['product_name'],
//                                       style: AppWidget.headlineTextStyle(20.0),
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Text(
//                                       "Quantity: ${order['quantity']}",
//                                       style: AppWidget.headlineTextStyle(18.0),
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Text(
//                                       "Total Price: \$${order['total_price'].toStringAsFixed(2)}",
//                                       style: AppWidget.headlineTextStyle(18.0),
//                                     ),
//                                     const SizedBox(height: 5),
//                                     Text(
//                                       "Ordered on: ${order['ordered_at'].toDate().toString().split('.')[0]}",
//                                       style: AppWidget.lightTextStyle(14.0),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Order extends StatefulWidget {
//   const Order({super.key});

//   @override
//   State<Order> createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Order Page", style: AppWidget.headlineTextStyle(30.0)),
//               const SizedBox(height: 20),

//               /// Orders List
//               Expanded(
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('orders')
//                       .orderBy('ordered_at', descending: true)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return const Center(child: Text("No orders placed yet."));
//                     }

//                     final orders = snapshot.data!.docs;

//                     // Calculate total price
//                     double totalPrice = 0;
//                     for (var order in orders) {
//                       totalPrice += (order['total_price'] as num).toDouble();
//                     }

//                     return Column(
//                       children: [
//                         /// Orders ListView
//                         Expanded(
//                           child: ListView.builder(
//                             itemCount: orders.length,
//                             itemBuilder: (context, index) {
//                               final order = orders[index];

//                               return Container(
//                                 margin: const EdgeInsets.only(bottom: 20),
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 225, 219, 248),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     /// Product Image
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         gradient: const LinearGradient(
//                                           colors: [
//                                             Color(0xffbab3a6),
//                                             Color(0xffddd7cd),
//                                             Color(0xffa59c8f)
//                                           ],
//                                           begin: Alignment.topLeft,
//                                           end: Alignment.bottomRight,
//                                         ),
//                                         borderRadius: BorderRadius.circular(30),
//                                       ),
//                                       child: Image.asset(
//                                         order['image'],
//                                         height: 120,
//                                         width: 120,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),

//                                     const SizedBox(width: 20),

//                                     /// Product Details
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             order['product_name'],
//                                             style: AppWidget.headlineTextStyle(20.0),
//                                           ),
//                                           const SizedBox(height: 5),
//                                           Text(
//                                             "Quantity: ${order['quantity']}",
//                                             style: AppWidget.headlineTextStyle(18.0),
//                                           ),
//                                           const SizedBox(height: 5),
//                                           Text(
//                                             "Total Price: \$${order['total_price'].toStringAsFixed(2)}",
//                                             style: AppWidget.headlineTextStyle(18.0),
//                                           ),
//                                           const SizedBox(height: 5),
//                                           Text(
//                                             "Ordered on: ${order['ordered_at'].toDate().toString().split('.')[0]}",
//                                             style: AppWidget.lightTextStyle(14.0),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),

//                         /// TOTAL PRICE AT BOTTOM
//                         Container(
//                           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: const Color(0xffddd7cd),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Text(
//                             "Total Price of All Orders: \$${totalPrice.toStringAsFixed(2)}",
//                             style: AppWidget.headlineTextStyle(22),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Order extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Order({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Order> createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   List<Map<String, dynamic>> orders = [];

//   /// Calculate total price of all orders
//   double get totalPrice {
//     double sum = 0;
//     for (var item in orders) {
//       sum += item['total_price'];
//     }
//     return sum;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Order Page", style: AppWidget.headlineTextStyle(30.0)),
//               const SizedBox(height: 20),

//               /// Orders List
//               Expanded(
//                 child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('orders')
//                       .orderBy('ordered_at', descending: true)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return const Center(child: Text("No orders placed yet."));
//                     }

//                     final fetchedOrders = snapshot.data!.docs;

//                     orders = fetchedOrders.map((order) {
//                       return {
//                         'product_name': order['product_name'],
//                         'quantity': order['quantity'],
//                         'total_price': (order['total_price'] as num).toDouble(),
//                         'image': order['image'],
//                         'ordered_at': order['ordered_at'],
//                       };
//                     }).toList();

//                     return Column(
//                       children: [
//                         /// Orders ListView
//                         Expanded(
//                           child: ListView.builder(
//                             itemCount: orders.length,
//                             itemBuilder: (context, index) {
//                               final order = orders[index];

//                               return Container(
//                                 margin: const EdgeInsets.only(bottom: 20),
//                                 padding: const EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   color: const Color.fromARGB(255, 225, 219, 248),
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     /// Product Image
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         gradient: const LinearGradient(
//                                           colors: [
//                                             Color(0xffbab3a6),
//                                             Color(0xffddd7cd),
//                                             Color(0xffa59c8f)
//                                           ],
//                                           begin: Alignment.topLeft,
//                                           end: Alignment.bottomRight,
//                                         ),
//                                         borderRadius: BorderRadius.circular(30),
//                                       ),
//                                       child: Image.asset(
//                                         order['image'],
//                                         height: 120,
//                                         width: 120,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                     const SizedBox(width: 20),

//                                     /// Product Details
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             order['product_name'],
//                                             style: AppWidget.headlineTextStyle(20.0),
//                                           ),
//                                           const SizedBox(height: 5),
//                                           Text(
//                                             "Quantity: ${order['quantity']}",
//                                             style: AppWidget.headlineTextStyle(18.0),
//                                           ),
//                                           const SizedBox(height: 5),
//                                           Text(
//                                             "Total Price: \$${order['total_price'].toStringAsFixed(2)}",
//                                             style: AppWidget.headlineTextStyle(18.0),
//                                           ),
//                                           const SizedBox(height: 5),
//                                           Text(
//                                             "Ordered on: ${order['ordered_at'].toDate().toString().split('.')[0]}",
//                                             style: AppWidget.lightTextStyle(14.0),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),

//                         /// TOTAL PRICE AT BOTTOM
//                         Container(
//                           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: const Color(0xffddd7cd),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Total Price of All Orders: \$${totalPrice.toStringAsFixed(2)}",
//                                 style: AppWidget.headlineTextStyle(22),
//                                 textAlign: TextAlign.center,
//                               ),
//                               const SizedBox(height: 15),

//                               /// CHECKOUT BUTTON
//                               GestureDetector(
//                                 onTap: () {
//                                   if (widget.walletBalance < totalPrice) {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                         content: Text(
//                                             "Insufficient wallet balance!"),
//                                       ),
//                                     );
//                                     return;
//                                   }

//                                   // Deduct from wallet
//                                   widget.updateWalletBalance(
//                                       widget.walletBalance - totalPrice.toInt());

//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                       content: Text("Checkout successful!"),
//                                     ),
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     color: Colors.black,
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       "Checkout",
//                                       style: AppWidget.whiteTextStyle(18),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Order extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Order({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Order> createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   /// ================= CALCULATE TOTAL =================
//   double calculateTotal(List<QueryDocumentSnapshot> docs) {
//     double sum = 0;
//     for (var order in docs) {
//       sum += (order['total_price'] as num).toDouble();
//     }
//     return sum;
//   }

//   /// ================= REMOVE ORDER =================
//   Future<void> removeOrder(String docId) async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').doc(docId).delete();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Item removed successfully"),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Failed to remove item: $e"),
//           backgroundColor: Theme.of(context).colorScheme.error,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('orders').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: theme.colorScheme.primary,
//               ),
//             );
//           }

//           var orders = snapshot.data!.docs;
//           double totalPrice = calculateTotal(orders);

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// HEADER
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text(
//                   "Order Page",
//                   style: AppWidget.headlineTextStyle(28),
//                 ),
//               ),

//               /// ORDER LIST
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: orders.length,
//                   itemBuilder: (context, index) {
//                     var order = orders[index];
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 8),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: theme.cardColor,
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                           color: theme.colorScheme.outline.withOpacity(0.3),
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: Image.asset(
//                               order['image'],
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   order['product_name'],
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Qty: ${order['quantity']}  |  \$${order['total_price'].toStringAsFixed(2)}",
//                                   style: theme.textTheme.bodyMedium,
//                                 ),
//                               ],
//                             ),
//                           ),

//                           /// DELETE BUTTON
//                           GestureDetector(
//                             onTap: () => removeOrder(order.id),
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.error,
//                                 borderRadius: BorderRadius.circular(50),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 4,
//                                     offset: const Offset(2, 2),
//                                   ),
//                                 ],
//                               ),
//                               child: const Icon(
//                                 Icons.delete,
//                                 color: Colors.white,
//                                 size: 25,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               /// TOTAL + PLACE ORDER
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 margin: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.surface,
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(
//                     color: theme.colorScheme.outline.withOpacity(0.3),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Total Price",
//                           style: theme.textTheme.titleLarge,
//                         ),
//                         Text(
//                           "\$${totalPrice.toStringAsFixed(2)}",
//                           style: theme.textTheme.titleLarge,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     GestureDetector(
//                       onTap: () {
//                         if (totalPrice > widget.walletBalance) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text(
//                                   "Insufficient wallet balance. Remove items to proceed."),
//                               backgroundColor: Colors.orange,
//                             ),
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text("Order placed successfully!"),
//                               backgroundColor: Colors.green,
//                             ),
//                           );
//                         }
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: theme.colorScheme.primary,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Place Order",
//                             style: AppWidget.whiteTextStyle(18),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Order extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Order({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Order> createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   /// ================= CALCULATE TOTAL =================
//   double calculateTotal(List<QueryDocumentSnapshot> docs) {
//     double sum = 0;
//     for (var order in docs) {
//       sum += (order['total_price'] as num).toDouble();
//     }
//     return sum;
//   }

//   /// ================= REMOVE SINGLE ORDER =================
//   Future<void> removeOrder(String docId) async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').doc(docId).delete();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Item removed successfully"),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Failed to remove item: $e"),
//           backgroundColor: Theme.of(context).colorScheme.error,
//         ),
//       );
//     }
//   }

//   /// ================= CLEAR CART (NEW) =================
//   Future<void> clearCart() async {
//     final snapshot =
//         await FirebaseFirestore.instance.collection('orders').get();

//     final batch = FirebaseFirestore.instance.batch();

//     for (var doc in snapshot.docs) {
//       batch.delete(doc.reference);
//     }

//     await batch.commit();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('orders').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: theme.colorScheme.primary,
//               ),
//             );
//           }

//           var orders = snapshot.data!.docs;
//           double totalPrice = calculateTotal(orders);

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// HEADER
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text(
//                   "Order Page",
//                   style: AppWidget.headlineTextStyle(28),
//                 ),
//               ),

//               /// ORDER LIST
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: orders.length,
//                   itemBuilder: (context, index) {
//                     var order = orders[index];
//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 8),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: theme.cardColor,
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                           color: theme.colorScheme.outline.withOpacity(0.3),
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: Image.asset(
//                               order['image'],
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   order['product_name'],
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Qty: ${order['quantity']}  |  \$${order['total_price'].toStringAsFixed(2)}",
//                                   style: theme.textTheme.bodyMedium,
//                                 ),
//                               ],
//                             ),
//                           ),

//                           /// DELETE BUTTON
//                           GestureDetector(
//                             onTap: () => removeOrder(order.id),
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.error,
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: const Icon(
//                                 Icons.delete,
//                                 color: Colors.white,
//                                 size: 25,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               /// TOTAL + PLACE ORDER
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 margin: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.surface,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Total Price",
//                             style: theme.textTheme.titleLarge),
//                         Text("\$${totalPrice.toStringAsFixed(2)}",
//                             style: theme.textTheme.titleLarge),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     GestureDetector(
//                       onTap: () async {
//                         if (totalPrice > widget.walletBalance) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text(
//                                 "Insufficient wallet balance. Remove items to proceed.",
//                               ),
//                               backgroundColor: Colors.orange,
//                             ),
//                           );
//                           return;
//                         }

//                         // ✅ CLEAR CART
//                         await clearCart();

//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("Order placed successfully!"),
//                             backgroundColor: Colors.green,
//                           ),
//                         );
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: theme.colorScheme.primary,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Place Order",
//                             style: AppWidget.whiteTextStyle(18),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

//////////////////////WORKING BELOW WALA/////////////////////

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Order extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Order({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Order> createState() => _OrderState();
// }

// class _OrderState extends State<Order> {
//   /// ================= CALCULATE TOTAL =================
//   double calculateTotal(List<QueryDocumentSnapshot> docs) {
//     double sum = 0;
//     for (var order in docs) {
//       sum += (order['total_price'] as num).toDouble();
//     }
//     return sum;
//   }

//   /// ================= REMOVE SINGLE ORDER =================
//   Future<void> removeOrder(String docId) async {
//     try {
//       await FirebaseFirestore.instance.collection('orders').doc(docId).delete();
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Item removed successfully"),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Failed to remove item: $e"),
//           backgroundColor: Theme.of(context).colorScheme.error,
//         ),
//       );
//     }
//   }

//   /// ================= CLEAR CART =================
//   Future<void> clearCart() async {
//     final snapshot =
//         await FirebaseFirestore.instance.collection('orders').get();

//     final batch = FirebaseFirestore.instance.batch();
//     for (var doc in snapshot.docs) {
//       batch.delete(doc.reference);
//     }
//     await batch.commit();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('orders').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: theme.colorScheme.primary,
//               ),
//             );
//           }

//           var orders = snapshot.data!.docs;
//           double totalPrice = calculateTotal(orders);

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// HEADER
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text(
//                   "Order Page",
//                   style: AppWidget.headlineTextStyle(28),
//                 ),
//               ),

//               /// ORDER LIST
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: orders.length,
//                   itemBuilder: (context, index) {
//                     var order = orders[index];

//                     final String imageUrl =
//                         order.data().toString().contains("image")
//                             ? order['image']
//                             : "";

//                     return Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 8),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: theme.cardColor,
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(
//                           color: theme.colorScheme.outline.withOpacity(0.3),
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           /// IMAGE (Cloudinary)
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: Image.network(
//                               imageUrl,
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                               errorBuilder: (_, __, ___) {
//                                 return Image.asset(
//                                   "images/medicine.png",
//                                   width: 80,
//                                   height: 80,
//                                   fit: BoxFit.cover,
//                                 );
//                               },
//                             ),
//                           ),

//                           const SizedBox(width: 15),

//                           /// DETAILS
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   order['product_name'],
//                                   style: theme.textTheme.titleMedium,
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "Qty: ${order['quantity']}  |  \$${order['total_price'].toStringAsFixed(2)}",
//                                   style: theme.textTheme.bodyMedium,
//                                 ),
//                               ],
//                             ),
//                           ),

//                           /// DELETE BUTTON
//                           GestureDetector(
//                             onTap: () => removeOrder(order.id),
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.error,
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: const Icon(
//                                 Icons.delete,
//                                 color: Colors.white,
//                                 size: 25,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               /// TOTAL + PLACE ORDER
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 margin: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.surface,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("Total Price",
//                             style: theme.textTheme.titleLarge),
//                         Text("\$${totalPrice.toStringAsFixed(2)}",
//                             style: theme.textTheme.titleLarge),
//                       ],
//                     ),
//                     const SizedBox(height: 15),

//                     /// PLACE ORDER
//                     GestureDetector(
//                       onTap: () async {
//                         if (totalPrice > widget.walletBalance) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text(
//                                 "Insufficient wallet balance. Remove items to proceed.",
//                               ),
//                               backgroundColor: Colors.orange,
//                             ),
//                           );
//                           return;
//                         }

//                         await clearCart();

//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text("Order placed successfully!"),
//                             backgroundColor: Colors.green,
//                           ),
//                         );
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: theme.colorScheme.primary,
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Place Order",
//                             style: AppWidget.whiteTextStyle(18),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
////////WROKING COMPLETELY UPER WALA////

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Order extends StatefulWidget {
  final int walletBalance;
  final Function(int) updateWalletBalance;

  const Order({
    super.key,
    required this.walletBalance,
    required this.updateWalletBalance,
  });

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<QueryDocumentSnapshot> orders = [];

  /// ================= CALCULATE TOTAL =================
  double calculateTotal(List<QueryDocumentSnapshot> docs) {
    double sum = 0;
    for (var order in docs) {
      sum += (order['total_price'] as num).toDouble();
    }
    return sum;
  }

  /// ================= REMOVE SINGLE ORDER =================
  Future<void> removeOrder(String docId) async {
    await FirebaseFirestore.instance.collection('orders').doc(docId).delete();
  }

  /// ================= CLEAR CART =================
  Future<void> clearCart() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('orders').get();

    final batch = FirebaseFirestore.instance.batch();
    for (var doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }

  /// ================= DEDUCT WALLET & ADD TRANSACTION =================
  Future<void> deductWalletAndLog(double totalPrice) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

    // Fetch existing transactions
    final snapshot = await userRef.get();
    List<Map<String, dynamic>> transactions = [];
    if (snapshot.exists) {
      transactions = List<Map<String, dynamic>>.from(snapshot.get('transactions') ?? []);
    }

    // Add debit transaction
    final newTransaction = {
      'title': 'Order Payment',
      'subtitle': 'Purchased ${orders.length} item(s)',
      'amount': -totalPrice.toInt(),
      'date': DateTime.now().toIso8601String(),
      'image': 'images/credit-card-payment.png',
    };
    transactions.insert(0, newTransaction);

    // Update wallet balance
    int newBalance = widget.walletBalance - totalPrice.toInt();

    // Update Firestore
    await userRef.set({
      'walletBalance': newBalance,
      'transactions': transactions,
    }, SetOptions(merge: true));

    // Update UI
    widget.updateWalletBalance(newBalance);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.primary,
              ),
            );
          }

          orders = snapshot.data!.docs;
          double totalPrice = calculateTotal(orders);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Order Page",
                  style: AppWidget.headlineTextStyle(28),
                ),
              ),

              /// ORDER LIST
              Expanded(
                child: ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    var order = orders[index];

                    final String imageUrl =
                        order.data().toString().contains("image")
                            ? order['image']
                            : "";

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: theme.colorScheme.outline.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) {
                                return Image.asset(
                                  "images/medicine.png",
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order['product_name'],
                                  style: theme.textTheme.titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Qty: ${order['quantity']} | \$${order['total_price'].toStringAsFixed(2)}",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => removeOrder(order.id),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.error,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// TOTAL + PLACE ORDER
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price", style: theme.textTheme.titleLarge),
                        Text("\$${totalPrice.toStringAsFixed(2)}",
                            style: theme.textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(height: 15),

                    /// PLACE ORDER
                    GestureDetector(
                      onTap: () async {
                        if (totalPrice > widget.walletBalance) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Insufficient wallet balance"),
                              backgroundColor: Colors.orange,
                            ),
                          );
                          return;
                        }

                        try {
                          // Deduct wallet & add transaction
                          await deductWalletAndLog(totalPrice);

                          // Clear the cart after wallet update
                          await clearCart();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Order placed successfully!"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Failed to place order: $e"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "Place Order",
                            style: AppWidget.whiteTextStyle(18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
