// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Container(
//         margin: const EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26.0)),
//             const SizedBox(height: 20.0),
//             Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(right: 20),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "images/wallet.png",
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(width: 20),
//                   Column(
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$200", style: AppWidget.headlineTextStyle(30.0))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             // Amount selection list
//             Container(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 children: List.generate(
//                   10,
//                   (index) {
//                     final amount = (index + 1) * 100;
//                     return Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () => makePayment(amount.toString()),
//                           child: Container(
//                             width: 130,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                                 child: Text("\$$amount", style: AppWidget.whiteTextStyle(18))),
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             Center(
//               child: Container(
//                 height: 60,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white, width: 1.5),
//                   gradient: const LinearGradient(
//                     colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(child: Text("Add Money", style: AppWidget.headlineTextStyle(22))),
//               ),
//             ),
//             const SizedBox(height: 50),
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 225, 219, 248),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> makePayment(String amount) async {
//     try {
//       paymentIntent = await createPaymentIntent(amount, 'USD');

//       if (paymentIntent == null) return;

//       // Payment Sheet
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           style: ThemeMode.dark,
//           merchantDisplayName: 'Adnan',
//         ),
//       );

//       displayPaymentSheet();
//     } catch (e, s) {
//       print('Exception: $e\nStackTrace: $s');
//     }
//   }

//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//       if (!mounted) return;
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.check_circle,
//                     color: Colors.green,
//                   ),
//                   SizedBox(width: 5),
//                   Text("Payment Successful!"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//       paymentIntent = null;
//     } on StripeException catch (e) {
//       if (!mounted) return;
//       print('Stripe Error: $e');
//       showDialog(
//         context: context,
//         builder: (_) => const AlertDialog(content: Text("Payment Cancelled")),
//       );
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
//     try {
//       final url = Uri.parse('http://localhost:4242/create-payment-intent');
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         print('Failed to create payment intent: ${response.body}');
//         return null;
//       }
//     } catch (err) {
//       print('Error creating payment intent: $err');
//       return null;
//     }
//   }
// }


// import 'dart:convert';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'dart:html' as html; // Only used for web

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Container(
//         margin: const EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26.0)),
//             const SizedBox(height: 20.0),
//             Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(right: 20),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f)
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "images/wallet.png",
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(width: 20),
//                   Column(
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$200", style: AppWidget.headlineTextStyle(30.0))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             Container(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 children: List.generate(
//                   10,
//                   (index) {
//                     final amount = (index + 1) * 100;
//                     return Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () => makePayment(amount.toString()),
//                           child: Container(
//                             width: 130,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                                 child: Text("\$$amount",
//                                     style: AppWidget.whiteTextStyle(18))),
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             Center(
//               child: Container(
//                 height: 60,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white, width: 1.5),
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color(0xffbab3a6),
//                       Color(0xffddd7cd),
//                       Color(0xffa59c8f)
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                     child:
//                         Text("Add Money", style: AppWidget.headlineTextStyle(22))),
//               ),
//             ),
//             const SizedBox(height: 50),
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 225, 219, 248),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     Text("Your Transactions",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> makePayment(String amount) async {
//     if (kIsWeb) {
//       // Web: Use Stripe Checkout
//       final sessionUrl = await createCheckoutSession(amount, 'USD');
//       if (sessionUrl != null) {
//         html.window.open(sessionUrl, "_blank");
//       }
//     } else {
//       // Mobile: Use Payment Sheet
//       try {
//         paymentIntent = await createPaymentIntent(amount, 'USD');
//         if (paymentIntent == null) return;

//         await Stripe.instance.initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//             paymentIntentClientSecret: paymentIntent!['client_secret'],
//             style: ThemeMode.dark,
//             merchantDisplayName: 'Adnan',
//           ),
//         );

//         displayPaymentSheet();
//       } catch (e, s) {
//         print('Exception: $e\nStackTrace: $s');
//       }
//     }
//   }

//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//       if (!mounted) return;
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.check_circle,
//                     color: Colors.green,
//                   ),
//                   SizedBox(width: 5),
//                   Text("Payment Successful!"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//       paymentIntent = null;
//     } on StripeException catch (e) {
//       if (!mounted) return;
//       print('Stripe Error: $e');
//       showDialog(
//         context: context,
//         builder: (_) => const AlertDialog(content: Text("Payment Cancelled")),
//       );
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final url = Uri.parse('http://localhost:4242/create-payment-intent');
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         print('Failed to create payment intent: ${response.body}');
//         return null;
//       }
//     } catch (err) {
//       print('Error creating payment intent: $err');
//       return null;
//     }
//   }

//   Future<String?> createCheckoutSession(String amount, String currency) async {
//     try {
//       final url = Uri.parse('http://localhost:4242/create-checkout-session');
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data['url']; // Return Stripe Checkout URL
//       } else {
//         print('Failed to create checkout session: ${response.body}');
//         return null;
//       }
//     } catch (err) {
//       print('Error creating checkout session: $err');
//       return null;
//     }
//   }
// }


// import 'dart:convert';
// import 'package:flutter/foundation.dart'; // kIsWeb
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;
//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//     });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 200; // Starting balance
//   List<Map<String, dynamic>> transactions = []; // Dynamic transaction list

//   final TextEditingController _customAmountController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26.0)),
//             const SizedBox(height: 20),

//             /// Wallet Card
//             Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(right: 0),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100, width: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$$walletBalance", style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// Amount Selector
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => makePayment(amount.toString()),
//                         child: Container(
//                           width: 130,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text("\$$amount", style: AppWidget.whiteTextStyle(18)),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                     ],
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 40),

//             /// Add Money Button (Custom Amount)
//             Center(
//               child: GestureDetector(
//                 onTap: () => _showAddMoneyDialog(),
//                 child: Container(
//                   height: 60,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 1.5),
//                     gradient: const LinearGradient(
//                       colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Text("Add Money", style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 50),

//             /// Transactions Section
//             Container(
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 225, 219, 248),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 30),
//                   Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 10),
//                   if (transactions.isEmpty)
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("No transactions yet."),
//                     ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (context, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: const Icon(Icons.payment),
//                         title: Text(tx['title']),
//                         subtitle: Text(tx['subtitle']),
//                         trailing: Text("\$${tx['amount']}"),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= CUSTOM AMOUNT DIALOG =================
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(hintText: "Amount in USD"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final amount = _customAmountController.text.trim();
//               if (amount.isNotEmpty && int.tryParse(amount) != null) {
//                 Navigator.pop(context);
//                 makePayment(amount);
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         // 🌐 WEB → Stripe Checkout
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           final String checkoutUrl = data['url'];
//           final uri = Uri.parse(checkoutUrl);
//           await launchUrl(uri, mode: LaunchMode.externalApplication);

//           // Update wallet balance and transactions for web
//           setState(() {
//             walletBalance += int.parse(amount);
//             transactions.add({
//               'title': 'Wallet Top-up',
//               'subtitle': 'Payment of \$${amount} successful',
//               'amount': amount,
//             });
//           });
//         } else {
//           debugPrint('Failed to create checkout session: ${response.body}');
//         }
//         return;
//       }

//       // 📱 MOBILE → PaymentSheet
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Adnan',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();

//       // Update wallet balance and transactions for mobile
//       setState(() {
//         walletBalance += int.parse(amount);
//         transactions.add({
//           'title': 'Wallet Top-up',
//           'subtitle': 'Payment of \$${amount} successful',
//           'amount': amount,
//         });
//       });
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   /// ================= MOBILE BACKEND =================
//   Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;

//   late int walletBalance;

//   final List<Map<String, dynamic>> transactions = [];

//   final TextEditingController _customAmountController =
//       TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     walletBalance = widget.walletBalance;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding:
//             const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page",
//                 style: AppWidget.headlineTextStyle(26)),

//             const SizedBox(height: 20),

//             /// ================= WALLET CARD =================
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f)
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png",
//                       height: 90, width: 90),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet",
//                           style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 6),
//                       Text("\$$walletBalance",
//                           style: AppWidget.headlineTextStyle(32)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ================= QUICK AMOUNTS =================
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500].map((amount) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 35),

//             /// ================= ADD MONEY =================
//             Center(
//               child: GestureDetector(
//                 onTap: _showAddMoneyDialog,
//                 child: Container(
//                   height: 55,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 1.5),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xffbab3a6),
//                         Color(0xffddd7cd),
//                         Color(0xffa59c8f)
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   child: Center(
//                     child: Text("Add Money",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 45),

//             /// ================= TRANSACTIONS =================
//             Container(
//               padding: const EdgeInsets.only(top: 30, bottom: 20),
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 225, 219, 248),
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Text("Your Transactions",
//                       style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 20),

//                   if (transactions.isEmpty)
//                     const Text("No transactions yet"),

//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (context, index) {
//                       final tx = transactions[index];
//                       final isCredit = tx['type'] == 'credit';

//                       return Container(
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 8),
//                         padding: const EdgeInsets.all(14),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         child: Row(
//                           children: [
//                             /// ICON
//                             Container(
//                               padding: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: isCredit
//                                     ? Colors.green.shade50
//                                     : Colors.red.shade50,
//                                 borderRadius:
//                                     BorderRadius.circular(14),
//                               ),
//                               child: Image.asset(
//                                 isCredit
//                                     ? "images/cashback.png"
//                                     : "images/credit-card-payment.png",
//                                 height: 32,
//                                 width: 32,
//                               ),
//                             ),

//                             const SizedBox(width: 14),

//                             /// DETAILS
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                 children: [
//                                   Text(tx['title'],
//                                       style: AppWidget.headlineTextStyle(
//                                           16)),
//                                   const SizedBox(height: 4),
//                                   Text(tx['subtitle'],
//                                       style:
//                                           AppWidget.lightTextStyle(14)),
//                                 ],
//                               ),
//                             ),

//                             /// BADGE
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 14, vertical: 6),
//                               decoration: BoxDecoration(
//                                 color: isCredit
//                                     ? Colors.green.shade100
//                                     : Colors.red.shade100,
//                                 borderRadius:
//                                     BorderRadius.circular(20),
//                               ),
//                               child: Text(
//                                 isCredit ? "CREDIT" : "DEBIT",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: isCredit
//                                       ? Colors.green
//                                       : Colors.red,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= ADD MONEY DIALOG =================
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//           decoration:
//               const InputDecoration(hintText: "Amount in USD"),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount = _customAmountController.text;
//               if (int.tryParse(amount) != null) {
//                 Navigator.pop(context);
//                 makePayment(amount);
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         final data = jsonDecode(response.body);
//         await launchUrl(Uri.parse(data['url']),
//             mode: LaunchMode.externalApplication);

//         _creditWallet(amount);
//         return;
//       }

//       paymentIntent = await createPaymentIntent(amount, 'USD');

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret:
//               paymentIntent!['client_secret'],
//           merchantDisplayName: 'Online Pharmacy',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _creditWallet(amount);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   void _creditWallet(String amount) {
//     setState(() {
//       walletBalance += int.parse(amount);
//       widget.updateWalletBalance(walletBalance);

//       transactions.insert(0, {
//         'type': 'credit',
//         'title': 'Wallet Top-up',
//         'subtitle': 'Added \$$amount successfully',
//       });
//     });
//   }

//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );
//     return jsonDecode(response.body);
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   final TextEditingController _customAmountController =
//       TextEditingController();

//   List<Map<String, dynamic>> transactions = [];


//   final String uid = FirebaseAuth.instance.currentUser!.uid;

//   /// 🔥 Firestore references
//   DocumentReference get userDoc =>
//       FirebaseFirestore.instance.collection('users').doc(uid);

//   CollectionReference get transactionCol =>
//       userDoc.collection('transactions');

//   /// ================= ADD TRANSACTION =================
//   Future<void> addTransaction({
//     required String type,
//     required int amount,
//     required String title,
//   }) async {
//     await transactionCol.add({
//       'type': type, // credit / debit
//       'amount': amount,
//       'title': title,
//       'createdAt': Timestamp.now(),
//     });
//   }

//   /// ================= UPDATE WALLET =================
//  Future<void> updateWallet(int newBalance) async {
//   widget.updateWalletBalance(newBalance);
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// 💳 WALLET CARD
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 90),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 6),
//                       Text("\$${widget.walletBalance}",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// 💰 QUICK AMOUNTS
//             SizedBox(
//               height: 45,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500].map((amount) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ➕ ADD MONEY
//             Center(
//               child: GestureDetector(
//                 onTap: _showAddMoneyDialog,
//                 child: Container(
//                   height: 55,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xffbab3a6), Color(0xffddd7cd)],
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child:
//                         Text("Add Money", style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 40),

//             /// 📜 TRANSACTIONS
//             Text("Your Transactions",
//                 style: AppWidget.headlineTextStyle(22)),
//             const SizedBox(height: 15),

//             StreamBuilder<QuerySnapshot>(
//               stream: transactionCol
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.data!.docs.isEmpty) {
//                   return const Center(child: Text("No transactions yet"));
//                 }

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final tx = snapshot.data!.docs[index];
//                     final bool isCredit = tx['type'] == 'credit';

//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 225, 219, 248),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             isCredit
//                                 ? "images/cashback.png"
//                                 : "images/credit-card-payment.png",
//                             height: 40,
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(tx['title'],
//                                     style:
//                                         AppWidget.headlineTextStyle(16)),
//                                 Text(
//                                   isCredit ? "CREDIT" : "DEBIT",
//                                   style: TextStyle(
//                                     color: isCredit
//                                         ? Colors.green
//                                         : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text(
//                             "\$${tx['amount']}",
//                             style: AppWidget.headlineTextStyle(18),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= ADD MONEY DIALOG =================
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount = _customAmountController.text.trim();
//               if (amount.isNotEmpty) {
//                 Navigator.pop(context);
//                 makePayment(amount);
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//   try {
//     final int amt = int.parse(amount);

//     // 1️⃣ Create payment intent
//     paymentIntent = await createPaymentIntent(amount, 'USD');
//     if (paymentIntent == null) return;

//     // 2️⃣ Init payment sheet
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: paymentIntent!['client_secret'],
//         merchantDisplayName: 'Online Pharmacy',
//       ),
//     );

//     // 3️⃣ SHOW STRIPE UI (CRITICAL)
//     await Stripe.instance.presentPaymentSheet();

//     // 🔥 ONLY AFTER SUCCESS ↓↓↓
//     final newBalance = widget.walletBalance + amt;

//     await updateWallet(newBalance);

//     await addTransaction(
//       type: 'credit',
//       amount: amt,
//       title: 'Wallet Top-up',
//     );

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Payment successful"),
//         backgroundColor: Colors.green,
//       ),
//     );
//   } on StripeException catch (_) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Payment cancelled"),
//         backgroundColor: Colors.red,
//       ),
//     );
//   } catch (e) {
//     debugPrint("Payment error: $e");
//   }
// }


//   /// ================= STRIPE BACKEND =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   final TextEditingController _customAmountController =
//       TextEditingController();

//   /// ✅ SAFE USER
//   User? get user => FirebaseAuth.instance.currentUser;

//   /// ✅ FIRESTORE REFS (SAFE)
//   DocumentReference get userDoc =>
//       FirebaseFirestore.instance.collection('users').doc(user!.uid);

//   CollectionReference get transactionCol =>
//       userDoc.collection('transactions');

//   /// ================= ADD TRANSACTION =================
//   Future<void> addTransaction({
//     required String type,
//     required int amount,
//     required String title,
//   }) async {
//     if (user == null) return;

//     await transactionCol.add({
//       'type': type, // credit / debit
//       'amount': amount,
//       'title': title,
//       'createdAt': Timestamp.now(),
//     });
//   }

//   /// ================= UPDATE WALLET =================
//   Future<void> updateWallet(int newBalance) async {
//     widget.updateWalletBalance(newBalance);

//     if (user != null) {
//       await userDoc.set(
//         {'walletBalance': newBalance},
//         SetOptions(merge: true),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: user == null
//           ? const Center(child: Text("User not logged in"))
//           : SingleChildScrollView(
//               padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Wallet Page",
//                       style: AppWidget.headlineTextStyle(26)),
//                   const SizedBox(height: 20),

//                   /// 💳 WALLET CARD
//                   Container(
//                     padding: const EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [
//                           Color(0xffbab3a6),
//                           Color(0xffddd7cd),
//                           Color(0xffa59c8f)
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset("images/wallet.png", height: 90),
//                         const SizedBox(width: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Your Wallet",
//                                 style: AppWidget.headlineTextStyle(22)),
//                             const SizedBox(height: 6),
//                             Text("\$${widget.walletBalance}",
//                                 style: AppWidget.headlineTextStyle(30)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// 💰 QUICK AMOUNTS
//                   SizedBox(
//                     height: 45,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [100, 200, 500].map((amount) {
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 15),
//                           child: GestureDetector(
//                             onTap: () => makePayment(amount.toString()),
//                             child: Container(
//                               width: 110,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Center(
//                                 child: Text("\$$amount",
//                                     style:
//                                         AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ➕ ADD MONEY
//                   Center(
//                     child: GestureDetector(
//                       onTap: _showAddMoneyDialog,
//                       child: Container(
//                         height: 55,
//                         width: 280,
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [
//                               Color(0xffbab3a6),
//                               Color(0xffddd7cd)
//                             ],
//                           ),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text("Add Money",
//                               style:
//                                   AppWidget.headlineTextStyle(22)),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 40),

//                   /// 📜 TRANSACTIONS
//                   Text("Your Transactions",
//                       style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 15),

//                   StreamBuilder<QuerySnapshot>(
//                     stream: transactionCol
//                         .orderBy('createdAt', descending: true)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState ==
//                           ConnectionState.waiting) {
//                         return const CircularProgressIndicator();
//                       }

//                       if (!snapshot.hasData ||
//                           snapshot.data!.docs.isEmpty) {
//                         return const Text("No transactions yet");
//                       }

//                       return ListView.builder(
//                         shrinkWrap: true,
//                         physics:
//                             const NeverScrollableScrollPhysics(),
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           final tx =
//                               snapshot.data!.docs[index];
//                           final bool isCredit =
//                               tx['type'] == 'credit';

//                           return Container(
//                             margin:
//                                 const EdgeInsets.only(bottom: 12),
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(
//                                   255, 225, 219, 248),
//                               borderRadius:
//                                   BorderRadius.circular(18),
//                             ),
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   isCredit
//                                       ? "images/cashback.png"
//                                       : "images/credit-card-payment.png",
//                                   height: 40,
//                                 ),
//                                 const SizedBox(width: 15),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(tx['title'],
//                                           style: AppWidget
//                                               .headlineTextStyle(
//                                                   16)),
//                                       Text(
//                                         isCredit
//                                             ? "CREDIT"
//                                             : "DEBIT",
//                                         style: TextStyle(
//                                           color: isCredit
//                                               ? Colors.green
//                                               : Colors.red,
//                                           fontWeight:
//                                               FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Text(
//                                   "\$${tx['amount']}",
//                                   style: AppWidget
//                                       .headlineTextStyle(18),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   /// ================= ADD MONEY DIALOG =================
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount =
//                   _customAmountController.text.trim();
//               if (amount.isNotEmpty &&
//                   int.tryParse(amount) != null) {
//                 Navigator.pop(context);
//                 makePayment(amount);
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       final int amt = int.parse(amount);

//       paymentIntent =
//           await createPaymentIntent(amount, 'USD');

//       if (paymentIntent == null ||
//           paymentIntent!['client_secret'] == null) {
//         throw Exception("PaymentIntent failed");
//       }

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret:
//               paymentIntent!['client_secret'],
//           merchantDisplayName: 'Online Pharmacy',
//         ),
//       );

//       /// ✅ SHOW STRIPE UI
//       await Stripe.instance.presentPaymentSheet();

//       /// ✅ UPDATE ONLY AFTER SUCCESS
//       final newBalance = widget.walletBalance + amt;
//       await updateWallet(newBalance);

//       await addTransaction(
//         type: 'credit',
//         amount: amt,
//         title: 'Wallet Top-up',
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Payment successful"),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } on StripeException {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Payment cancelled"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } catch (e) {
//       debugPrint("Payment error: $e");
//     }
//   }

//   /// ================= STRIPE BACKEND =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(
//             {'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   final TextEditingController _customAmountController =
//       TextEditingController();

//   User? _user;
//   late DocumentReference userDoc;
//   late CollectionReference transactionCol;

//   @override
//   void initState() {
//     super.initState();
//     _user = FirebaseAuth.instance.currentUser;

//     if (_user != null) {
//       userDoc =
//           FirebaseFirestore.instance.collection('users').doc(_user!.uid);
//       transactionCol = userDoc.collection('transactions');
//     }
//   }

//   @override
//   void dispose() {
//     _customAmountController.dispose();
//     super.dispose();
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> addTransaction({
//     required String type,
//     required int amount,
//     required String title,
//   }) async {
//     if (_user == null) return;

//     await transactionCol.add({
//       'type': type, // credit / debit
//       'amount': amount,
//       'title': title,
//       'createdAt': Timestamp.now(),
//     });
//   }

//   /// ================= UPDATE WALLET =================
//   Future<void> updateWallet(int newBalance) async {
//     widget.updateWalletBalance(newBalance);

//     if (_user != null) {
//       await userDoc.set(
//         {'walletBalance': newBalance},
//         SetOptions(merge: true),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: _user == null
//           ? const Center(
//               child: Text(
//                 "User not logged in",
//                 style: TextStyle(fontSize: 18),
//               ),
//             )
//           : SingleChildScrollView(
//               padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Wallet Page",
//                       style: AppWidget.headlineTextStyle(26)),
//                   const SizedBox(height: 20),

//                   /// 💳 WALLET CARD
//                   Container(
//                     padding: const EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [
//                           Color(0xffbab3a6),
//                           Color(0xffddd7cd),
//                           Color(0xffa59c8f)
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset("images/wallet.png", height: 90),
//                         const SizedBox(width: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Your Wallet",
//                                 style: AppWidget.headlineTextStyle(22)),
//                             const SizedBox(height: 6),
//                             Text("\$${widget.walletBalance}",
//                                 style: AppWidget.headlineTextStyle(30)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// 💰 QUICK AMOUNTS
//                   SizedBox(
//                     height: 45,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [100, 200, 500].map((amount) {
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 15),
//                           child: GestureDetector(
//                             onTap: () => makePayment(amount.toString()),
//                             child: Container(
//                               width: 110,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Center(
//                                 child: Text("\$$amount",
//                                     style:
//                                         AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ➕ ADD MONEY
//                   Center(
//                     child: GestureDetector(
//                       onTap: _showAddMoneyDialog,
//                       child: Container(
//                         height: 55,
//                         width: 280,
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [
//                               Color(0xffbab3a6),
//                               Color(0xffddd7cd)
//                             ],
//                           ),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Center(
//                           child: Text("Add Money",
//                               style:
//                                   AppWidget.headlineTextStyle(22)),
//                         ),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 40),

//                   /// 📜 TRANSACTIONS
//                   Text("Your Transactions",
//                       style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 15),

//                   StreamBuilder<QuerySnapshot>(
//                     stream: transactionCol
//                         .orderBy('createdAt', descending: true)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState ==
//                           ConnectionState.waiting) {
//                         return const CircularProgressIndicator();
//                       }

//                       if (!snapshot.hasData ||
//                           snapshot.data!.docs.isEmpty) {
//                         return const Text("No transactions yet");
//                       }

//                       return ListView.builder(
//                         shrinkWrap: true,
//                         physics:
//                             const NeverScrollableScrollPhysics(),
//                         itemCount: snapshot.data!.docs.length,
//                         itemBuilder: (context, index) {
//                           final tx =
//                               snapshot.data!.docs[index];
//                           final bool isCredit =
//                               tx['type'] == 'credit';

//                           return Container(
//                             margin:
//                                 const EdgeInsets.only(bottom: 12),
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(
//                                   255, 225, 219, 248),
//                               borderRadius:
//                                   BorderRadius.circular(18),
//                             ),
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   isCredit
//                                       ? "images/cashback.png"
//                                       : "images/credit-card-payment.png",
//                                   height: 40,
//                                 ),
//                                 const SizedBox(width: 15),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(tx['title'],
//                                           style: AppWidget
//                                               .headlineTextStyle(
//                                                   16)),
//                                       Text(
//                                         isCredit
//                                             ? "CREDIT"
//                                             : "DEBIT",
//                                         style: TextStyle(
//                                           color: isCredit
//                                               ? Colors.green
//                                               : Colors.red,
//                                           fontWeight:
//                                               FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Text(
//                                   "\$${tx['amount']}",
//                                   style: AppWidget
//                                       .headlineTextStyle(18),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   /// ================= ADD MONEY DIALOG =================
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount =
//                   _customAmountController.text.trim();
//               if (amount.isNotEmpty &&
//                   int.tryParse(amount) != null) {
//                 Navigator.pop(context);
//                 makePayment(amount);
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       final int amt = int.parse(amount);

//       paymentIntent =
//           await createPaymentIntent(amount, 'USD');

//       if (paymentIntent == null ||
//           paymentIntent!['client_secret'] == null) {
//         throw Exception("PaymentIntent failed");
//       }

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret:
//               paymentIntent!['client_secret'],
//           merchantDisplayName: 'Online Pharmacy',
//         ),
//       );

//       /// ✅ SHOW STRIPE UI
//       await Stripe.instance.presentPaymentSheet();

//       /// ✅ UPDATE ONLY AFTER SUCCESS
//       final newBalance = widget.walletBalance + amt;
//       await updateWallet(newBalance);

//       await addTransaction(
//         type: 'credit',
//         amount: amt,
//         title: 'Wallet Top-up',
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Payment successful"),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } on StripeException {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Payment cancelled"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } catch (e) {
//       debugPrint("Payment error: $e");
//     }
//   }

//   /// ================= STRIPE BACKEND =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(
//             {'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'dart:html' as html; // For web
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   final TextEditingController _customAmountController =
//       TextEditingController();

//   User? _user;
//   late DocumentReference userDoc;
//   late CollectionReference transactionCol;

//   @override
//   void initState() {
//     super.initState();
//     _user = FirebaseAuth.instance.currentUser;

//     if (_user != null) {
//       userDoc =
//           FirebaseFirestore.instance.collection('users').doc(_user!.uid);
//       transactionCol = userDoc.collection('transactions');
//     }
//   }

//   @override
//   void dispose() {
//     _customAmountController.dispose();
//     super.dispose();
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> addTransaction({
//     required String type,
//     required int amount,
//     required String title,
//   }) async {
//     if (_user == null) return;

//     await transactionCol.add({
//       'type': type, // credit / debit
//       'amount': amount,
//       'title': title,
//       'createdAt': Timestamp.now(),
//     });
//   }

//   /// ================= UPDATE WALLET =================
//   Future<void> updateWallet(int newBalance) async {
//     widget.updateWalletBalance(newBalance);

//     if (_user != null) {
//       await userDoc.set(
//         {'walletBalance': newBalance},
//         SetOptions(merge: true),
//       );
//     }
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       final int amt = int.parse(amount);

//       if (kIsWeb) {
//         // 🔹 WEB FLOW: Use Checkout Session
//         final url = await createCheckoutSession(amount);
//         if (url != null) {
//           html.window.open(url, '_blank');
//         } else {
//           throw Exception("Failed to create Checkout Session");
//         }
//         return;
//       }

//       // 🔹 MOBILE FLOW: PaymentSheet
//       paymentIntent = await createPaymentIntent(amount, 'USD');

//       if (paymentIntent == null ||
//           paymentIntent!['client_secret'] == null) {
//         throw Exception("PaymentIntent failed");
//       }

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret:
//               paymentIntent!['client_secret'],
//           merchantDisplayName: 'Online Pharmacy',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();

//       /// ✅ UPDATE ONLY AFTER SUCCESS
//       final newBalance = widget.walletBalance + amt;
//       await updateWallet(newBalance);

//       await addTransaction(
//         type: 'credit',
//         amount: amt,
//         title: 'Wallet Top-up',
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Payment successful"),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } on StripeException {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Payment cancelled"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } catch (e) {
//       debugPrint("Payment error: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Payment error: $e"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   /// ================= CREATE CHECKOUT SESSION (WEB) =================
//   Future<String?> createCheckoutSession(String amount) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-checkout-session'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data['url'];
//       } else {
//         debugPrint(
//             "Failed to create Checkout Session: ${response.body}");
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }

//   /// ================= STRIPE BACKEND =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(
//             {'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
  
//   @override
//   Widget build(context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }

//   // ... rest of your code (UI, dialogs, etc.) stays exactly the same
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   final TextEditingController _customAmountController = TextEditingController();
//   final String uid = FirebaseAuth.instance.currentUser!.uid;

//   /// Firestore references
//   DocumentReference get userDoc =>
//       FirebaseFirestore.instance.collection('users').doc(uid);

//   CollectionReference get transactionCol =>
//       userDoc.collection('transactions');

//   /// Add Transaction
//   Future<void> addTransaction({
//     required String type,
//     required int amount,
//     required String title,
//   }) async {
//     await transactionCol.add({
//       'type': type,
//       'amount': amount,
//       'title': title,
//       'createdAt': Timestamp.now(),
//     });
//   }

//   /// Update Wallet
//   Future<void> updateWallet(int newBalance) async {
//     await userDoc.set({'walletBalance': newBalance}, SetOptions(merge: true));
//     widget.updateWalletBalance(newBalance);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             // Wallet Card
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 90),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 6),
//                       Text("\$${widget.walletBalance}",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Quick Amount Buttons
//             SizedBox(
//               height: 45,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500].map((amount) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Add Money Button
//             Center(
//               child: GestureDetector(
//                 onTap: _showAddMoneyDialog,
//                 child: Container(
//                   height: 55,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xffbab3a6), Color(0xffddd7cd)],
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Add Money", style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Transactions
//             Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//             const SizedBox(height: 15),

//             StreamBuilder<QuerySnapshot>(
//               stream: transactionCol.orderBy('createdAt', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.data!.docs.isEmpty) {
//                   return const Center(child: Text("No transactions yet"));
//                 }
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final tx = snapshot.data!.docs[index];
//                     final bool isCredit = tx['type'] == 'credit';
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 225, 219, 248),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             isCredit
//                                 ? "images/cashback.png"
//                                 : "images/credit-card-payment.png",
//                             height: 40,
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(tx['title'], style: AppWidget.headlineTextStyle(16)),
//                                 Text(
//                                   isCredit ? "CREDIT" : "DEBIT",
//                                   style: TextStyle(
//                                     color: isCredit ? Colors.green : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text("\$${tx['amount']}", style: AppWidget.headlineTextStyle(18)),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Add Money Dialog
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount = _customAmountController.text.trim();
//               if (amount.isNotEmpty) {
//                 Navigator.pop(context);
//                 makePayment(amount);
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   // Payment Handling
//   Future<void> makePayment(String amount) async {
//     final int amt = int.parse(amount);

//     if (kIsWeb) {
//       // Web: open Stripe Checkout
//       final checkoutUrl = await createCheckoutSession(amount);
//       if (checkoutUrl != null && await canLaunch(checkoutUrl)) {
//         await launch(checkoutUrl, webOnlyWindowName: '_self');
//       }
//       return;
//     }

//     // Native: Payment Sheet
//     try {
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Online Pharmacy',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();

//       final newBalance = widget.walletBalance + amt;
//       await updateWallet(newBalance);

//       await addTransaction(
//         type: 'credit',
//         amount: amt,
//         title: 'Wallet Top-up',
//       );
//     } catch (e) {
//       debugPrint("Payment error: $e");
//     }
//   }

//   // Create Payment Intent (Native)
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }

//   // Create Checkout Session (Web)
//   Future<String?> createCheckoutSession(String amount) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-checkout-session'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data['url'];
//       } else {
//         debugPrint('Error creating checkout session: ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('Checkout session error: $e');
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   final TextEditingController _customAmountController = TextEditingController();
//   final String uid = FirebaseAuth.instance.currentUser!.uid;

//   DocumentReference get userDoc =>
//       FirebaseFirestore.instance.collection('users').doc(uid);

//   CollectionReference get transactionCol =>
//       userDoc.collection('transactions');

//   @override
//   void initState() {
//     super.initState();
//     // Check if redirected from Stripe Checkout
//     _checkStripeSuccess();
//   }

//   // Detect Stripe Checkout success via query parameter
//   void _checkStripeSuccess() async {
//     final params = Uri.base.queryParameters;
//     if (params.containsKey('amount')) {
//       final int amount = int.tryParse(params['amount'] ?? '0') ?? 0;
//       if (amount > 0) {
//         // Update wallet balance
//         final newBalance = widget.walletBalance + amount;
//         await userDoc.set({'walletBalance': newBalance}, SetOptions(merge: true));
//         widget.updateWalletBalance(newBalance);

//         // Add transaction
//         await transactionCol.add({
//           'type': 'credit',
//           'amount': amount,
//           'title': 'Wallet Top-up',
//           'createdAt': Timestamp.now(),
//         });

//         // Clean URL to prevent duplicate updates
//         final uri = Uri.parse(Uri.base.toString());
//         final cleanUri = uri.replace(queryParameters: {});
//         // ignore: undefined_prefixed_name
//         import 'dart:html' as html;
//         html.window.history.replaceState(null, '', cleanUri.toString());

//         setState(() {}); // refresh UI
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             // Wallet Card
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 90),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 6),
//                       Text("\$${widget.walletBalance}",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Quick Amount Buttons
//             SizedBox(
//               height: 45,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500].map((amount) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: GestureDetector(
//                       onTap: () => _launchCheckout(amount),
//                       child: Container(
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Add Money Button
//             Center(
//               child: GestureDetector(
//                 onTap: _showAddMoneyDialog,
//                 child: Container(
//                   height: 55,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xffbab3a6), Color(0xffddd7cd)],
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Add Money", style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Transactions
//             Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//             const SizedBox(height: 15),
//             StreamBuilder<QuerySnapshot>(
//               stream: transactionCol.orderBy('createdAt', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
//                 if (snapshot.data!.docs.isEmpty) return const Center(child: Text("No transactions yet"));

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final tx = snapshot.data!.docs[index];
//                     final bool isCredit = tx['type'] == 'credit';
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 225, 219, 248),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             isCredit ? "images/cashback.png" : "images/credit-card-payment.png",
//                             height: 40,
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(tx['title'], style: AppWidget.headlineTextStyle(16)),
//                                 Text(
//                                   isCredit ? "CREDIT" : "DEBIT",
//                                   style: TextStyle(
//                                     color: isCredit ? Colors.green : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text("\$${tx['amount']}", style: AppWidget.headlineTextStyle(18)),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Add Money Dialog
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount = _customAmountController.text.trim();
//               if (amount.isNotEmpty) {
//                 Navigator.pop(context);
//                 _launchCheckout(int.parse(amount));
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   // Launch Stripe Checkout
//   Future<void> _launchCheckout(int amount) async {
//     final checkoutUrl = await _createCheckoutSession(amount);
//     if (checkoutUrl != null && await canLaunch(checkoutUrl)) {
//       await launch(checkoutUrl, webOnlyWindowName: '_self');
//     }
//   }

//   // Call server to create Stripe Checkout session
//   Future<String?> _createCheckoutSession(int amount) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-checkout-session'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'uid': uid}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data['url'];
//       } else {
//         debugPrint('Error creating checkout session: ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('Checkout session error: $e');
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:html' as html; // Only used for Flutter Web

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   final TextEditingController _customAmountController = TextEditingController();
//   final String uid = FirebaseAuth.instance.currentUser!.uid;

//   DocumentReference get userDoc =>
//       FirebaseFirestore.instance.collection('users').doc(uid);

//   CollectionReference get transactionCol =>
//       userDoc.collection('transactions');

//   @override
//   void initState() {
//     super.initState();
//     if (kIsWeb) {
//       _checkStripeSuccess();
//     }
//   }

//   // Detect Stripe Checkout success via query parameter
//   void _checkStripeSuccess() async {
//     final params = Uri.base.queryParameters;
//     if (params.containsKey('amount')) {
//       final int amount = int.tryParse(params['amount'] ?? '0') ?? 0;
//       if (amount > 0) {
//         // Update wallet balance
//         final newBalance = widget.walletBalance + amount;
//         await userDoc.set({'walletBalance': newBalance}, SetOptions(merge: true));
//         widget.updateWalletBalance(newBalance);

//         // Add transaction
//         await transactionCol.add({
//           'type': 'credit',
//           'amount': amount,
//           'title': 'Wallet Top-up',
//           'createdAt': Timestamp.now(),
//         });

//         // Clean URL to prevent duplicate updates
//         final uri = Uri.parse(Uri.base.toString());
//         final cleanUri = uri.replace(queryParameters: {});
//         html.window.history.replaceState(null, '', cleanUri.toString());

//         setState(() {}); // refresh UI
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             // Wallet Card
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 90),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 6),
//                       Text("\$${widget.walletBalance}",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Quick Amount Buttons
//             SizedBox(
//               height: 45,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500].map((amount) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: GestureDetector(
//                       onTap: () => _launchCheckout(amount),
//                       child: Container(
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Add Money Button
//             Center(
//               child: GestureDetector(
//                 onTap: _showAddMoneyDialog,
//                 child: Container(
//                   height: 55,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xffbab3a6), Color(0xffddd7cd)],
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Add Money", style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Transactions
//             Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//             const SizedBox(height: 15),
//             StreamBuilder<QuerySnapshot>(
//               stream: transactionCol.orderBy('createdAt', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
//                 if (snapshot.data!.docs.isEmpty) return const Center(child: Text("No transactions yet"));

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final tx = snapshot.data!.docs[index];
//                     final bool isCredit = tx['type'] == 'credit';
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 225, 219, 248),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             isCredit ? "images/cashback.png" : "images/credit-card-payment.png",
//                             height: 40,
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(tx['title'], style: AppWidget.headlineTextStyle(16)),
//                                 Text(
//                                   isCredit ? "CREDIT" : "DEBIT",
//                                   style: TextStyle(
//                                     color: isCredit ? Colors.green : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text("\$${tx['amount']}", style: AppWidget.headlineTextStyle(18)),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Add Money Dialog
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount = _customAmountController.text.trim();
//               if (amount.isNotEmpty) {
//                 Navigator.pop(context);
//                 _launchCheckout(int.parse(amount));
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   // Launch Stripe Checkout
//   Future<void> _launchCheckout(int amount) async {
//     final checkoutUrl = await _createCheckoutSession(amount);
//     if (checkoutUrl != null && await canLaunch(checkoutUrl)) {
//       await launch(checkoutUrl, webOnlyWindowName: '_self');
//     }
//   }

//   // Call server to create Stripe Checkout session
//   Future<String?> _createCheckoutSession(int amount) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-checkout-session'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'uid': uid}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data['url'];
//       } else {
//         debugPrint('Error creating checkout session: ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('Checkout session error: $e');
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:html' as html; // Web-only

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   final TextEditingController _customAmountController = TextEditingController();
//   final String uid = FirebaseAuth.instance.currentUser!.uid;

//   DocumentReference get userDoc =>
//       FirebaseFirestore.instance.collection('users').doc(uid);

//   CollectionReference get transactionCol =>
//       userDoc.collection('transactions');

//   @override
//   void initState() {
//     super.initState();
//     if (kIsWeb) {
//       _checkStripeSuccess();
//     }
//   }

//   /// ================= Check Stripe success =================
//  void _checkStripeSuccess() async {
//   final params = Uri.base.queryParameters;
//   if (params.containsKey('amount')) {
//     final int amount = int.tryParse(params['amount'] ?? '0') ?? 0;
//     if (amount > 0) {
//       // Get latest wallet balance from Firestore
//       final docSnapshot = await userDoc.get();
//       int currentBalance = 0;
//       final data = docSnapshot.data() as Map<String, dynamic>?;

//       if (data != null && data['walletBalance'] != null) {
//         currentBalance = (data['walletBalance'] is int)
//             ? data['walletBalance'] as int
//             : (data['walletBalance'] as num).toInt();
//       } else {
//         currentBalance = 0;
//       }

//       // Update wallet balance
//       final newBalance = currentBalance + amount;
//       await userDoc.set({'walletBalance': newBalance}, SetOptions(merge: true));
//       widget.updateWalletBalance(newBalance);

//       // Add transaction
//       await transactionCol.add({
//         'type': 'credit',
//         'amount': amount,
//         'title': 'Wallet Top-up',
//         'createdAt': Timestamp.now(),
//       });

//       // Remove query parameters from URL
//       final uri = Uri.parse(Uri.base.toString());
//       final cleanUri = uri.replace(queryParameters: {});
//       html.window.history.replaceState(null, '', cleanUri.toString());

//       setState(() {}); // Refresh UI
//     }
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             // Wallet Card
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 90),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 6),
//                       Text("\$${widget.walletBalance}",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Quick Amount Buttons
//             SizedBox(
//               height: 45,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500].map((amount) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: GestureDetector(
//                       onTap: () => _launchCheckout(amount),
//                       child: Container(
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Add Money Button
//             Center(
//               child: GestureDetector(
//                 onTap: _showAddMoneyDialog,
//                 child: Container(
//                   height: 55,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xffbab3a6), Color(0xffddd7cd)],
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Add Money", style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Transactions
//             Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//             const SizedBox(height: 15),
//             StreamBuilder<QuerySnapshot>(
//               stream: transactionCol.orderBy('createdAt', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
//                 if (snapshot.data!.docs.isEmpty) return const Center(child: Text("No transactions yet"));

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final tx = snapshot.data!.docs[index];
//                     final bool isCredit = tx['type'] == 'credit';
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 225, 219, 248),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             isCredit ? "images/cashback.png" : "images/credit-card-payment.png",
//                             height: 40,
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(tx['title'], style: AppWidget.headlineTextStyle(16)),
//                                 Text(
//                                   isCredit ? "CREDIT" : "DEBIT",
//                                   style: TextStyle(
//                                     color: isCredit ? Colors.green : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text("\$${tx['amount']}", style: AppWidget.headlineTextStyle(18)),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Add Money Dialog
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount = _customAmountController.text.trim();
//               if (amount.isNotEmpty) {
//                 Navigator.pop(context);
//                 _launchCheckout(int.parse(amount));
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   // Launch Stripe Checkout
//   Future<void> _launchCheckout(int amount) async {
//     final checkoutUrl = await _createCheckoutSession(amount);
//     if (checkoutUrl != null && await canLaunch(checkoutUrl)) {
//       await launch(checkoutUrl, webOnlyWindowName: '_self');
//     }
//   }

//   // Call server to create Stripe Checkout session
//   Future<String?> _createCheckoutSession(int amount) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-checkout-session'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'uid': uid}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data['url'];
//       } else {
//         debugPrint('Error creating checkout session: ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('Checkout session error: $e');
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:html' as html; // Web-only

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   final TextEditingController _customAmountController = TextEditingController();
//   final String uid = FirebaseAuth.instance.currentUser!.uid;

//   DocumentReference get userDoc =>
//       FirebaseFirestore.instance.collection('users').doc(uid);

//   CollectionReference get transactionCol =>
//       userDoc.collection('transactions');

//   @override
//   void initState() {
//     super.initState();
//     if (kIsWeb) {
//       // Run after widget mount to ensure Firestore and UI are ready
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _checkStripeSuccess();
//       });
//     }
//   }

//   /// ================= Check Stripe success =================
//   void _checkStripeSuccess() async {
//     final params = Uri.base.queryParameters;
//     if (!params.containsKey('amount')) return;

//     final int amount = int.tryParse(params['amount'] ?? '0') ?? 0;
//     if (amount <= 0) return;

//     try {
//       // Fetch current wallet balance from Firestore
//       final docSnapshot = await userDoc.get();
//       final data = docSnapshot.data() as Map<String, dynamic>?;

//       int currentBalance = 0;
//       if (data != null && data['walletBalance'] != null) {
//         currentBalance = (data['walletBalance'] is int)
//             ? data['walletBalance'] as int
//             : (data['walletBalance'] as num).toInt();
//       }

//       // Update wallet balance
//       final newBalance = currentBalance + amount;
//       await userDoc.set({'walletBalance': newBalance}, SetOptions(merge: true));
//       widget.updateWalletBalance(newBalance);

//       // Add transaction
//       await transactionCol.add({
//         'type': 'credit',
//         'amount': amount,
//         'title': 'Wallet Top-up',
//         'createdAt': Timestamp.now(),
//       });

//       // Remove query parameters from URL to prevent duplicate updates
//       final uri = Uri.parse(Uri.base.toString());
//       final cleanUri = uri.replace(queryParameters: {});
//       html.window.history.replaceState(null, '', cleanUri.toString());

//       setState(() {}); // Refresh UI
//     } catch (e) {
//       debugPrint('Error updating wallet after Stripe: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             // Wallet Card
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 90),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 6),
//                       Text("\$${widget.walletBalance}",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Quick Amount Buttons
//             SizedBox(
//               height: 45,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500].map((amount) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: GestureDetector(
//                       onTap: () => _launchCheckout(amount),
//                       child: Container(
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 30),

//             // Add Money Button
//             Center(
//               child: GestureDetector(
//                 onTap: _showAddMoneyDialog,
//                 child: Container(
//                   height: 55,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xffbab3a6), Color(0xffddd7cd)],
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Add Money", style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 40),

//             // Transactions
//             Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//             const SizedBox(height: 15),
//             StreamBuilder<QuerySnapshot>(
//               stream: transactionCol.orderBy('createdAt', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
//                 if (snapshot.data!.docs.isEmpty) return const Center(child: Text("No transactions yet"));

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final tx = snapshot.data!.docs[index];
//                     final bool isCredit = tx['type'] == 'credit';
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 225, 219, 248),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             isCredit ? "images/cashback.png" : "images/credit-card-payment.png",
//                             height: 40,
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(tx['title'], style: AppWidget.headlineTextStyle(16)),
//                                 Text(
//                                   isCredit ? "CREDIT" : "DEBIT",
//                                   style: TextStyle(
//                                     color: isCredit ? Colors.green : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text("\$${tx['amount']}", style: AppWidget.headlineTextStyle(18)),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Add Money Dialog
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount = _customAmountController.text.trim();
//               if (amount.isNotEmpty) {
//                 Navigator.pop(context);
//                 _launchCheckout(int.parse(amount));
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   // Launch Stripe Checkout
//   Future<void> _launchCheckout(int amount) async {
//     final checkoutUrl = await _createCheckoutSession(amount);
//     if (checkoutUrl != null && await canLaunch(checkoutUrl)) {
//       await launch(checkoutUrl, webOnlyWindowName: '_self');
//     }
//   }

//   // Call server to create Stripe Checkout session
//   Future<String?> _createCheckoutSession(int amount) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-checkout-session'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'uid': uid}),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         return data['url'];
//       } else {
//         debugPrint('Error creating checkout session: ${response.body}');
//       }
//     } catch (e) {
//       debugPrint('Checkout session error: $e');
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   final TextEditingController _customAmountController = TextEditingController();
//   final String uid = FirebaseAuth.instance.currentUser!.uid;

//   DocumentReference get userDoc =>
//       FirebaseFirestore.instance.collection('users').doc(uid);

//   CollectionReference get transactionCol =>
//       userDoc.collection('transactions');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// 💳 WALLET CARD (LIVE FROM FIRESTORE)
//             StreamBuilder<DocumentSnapshot>(
//               stream: userDoc.snapshots(),
//               builder: (context, snapshot) {
//                 int balance = widget.walletBalance;

//                 if (snapshot.hasData && snapshot.data!.exists) {
//                   final data = snapshot.data!.data() as Map<String, dynamic>;
//                   balance = (data['walletBalance'] ?? 0) is int
//                       ? data['walletBalance']
//                       : (data['walletBalance'] as num).toInt();
//                 }

//                 return Container(
//                   padding: const EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xffbab3a6),
//                         Color(0xffddd7cd),
//                         Color(0xffa59c8f)
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       Image.asset("images/wallet.png", height: 90),
//                       const SizedBox(width: 20),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Your Wallet",
//                               style: AppWidget.headlineTextStyle(22)),
//                           const SizedBox(height: 6),
//                           Text("\$$balance",
//                               style: AppWidget.headlineTextStyle(30)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 30),

//             /// 💰 QUICK AMOUNTS
//             SizedBox(
//               height: 45,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500].map((amount) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: GestureDetector(
//                       onTap: () => _launchCheckout(amount),
//                       child: Container(
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ➕ ADD MONEY
//             Center(
//               child: GestureDetector(
//                 onTap: _showAddMoneyDialog,
//                 child: Container(
//                   height: 55,
//                   width: 280,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xffbab3a6), Color(0xffddd7cd)],
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Add Money",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 40),

//             /// 📜 TRANSACTIONS (REALTIME)
//             Text("Your Transactions",
//                 style: AppWidget.headlineTextStyle(22)),
//             const SizedBox(height: 15),

//             StreamBuilder<QuerySnapshot>(
//               stream: transactionCol
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.data!.docs.isEmpty) {
//                   return const Center(child: Text("No transactions yet"));
//                 }

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     final tx = snapshot.data!.docs[index];
//                     final bool isCredit = tx['type'] == 'credit';

//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 225, 219, 248),
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             isCredit
//                                 ? "images/cashback.png"
//                                 : "images/credit-card-payment.png",
//                             height: 40,
//                           ),
//                           const SizedBox(width: 15),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(tx['title'],
//                                     style:
//                                         AppWidget.headlineTextStyle(16)),
//                                 Text(
//                                   isCredit ? "CREDIT" : "DEBIT",
//                                   style: TextStyle(
//                                     color: isCredit
//                                         ? Colors.green
//                                         : Colors.red,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text("\$${tx['amount']}",
//                               style: AppWidget.headlineTextStyle(18)),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ➕ ADD MONEY DIALOG
//   void _showAddMoneyDialog() {
//     _customAmountController.clear();
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Enter Amount"),
//         content: TextField(
//           controller: _customAmountController,
//           keyboardType: TextInputType.number,
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () {
//               final amount =
//                   int.tryParse(_customAmountController.text.trim());
//               if (amount != null && amount > 0) {
//                 Navigator.pop(context);
//                 _launchCheckout(amount);
//               }
//             },
//             child: const Text("Pay"),
//           ),
//         ],
//       ),
//     );
//   }

//   /// 🌐 OPEN STRIPE CHECKOUT IN NEW TAB
//   Future<void> _launchCheckout(int amount) async {
//     final checkoutUrl = await _createCheckoutSession(amount);
//     if (checkoutUrl != null) {
//       await launch(
//         checkoutUrl,
//         webOnlyWindowName: '_blank', // ✅ NEW TAB
//       );
//     }
//   }

//   /// 📡 CALL BACKEND
//   Future<String?> _createCheckoutSession(int amount) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-checkout-session'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'uid': uid}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body)['url'];
//       }
//     } catch (e) {
//       debugPrint('Stripe error: $e');
//     }
//     return null;
//   }
// }


// import 'dart:convert';
// import 'package:flutter/foundation.dart'; // kIsWeb
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Container(
//         margin: const EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26.0)),
//             const SizedBox(height: 20),

//             /// Wallet Card
//             Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(right: 20),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100, width: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     children: [
//                       Text("Your Wallet",
//                           style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$200",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// Amount Selector
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => makePayment(amount.toString()),
//                         child: Container(
//                           width: 130,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "\$$amount",
//                               style: AppWidget.whiteTextStyle(18),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                     ],
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 40),

//             /// Add Money (Info Page)
//             Center(
//               child: GestureDetector(
//                 onTap: () async {
//                   final uri =
//                       Uri.parse('https://stripe.com/docs/testing');
//                   await launchUrl(uri,
//                       mode: LaunchMode.externalApplication);
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 1.5),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xffbab3a6),
//                         Color(0xffddd7cd),
//                         Color(0xffa59c8f),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Text("Add Money",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 50),

//             /// Transactions Section
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 225, 219, 248),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     Text("Your Transactions",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================

//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         // 🌐 WEB → Stripe Checkout
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           final String checkoutUrl = data['url'];

//           final uri = Uri.parse(checkoutUrl);
//           await launchUrl(uri,
//               mode: LaunchMode.externalApplication);
//         } else {
//           debugPrint(response.body);
//         }
//         return;
//       }

//       // 📱 MOBILE → PaymentSheet
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Adnan',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   /// ================= MOBILE BACKEND =================

//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   final int walletBalance;
//   final Function(int) updateWalletBalance;

//   const Wallet({
//     super.key,
//     required this.walletBalance,
//     required this.updateWalletBalance,
//   });

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   bool loading = true;
//   int balance = 0;
//   List<dynamic> transactions = [];

//   @override
//   void initState() {
//     super.initState();
//     loadWallet();
//   }

//   Future<void> loadWallet() async {
//     try {
//       final balanceRes =
//           await http.get(Uri.parse('http://localhost:4242/wallet'));
//       final txRes = await http
//           .get(Uri.parse('http://localhost:4242/wallet/transactions'));

//       if (balanceRes.statusCode == 200 && txRes.statusCode == 200) {
//         setState(() {
//           balance = jsonDecode(balanceRes.body)['balance'];
//           transactions = jsonDecode(txRes.body);
//           loading = false;
//         });

//         widget.updateWalletBalance(balance);
//       }
//     } catch (e) {
//       debugPrint("Wallet load error: $e");
//     }
//   }

//   Future<void> addMoney(int amount) async {
//     final res = await http.post(
//       Uri.parse('http://localhost:4242/create-checkout-session'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount}),
//     );

//     if (res.statusCode == 200) {
//       final url = jsonDecode(res.body)['url'];
//       await launchUrl(Uri.parse(url),
//           mode: LaunchMode.externalApplication);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (loading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// WALLET CARD
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 80),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet",
//                           style: AppWidget.headlineTextStyle(22)),
//                       Text("\$$balance",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// AMOUNT BUTTONS
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [100, 200, 500, 1000].map((amt) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 16),
//                     child: GestureDetector(
//                       onTap: () => addMoney(amt),
//                       child: Container(
//                         width: 120,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text("\$$amt",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),

//             const SizedBox(height: 40),

//             /// TRANSACTIONS
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 225, 219, 248),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Your Transactions",
//                       style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 20),

//                   if (transactions.isEmpty)
//                     const Text("No transactions yet"),

//                   ...transactions.map((tx) => ListTile(
//                         leading: const Icon(Icons.arrow_downward,
//                             color: Colors.green),
//                         title: Text("\$${tx['amount']} added"),
//                         subtitle: Text(tx['created_at']),
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Container(
//         margin: const EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26.0)),
//             const SizedBox(height: 20.0),
//             Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(right: 20),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "images/wallet.png",
//                     height: 100,
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ),
//                   const SizedBox(width: 20),
//                   Column(
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$200", style: AppWidget.headlineTextStyle(30.0))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             // Amount selection list
//             Container(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 children: List.generate(
//                   10,
//                   (index) {
//                     final amount = (index + 1) * 100;
//                     return Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () => makePayment(amount.toString()),
//                           child: Container(
//                             width: 130,
//                             height: 40,
//                             decoration: BoxDecoration(
//                               color: Colors.black,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                                 child: Text("\$$amount", style: AppWidget.whiteTextStyle(18))),
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 40),
//             Center(
//               child: Container(
//                 height: 60,
//                 width: 300,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white, width: 1.5),
//                   gradient: const LinearGradient(
//                     colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(child: Text("Add Money", style: AppWidget.headlineTextStyle(22))),
//               ),
//             ),
//             const SizedBox(height: 50),
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 225, 219, 248),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> makePayment(String amount) async {
//     try {
//       paymentIntent = await createPaymentIntent(amount, 'USD');

//       if (paymentIntent == null) return;

//       // Payment Sheet
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           style: ThemeMode.dark,
//           merchantDisplayName: 'Adnan',
//         ),
//       );

//       displayPaymentSheet();
//     } catch (e, s) {
//       print('Exception: $e\nStackTrace: $s');
//     }
//   }

//   displayPaymentSheet() async {
//     try {
//       await Stripe.instance.presentPaymentSheet();
//       if (!mounted) return;
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: const [
//               Row(
//                 children: [
//                   Icon(
//                     Icons.check_circle,
//                     color: Colors.green,
//                   ),
//                   SizedBox(width: 5),
//                   Text("Payment Successful!"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//       paymentIntent = null;
//     } on StripeException catch (e) {
//       if (!mounted) return;
//       print('Stripe Error: $e');
//       showDialog(
//         context: context,
//         builder: (_) => const AlertDialog(content: Text("Payment Cancelled")),
//       );
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
//     try {
//       // Use your local development server
//       final url = Uri.parse('http://localhost:4242/create-payment-intent');
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         print('Failed to create payment intent: ${response.body}');
//         return null;
//       }
//     } catch (err) {
//       print('Error creating payment intent: $err');
//       return null;
//     }
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart'; // kIsWeb
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Container(
//         margin: const EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26.0)),
//             const SizedBox(height: 20),

//             /// Wallet Card
//             Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(right: 20),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100, width: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     children: [
//                       Text("Your Wallet",
//                           style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$200",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// Amount Selector
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => makePayment(amount.toString()),
//                         child: Container(
//                           width: 130,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "\$$amount",
//                               style: AppWidget.whiteTextStyle(18),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                     ],
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 40),

//             /// Add Money (Info Page)
//             Center(
//               child: GestureDetector(
//                 onTap: () async {
//                   final uri =
//                       Uri.parse('https://stripe.com/docs/testing');
//                   await launchUrl(uri,
//                       mode: LaunchMode.externalApplication);
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 1.5),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xffbab3a6),
//                         Color(0xffddd7cd),
//                         Color(0xffa59c8f),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Text("Add Money",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 50),

//             /// Transactions Section
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 225, 219, 248),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     Text("Your Transactions",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================

//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         // 🌐 WEB → Stripe Checkout
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           final String checkoutUrl = data['url'];

//           final uri = Uri.parse(checkoutUrl);
//           await launchUrl(uri,
//               mode: LaunchMode.externalApplication);
//         } else {
//           debugPrint(response.body);
//         }
//         return;
//       }

//       // 📱 MOBILE → PaymentSheet
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Adnan',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   /// ================= MOBILE BACKEND =================

//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart'; // For kIsWeb
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;

//   @override
//   void initState() {
//     super.initState();
//     _checkPaymentResult();
//   }

//   /// Detect query param in URL for web and show popup
//   void _checkPaymentResult() {
//     if (kIsWeb) {
//       final uri = Uri.base; // Current URL
//       final paymentStatus = uri.queryParameters['payment'];
//       if (paymentStatus == 'success') {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           _showPaymentDialog(true);
//         });
//       } else if (paymentStatus == 'cancel') {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           _showPaymentDialog(false);
//         });
//       }
//     }
//   }

//   void _showPaymentDialog(bool success) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(success ? "✅ Payment Successful" : "❌ Payment Cancelled"),
//         content: Text(success
//             ? "Your wallet has been updated successfully."
//             : "You cancelled the payment."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: Container(
//         margin: const EdgeInsets.only(top: 60, left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26.0)),
//             const SizedBox(height: 20),
//             /// Wallet Card
//             Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(right: 20),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100, width: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     children: [
//                       Text("Your Wallet",
//                           style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$200",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             /// Amount Selector
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => makePayment(amount.toString()),
//                         child: Container(
//                           width: 130,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "\$$amount",
//                               style: AppWidget.whiteTextStyle(18),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//             const SizedBox(height: 40),
//             /// Add Money (Info Page)
//             Center(
//               child: GestureDetector(
//                 onTap: () async {
//                   final uri = Uri.parse('https://stripe.com/docs/testing');
//                   await launchUrl(uri, mode: LaunchMode.externalApplication);
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 300,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white, width: 1.5),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color(0xffbab3a6),
//                         Color(0xffddd7cd),
//                         Color(0xffa59c8f),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Text("Add Money",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 50),
//             /// Transactions Section
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 225, 219, 248),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     Text("Your Transactions",
//                         style: AppWidget.headlineTextStyle(22)),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================

//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         // 🌐 WEB → Stripe Checkout
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           final String checkoutUrl = data['url'];
//           final uri = Uri.parse(checkoutUrl);
//           await launchUrl(uri, mode: LaunchMode.externalApplication);
//         } else {
//           debugPrint(response.body);
//         }
//         return;
//       }

//       // 📱 MOBILE → PaymentSheet
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Adnan',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   /// ================= MOBILE BACKEND =================

//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'package:flutter/foundation.dart'; // kIsWeb
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 200; // Starting balance
//   List<Map<String, dynamic>> transactions = []; // Dynamic transaction list

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26.0)),
//             const SizedBox(height: 20),

//             /// Wallet Card
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100, width: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$$walletBalance", style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// Amount Selector
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => makePayment(amount.toString()),
//                         child: Container(
//                           width: 130,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text("\$$amount", style: AppWidget.whiteTextStyle(18)),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                     ],
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// Add Money Custom Amount
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final amountController = TextEditingController();
//                   await showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       title: const Text("Enter Amount"),
//                       content: TextField(
//                         controller: amountController,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(hintText: "Amount in USD"),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("Cancel"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             final amt = amountController.text.trim();
//                             if (amt.isNotEmpty && int.tryParse(amt) != null) {
//                               Navigator.pop(context);
//                               makePayment(amt);
//                             }
//                           },
//                           child: const Text("Pay"),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: const Text("Add Money"),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// Transactions Section
//             Container(
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 225, 219, 248),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Text("Your Transactions", style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 10),
//                   if (transactions.isEmpty)
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("No transactions yet."),
//                     ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (context, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: Image.asset(
//         'images/cashback.png',
//         width: 32,
//         height: 32,
//         fit: BoxFit.contain,
//       ),
//                         title: Text(tx['title']),
//                         subtitle: Text(tx['subtitle']),
//                         trailing: Text("\$${tx['amount']}"),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         // 🌐 WEB → Stripe Checkout
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           final String checkoutUrl = data['url'];
//           final uri = Uri.parse(checkoutUrl);
//           await launchUrl(uri, mode: LaunchMode.externalApplication);

//           // Update wallet locally since redirect is manual
//           _addTransaction(amount);
//         } else {
//           debugPrint('Failed to create checkout session: ${response.body}');
//         }
//         return;
//       }

//       // 📱 MOBILE → PaymentSheet
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Adnan',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();

//       // Update wallet balance after successful mobile payment
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   /// ================= HELPER =================
//   void _addTransaction(String amount) {
//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, {
//         'title': 'Wallet Top-Up',
//         'subtitle': 'Completed',
//         'amount': amount,
//       });
//     });
//   }

//   /// ================= MOBILE BACKEND =================
//   Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://localhost:4242/create-payment-intent'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'amount': amount, 'currency': currency}),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'dart:html' as html; // ✅ WEB
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 200;
//   List<Map<String, dynamic>> transactions = [];

//   @override
//   void initState() {
//     super.initState();

//     // ✅ Handle Stripe success redirect (WEB)
//     if (kIsWeb) {
//       final uri = Uri.base;

//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           _addTransaction(amount);
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// WALLET CARD
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 80),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       Text("\$$walletBalance",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// QUICK AMOUNTS
//             SizedBox(
//               height: 50,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 itemBuilder: (_, i) {
//                   final amount = (i + 1) * 100;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 15),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 120,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Text("\$$amount",
//                             style: AppWidget.whiteTextStyle(18)),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// TRANSACTIONS
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 225, 219, 248),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Text("Your Transactions",
//                       style: AppWidget.headlineTextStyle(22)),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (_, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: Image.asset(
//                           'images/cashback.png',
//                           width: 32,
//                         ),
//                         title: Text(tx['title']),
//                         subtitle: Text(tx['subtitle']),
//                         trailing: Text("\$${tx['amount']}"),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank'); // ✅ New tab
//         }
//         return;
//       }

//       // 📱 MOBILE
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   void _addTransaction(String amount) {
//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, {
//         'title': 'Wallet Top-Up',
//         'subtitle': 'Completed',
//         'amount': amount,
//       });
//     });
//   }

//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }


// import 'dart:convert';
// import 'dart:html' as html; // WEB ONLY
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 200;
//   List<Map<String, dynamic>> transactions = [];

//   // ✅ IMPORTANT: prevents multiple balance updates
//   bool _paymentHandled = false;

//   @override
//   void initState() {
//     super.initState();
//     // ❌ DO NOT handle Stripe redirect here on Web
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ✅ HANDLE STRIPE REDIRECT (WEB)
//     if (kIsWeb && !_paymentHandled) {
//       final uri = Uri.base;

//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];

//         if (amount != null) {
//           _paymentHandled = true;

//           // Delay setState until after build
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             _addTransaction(amount);
//           });
//         }
//       }
//     }

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// ================= WALLET CARD =================
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet",
//                           style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$$walletBalance",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ================= QUICK AMOUNT BUTTONS =================
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 130,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "\$$amount",
//                             style: AppWidget.whiteTextStyle(18),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// ================= ADD MONEY BUTTON =================
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final controller = TextEditingController();
//                   await showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       title: const Text("Enter Amount"),
//                       content: TextField(
//                         controller: controller,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           hintText: "Amount in USD",
//                         ),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text("Cancel"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             final amt = controller.text.trim();
//                             if (amt.isNotEmpty &&
//                                 int.tryParse(amt) != null) {
//                               Navigator.pop(context);
//                               makePayment(amt);
//                             }
//                           },
//                           child: const Text("Pay"),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: const Text("Add Money"),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ================= TRANSACTIONS =================
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 225, 219, 248),
//                 borderRadius:
//                     BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Text(
//                     "Your Transactions",
//                     style: AppWidget.headlineTextStyle(22),
//                   ),
//                   const SizedBox(height: 10),

//                   if (transactions.isEmpty)
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("No transactions yet."),
//                     ),

//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (context, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: Image.asset(
//                           'images/cashback.png',
//                           width: 32,
//                           height: 32,
//                         ),
//                         title: Text(tx['title']),
//                         subtitle: Text(tx['subtitle']),
//                         trailing: Text("\$${tx['amount']}"),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank'); // ✅ new tab
//         }
//         return;
//       }

//       // 📱 MOBILE FLOW
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   void _addTransaction(String amount) {
//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, {
//         'title': 'Wallet Top-Up',
//         'subtitle': 'Completed',
//         'amount': amount,
//       });
//     });
//   }

//   Future<Map<String, dynamic>?> createPaymentIntent(
//     String amount,
//     String currency,
//   ) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'dart:html' as html; // WEB ONLY
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   int walletBalance = 0;
//   List<Map<String, dynamic>> transactions = [];
//   bool _paymentHandled = false;

//   final user = FirebaseAuth.instance.currentUser!;
//   final firestore = FirebaseFirestore.instance;

//   @override
//   void initState() {
//     super.initState();
//     _loadWalletFromFirestore();
//   }

//   /// ================= LOAD WALLET FROM FIRESTORE =================
//   Future<void> _loadWalletFromFirestore() async {
//     final userDoc = await firestore.collection('users').doc(user.uid).get();

//     setState(() {
//       walletBalance = userDoc.data()?['walletBalance'] ?? 0;
//     });

//     final txSnapshot = await firestore
//         .collection('users')
//         .doc(user.uid)
//         .collection('transactions')
//         .orderBy('timestamp', descending: true)
//         .get();

//     setState(() {
//       transactions = txSnapshot.docs
//           .map((doc) => {
//                 'title': doc['title'],
//                 'subtitle': doc['subtitle'],
//                 'amount': doc['amount'],
//               })
//           .toList();
//     });
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> _addTransaction(String amount) async {
//     final int amt = int.parse(amount);

//     // Update local state
//     setState(() {
//       walletBalance += amt;
//       transactions.insert(0, {
//         'title': 'Wallet Top-Up',
//         'subtitle': 'Completed',
//         'amount': amount,
//       });
//     });

//     final userRef = firestore.collection('users').doc(user.uid);

//     // Update wallet balance in Firestore
//     await userRef.set({'walletBalance': walletBalance}, SetOptions(merge: true));

//     // Add transaction in subcollection
//     await userRef.collection('transactions').add({
//       'title': 'Wallet Top-Up',
//       'subtitle': 'Completed',
//       'amount': amount,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ✅ Handle Stripe redirect for Web after reload
//     if (kIsWeb && !_paymentHandled) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           _paymentHandled = true;
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             _addTransaction(amount);
//           });
//         }
//       }
//     }

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// WALLET CARD
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet",
//                           style: AppWidget.headlineTextStyle(22)),
//                       Text("\$$walletBalance",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// QUICK AMOUNTS
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 130,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// ADD MONEY
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final controller = TextEditingController();
//                   await showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       title: const Text("Enter Amount"),
//                       content: TextField(
//                         controller: controller,
//                         keyboardType: TextInputType.number,
//                         decoration:
//                             const InputDecoration(hintText: "Amount in USD"),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text("Cancel"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             final amt = controller.text.trim();
//                             if (amt.isNotEmpty && int.tryParse(amt) != null) {
//                               Navigator.pop(context);
//                               makePayment(amt);
//                             }
//                           },
//                           child: const Text("Pay"),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: const Text("Add Money"),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// TRANSACTIONS
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 225, 219, 248),
//                 borderRadius:
//                     BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Text("Your Transactions",
//                       style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 10),

//                   if (transactions.isEmpty)
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("No transactions yet."),
//                     ),

//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (_, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: Image.asset(
//                           'images/cashback.png',
//                           width: 32,
//                         ),
//                         title: Text(tx['title']),
//                         subtitle: Text(tx['subtitle']),
//                         trailing: Text("\$${tx['amount']}"),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank');
//         }
//         return;
//       }

//       // MOBILE PAYMENT INTENT
//       final paymentIntent = await _createPaymentIntent(amount, 'usd');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       await _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   Future<Map<String, dynamic>?> _createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }

// import 'dart:convert';
// import 'dart:html' as html; // WEB ONLY
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import '../services/database.dart'; // Make sure this path is correct

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   int walletBalance = 0;
//   List<Map<String, dynamic>> transactions = [];
//   bool _paymentHandled = false;

//   final user = FirebaseAuth.instance.currentUser!;
//   final db = DatabaseMethods();

//   @override
//   void initState() {
//     super.initState();
//     _loadWallet();
//   }

//   /// ================= LOAD WALLET =================
//   Future<void> _loadWallet() async {
//     final balance = await db.getWalletBalance(user.uid);
//     final txs = await db.getTransactions(user.uid);

//     setState(() {
//       walletBalance = balance;
//       transactions = txs;
//     });
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> _addTransaction(String amount) async {
//     final int amt = int.parse(amount);

//     // Update Firestore using DatabaseMethods
//     await db.addMoney(user.uid, amt);

//     // Reload wallet to refresh UI
//     await _loadWallet();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Handle Stripe redirect for Web after reload
//     if (kIsWeb && !_paymentHandled) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           _paymentHandled = true;
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             _addTransaction(amount);
//           });
//         }
//       }
//     }

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// WALLET CARD
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xffbab3a6),
//                     Color(0xffddd7cd),
//                     Color(0xffa59c8f),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet",
//                           style: AppWidget.headlineTextStyle(22)),
//                       Text("\$$walletBalance",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// QUICK AMOUNTS
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 130,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// ADD MONEY
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final controller = TextEditingController();
//                   await showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       title: const Text("Enter Amount"),
//                       content: TextField(
//                         controller: controller,
//                         keyboardType: TextInputType.number,
//                         decoration:
//                             const InputDecoration(hintText: "Amount in USD"),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text("Cancel"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             final amt = controller.text.trim();
//                             if (amt.isNotEmpty &&
//                                 int.tryParse(amt) != null) {
//                               Navigator.pop(context);
//                               makePayment(amt);
//                             }
//                           },
//                           child: const Text("Pay"),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: const Text("Add Money"),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// TRANSACTIONS
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 225, 219, 248),
//                 borderRadius:
//                     BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Text("Your Transactions",
//                       style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 10),

//                   if (transactions.isEmpty)
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("No transactions yet."),
//                     ),

//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (_, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: Image.asset(
//                           'images/cashback.png',
//                           width: 32,
//                         ),
//                         title: Text(tx['title']),
//                         subtitle: Text(tx['subtitle']),
//                         trailing: Text("\$${tx['amount']}"),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank'); // Stripe checkout opens in new tab
//         }
//         return;
//       }

//       // MOBILE PAYMENT INTENT
//       final paymentIntent = await _createPaymentIntent(amount, 'usd');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       await _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   Future<Map<String, dynamic>?> _createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }






///////////////////////////////////////// RECENTLY USED  10:40//////////////////////////////////////////




// import 'dart:convert';
// import 'dart:html' as html; // WEB ONLY
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 200;
//   List<Map<String, dynamic>> transactions = [];

//   @override
//   void initState() {
//     super.initState();

//     // ✅ Handle Stripe success redirect (WEB)
//     if (kIsWeb) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           _addTransaction(amount);
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 184, 182, 218),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// ================= WALLET CARD =================
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Color(0xffbab3a6), Color(0xffddd7cd), Color(0xffa59c8f)],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Your Wallet", style: AppWidget.headlineTextStyle(22)),
//                       const SizedBox(height: 5),
//                       Text("\$$walletBalance",
//                           style: AppWidget.headlineTextStyle(30)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ================= QUICK AMOUNT BUTTONS =================
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 130,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text("\$$amount",
//                               style: AppWidget.whiteTextStyle(18)),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// ================= ADD MONEY BUTTON =================
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final controller = TextEditingController();
//                   await showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       title: const Text("Enter Amount"),
//                       content: TextField(
//                         controller: controller,
//                         keyboardType: TextInputType.number,
//                         decoration:
//                             const InputDecoration(hintText: "Amount in USD"),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text("Cancel"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             final amt = controller.text.trim();
//                             if (amt.isNotEmpty && int.tryParse(amt) != null) {
//                               Navigator.pop(context);
//                               makePayment(amt);
//                             }
//                           },
//                           child: const Text("Pay"),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: const Text("Add Money"),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ================= TRANSACTIONS =================
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 225, 219, 248),
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Text("Your Transactions",
//                       style: AppWidget.headlineTextStyle(22)),
//                   const SizedBox(height: 10),

//                   if (transactions.isEmpty)
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("No transactions yet."),
//                     ),

//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (context, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: Image.asset(
//                           'images/cashback.png',
//                           width: 32,
//                           height: 32,
//                         ),
//                         title: Text(tx['title']),
//                         subtitle: Text(tx['subtitle']),
//                         trailing: Text("\$${tx['amount']}"),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'amount': amount}),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank'); // ✅ new tab
//         }
//         return;
//       }

//       // 📱 MOBILE FLOW
//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//     }
//   }

//   void _addTransaction(String amount) {
//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, {
//         'title': 'Wallet Top-Up',
//         'subtitle': 'Completed',
//         'amount': amount,
//       });
//     });
//   }

//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }




// import 'dart:convert';
// import 'dart:html' as html; // WEB ONLY
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 200;
//   List<Map<String, dynamic>> transactions = [];

//   @override
//   void initState() {
//     super.initState();

//     // ✅ Handle Stripe success redirect (WEB)
//     if (kIsWeb) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           _addTransaction(amount);
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// ================= WALLET CARD =================
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     theme.colorScheme.primary.withOpacity(0.9),
//                     theme.colorScheme.primary.withOpacity(0.7),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Your Wallet",
//                         style: AppWidget.whiteTextStyle(22),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "\$$walletBalance",
//                         style: AppWidget.whiteTextStyle(30),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ================= QUICK AMOUNT BUTTONS =================
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 130,
//                         decoration: BoxDecoration(
//                           color: theme.colorScheme.primary,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "\$$amount",
//                             style: AppWidget.whiteTextStyle(18),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// ================= ADD MONEY BUTTON =================
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final controller = TextEditingController();
//                   await showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       backgroundColor: theme.cardColor,
//                       title: const Text("Enter Amount"),
//                       content: TextField(
//                         controller: controller,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           hintText: "Amount in USD",
//                         ),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text("Cancel"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             final amt = controller.text.trim();
//                             if (amt.isNotEmpty &&
//                                 int.tryParse(amt) != null) {
//                               Navigator.pop(context);
//                               makePayment(amt);
//                             }
//                           },
//                           child: const Text("Pay"),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: const Text("Add Money"),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// ================= TRANSACTIONS =================
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.surface,
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Text(
//                     "Your Transactions",
//                     style: AppWidget.headlineTextStyle(22),
//                   ),
//                   const SizedBox(height: 10),

//                   if (transactions.isEmpty)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "No transactions yet.",
//                         style: theme.textTheme.bodyMedium,
//                       ),
//                     ),

//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (context, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: Image.asset(
//                           'images/cashback.png',
//                           width: 32,
//                           height: 32,
//                         ),
//                         title: Text(
//                           tx['title'],
//                           style: theme.textTheme.titleMedium,
//                         ),
//                         subtitle: Text(
//                           tx['subtitle'],
//                           style: theme.textTheme.bodySmall,
//                         ),
//                         trailing: Text(
//                           "\$${tx['amount']}",
//                           style: theme.textTheme.titleMedium,
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({
//             'amount': amount,
//             'email': FirebaseAuth.instance.currentUser!.email,
//           }),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank');
//         }
//         return;
//       }

//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Payment Failed: $e'),
//             backgroundColor: Theme.of(context).colorScheme.error,
//           ),
//         );
//       }
//     }
//   }

//   /// ================= ADD TRANSACTION =================
//   void _addTransaction(String amount) {
//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, {
//         'title': 'Wallet Top-Up',
//         'subtitle': 'Completed',
//         'amount': amount,
//       });
//     });

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//               'Payment Successful! \$${amount} added to wallet.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }

//   /// ================= CREATE PAYMENT INTENT =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }



// import 'dart:convert';
// import 'dart:html' as html; // WEB ONLY
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 0;
//   List<Map<String, dynamic>> transactions = [];
//   User? user;

//   @override
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       // Real-time listener for wallet and transactions
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(user!.email)
//           .snapshots()
//           .listen((doc) {
//         if (doc.exists) {
//           setState(() {
//             walletBalance = (doc.data()?['walletBalance'] ?? 0).toInt();
//             transactions = List<Map<String, dynamic>>.from(
//                 doc.data()?['transactions'] ?? []);
//           });
//         }
//       });
//     }

//     // Handle Stripe web success redirect
//     if (kIsWeb) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content:
//                   Text('Payment Successful! \$${amount} added to wallet.'),
//               backgroundColor: Colors.green,
//             ),
//           );
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//             const SizedBox(height: 20),

//             /// WALLET CARD
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     theme.colorScheme.primary.withOpacity(0.9),
//                     theme.colorScheme.primary.withOpacity(0.7),
//                   ],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Row(
//                 children: [
//                   Image.asset("images/wallet.png", height: 100),
//                   const SizedBox(width: 20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Your Wallet",
//                         style: AppWidget.whiteTextStyle(22),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         "\$$walletBalance",
//                         style: AppWidget.whiteTextStyle(30),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// QUICK AMOUNT BUTTONS
//             SizedBox(
//               height: 50,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(10, (index) {
//                   final amount = (index + 1) * 100;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 20),
//                     child: GestureDetector(
//                       onTap: () => makePayment(amount.toString()),
//                       child: Container(
//                         width: 130,
//                         decoration: BoxDecoration(
//                           color: theme.colorScheme.primary,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "\$$amount",
//                             style: AppWidget.whiteTextStyle(18),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// ADD MONEY BUTTON
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final controller = TextEditingController();
//                   await showDialog(
//                     context: context,
//                     builder: (_) => AlertDialog(
//                       backgroundColor: theme.cardColor,
//                       title: const Text("Enter Amount"),
//                       content: TextField(
//                         controller: controller,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           hintText: "Amount in USD",
//                         ),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text("Cancel"),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             final amt = controller.text.trim();
//                             if (amt.isNotEmpty &&
//                                 int.tryParse(amt) != null) {
//                               Navigator.pop(context);
//                               makePayment(amt);
//                             }
//                           },
//                           child: const Text("Pay"),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//                 child: const Text("Add Money"),
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// TRANSACTION HISTORY
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.surface,
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(30)),
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   Text(
//                     "Your Transactions",
//                     style: AppWidget.headlineTextStyle(22),
//                   ),
//                   const SizedBox(height: 10),

//                   if (transactions.isEmpty)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "No transactions yet.",
//                         style: theme.textTheme.bodyMedium,
//                       ),
//                     ),

//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: transactions.length,
//                     itemBuilder: (context, index) {
//                       final tx = transactions[index];
//                       return ListTile(
//                         leading: Image.asset(
//                           'images/cashback.png',
//                           width: 32,
//                           height: 32,
//                         ),
//                         title: Text(tx['title'],
//                             style: theme.textTheme.titleMedium),
//                         subtitle: Text(tx['subtitle'],
//                             style: theme.textTheme.bodySmall),
//                         trailing: Text("\$${tx['amount']}",
//                             style: theme.textTheme.titleMedium),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   /// MAKE PAYMENT
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({
//             'amount': amount,
//             'email': user!.email,
//           }),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank');
//         }
//         return;
//       }

//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Payment Successful! \$${amount} added to wallet.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Payment Failed: $e'),
//             backgroundColor: Theme.of(context).colorScheme.error,
//           ),
//         );
//       }
//     }
//   }

//   /// CREATE PAYMENT INTENT
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }


// import 'dart:convert';
// import 'dart:html' as html; // WEB ONLY
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 0;
//   List<Map<String, dynamic>> transactions = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadWallet();

//     // ✅ Handle Stripe success redirect (WEB)
//     if (kIsWeb) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           _addTransaction(amount);
//         }
//       }
//     }
//   }

//   /// ================= LOAD WALLET =================
//   Future<void> _loadWallet() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     // Listen to real-time updates
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .snapshots()
//         .listen((doc) {
//       final data = doc.data();
//       if (data != null) {
//         setState(() {
//           walletBalance = data['walletBalance']?.toInt() ?? 0;
//           transactions =
//               List<Map<String, dynamic>>.from(data['transactions'] ?? []);
//           _isLoading = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//                   const SizedBox(height: 20),

//                   /// ================= WALLET CARD =================
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           theme.colorScheme.primary.withOpacity(0.9),
//                           theme.colorScheme.primary.withOpacity(0.7),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset("images/wallet.png", height: 100),
//                         const SizedBox(width: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Your Wallet",
//                               style: AppWidget.whiteTextStyle(22),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               "\$$walletBalance",
//                               style: AppWidget.whiteTextStyle(30),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= QUICK AMOUNT BUTTONS =================
//                   SizedBox(
//                     height: 50,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(10, (index) {
//                         final amount = (index + 1) * 100;
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 20),
//                           child: GestureDetector(
//                             onTap: () => makePayment(amount.toString()),
//                             child: Container(
//                               width: 130,
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.primary,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "\$$amount",
//                                   style: AppWidget.whiteTextStyle(18),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// ================= ADD MONEY BUTTON =================
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         final controller = TextEditingController();
//                         await showDialog(
//                           context: context,
//                           builder: (_) => AlertDialog(
//                             backgroundColor: theme.cardColor,
//                             title: const Text("Enter Amount"),
//                             content: TextField(
//                               controller: controller,
//                               keyboardType: TextInputType.number,
//                               decoration: const InputDecoration(
//                                 hintText: "Amount in USD",
//                               ),
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 child: const Text("Cancel"),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   final amt = controller.text.trim();
//                                   if (amt.isNotEmpty &&
//                                       int.tryParse(amt) != null) {
//                                     Navigator.pop(context);
//                                     makePayment(amt);
//                                   }
//                                 },
//                                 child: const Text("Pay"),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: const Text("Add Money"),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= TRANSACTIONS =================
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.surface,
//                       borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 20),
//                         Text(
//                           "Your Transactions",
//                           style: AppWidget.headlineTextStyle(22),
//                         ),
//                         const SizedBox(height: 10),
//                         if (transactions.isEmpty)
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "No transactions yet.",
//                               style: theme.textTheme.bodyMedium,
//                             ),
//                           ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: transactions.length,
//                           itemBuilder: (context, index) {
//                             final tx = transactions[index];
//                             return ListTile(
//                               leading: Image.asset(
//                                 'images/cashback.png',
//                                 width: 32,
//                                 height: 32,
//                               ),
//                               title: Text(
//                                 tx['title'],
//                                 style: theme.textTheme.titleMedium,
//                               ),
//                               subtitle: Text(
//                                 tx['subtitle'],
//                                 style: theme.textTheme.bodySmall,
//                               ),
//                               trailing: Text(
//                                 "\$${tx['amount']}",
//                                 style: theme.textTheme.titleMedium,
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({
//             'amount': amount,
//             'email': FirebaseAuth.instance.currentUser!.email,
//             'uid': FirebaseAuth.instance.currentUser!.uid,
//           }),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank');
//         }
//         return;
//       }

//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Payment Failed: $e'),
//             backgroundColor: Theme.of(context).colorScheme.error,
//           ),
//         );
//       }
//     }
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> _addTransaction(String amount) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final newTx = {
//       'title': 'Wallet Top-Up',
//       'subtitle': 'Completed',
//       'amount': amount,
//       'date': DateTime.now().toIso8601String(),
//     };

//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, newTx);
//     });

//     final userRef =
//         FirebaseFirestore.instance.collection('users').doc(user.uid);
//     await userRef.set({
//       'walletBalance': walletBalance,
//       'transactions': transactions,
//     }, SetOptions(merge: true));

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Payment Successful! \$${amount} added to wallet.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }

//   /// ================= CREATE PAYMENT INTENT =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }


// import 'dart:convert';
// import 'dart:html' as html; // WEB ONLY
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 0;
//   List<Map<String, dynamic>> transactions = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadWallet();

//     // ✅ Handle Stripe success redirect (WEB)
//     if (kIsWeb) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('\$$amount added to your wallet!'),
//               backgroundColor: Colors.green,
//             ),
//           );
//         }
//       }
//     }
//   }

//   /// ================= LOAD WALLET =================
//   Future<void> _loadWallet() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     // Listen to real-time updates
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .snapshots()
//         .listen((doc) {
//       final data = doc.data();
//       if (data != null) {
//         setState(() {
//           walletBalance = data['walletBalance']?.toInt() ?? 0;
//           transactions =
//               List<Map<String, dynamic>>.from(data['transactions'] ?? []);
//           _isLoading = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//                   const SizedBox(height: 20),

//                   /// ================= WALLET CARD =================
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           theme.colorScheme.primary.withOpacity(0.9),
//                           theme.colorScheme.primary.withOpacity(0.7),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset("images/wallet.png", height: 100),
//                         const SizedBox(width: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Your Wallet",
//                               style: AppWidget.whiteTextStyle(22),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               "\$$walletBalance",
//                               style: AppWidget.whiteTextStyle(30),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= QUICK AMOUNT BUTTONS =================
//                   SizedBox(
//                     height: 50,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(10, (index) {
//                         final amount = (index + 1) * 100;
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 20),
//                           child: GestureDetector(
//                             onTap: () => makePayment(amount.toString()),
//                             child: Container(
//                               width: 130,
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.primary,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "\$$amount",
//                                   style: AppWidget.whiteTextStyle(18),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// ================= ADD MONEY BUTTON =================
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         final controller = TextEditingController();
//                         await showDialog(
//                           context: context,
//                           builder: (_) => AlertDialog(
//                             backgroundColor: theme.cardColor,
//                             title: const Text("Enter Amount"),
//                             content: TextField(
//                               controller: controller,
//                               keyboardType: TextInputType.number,
//                               decoration: const InputDecoration(
//                                 hintText: "Amount in USD",
//                               ),
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 child: const Text("Cancel"),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   final amt = controller.text.trim();
//                                   if (amt.isNotEmpty &&
//                                       int.tryParse(amt) != null) {
//                                     Navigator.pop(context);
//                                     makePayment(amt);
//                                   }
//                                 },
//                                 child: const Text("Pay"),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: const Text("Add Money"),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= TRANSACTIONS =================
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.surface,
//                       borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 20),
//                         Text(
//                           "Your Transactions",
//                           style: AppWidget.headlineTextStyle(22),
//                         ),
//                         const SizedBox(height: 10),
//                         if (transactions.isEmpty)
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "No transactions yet.",
//                               style: theme.textTheme.bodyMedium,
//                             ),
//                           ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: transactions.length,
//                           itemBuilder: (context, index) {
//                             final tx = transactions[index];
//                             return ListTile(
//                               leading: Image.asset(
//                                 'images/cashback.png',
//                                 width: 32,
//                                 height: 32,
//                               ),
//                               title: Text(
//                                 tx['title'],
//                                 style: theme.textTheme.titleMedium,
//                               ),
//                               subtitle: Text(
//                                 tx['subtitle'],
//                                 style: theme.textTheme.bodySmall,
//                               ),
//                               trailing: Text(
//                                 "\$${tx['amount']}",
//                                 style: theme.textTheme.titleMedium,
//                               ),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     try {
//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({
//             'amount': amount,
//             'email': user.email,
//             'uid': user.uid, // ✅ send UID to server
//           }),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank');
//         }
//         return;
//       }

//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Payment Failed: $e'),
//             backgroundColor: Theme.of(context).colorScheme.error,
//           ),
//         );
//       }
//     }
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> _addTransaction(String amount) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final newTx = {
//       'title': 'Wallet Top-Up',
//       'subtitle': 'Completed',
//       'amount': amount,
//       'timestamp': DateTime.now(),
//     };

//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, newTx);
//     });

//     final userRef =
//         FirebaseFirestore.instance.collection('users').doc(user.uid);
//     await userRef.set({
//       'walletBalance': walletBalance,
//       'transactions': transactions,
//     }, SetOptions(merge: true));

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Payment Successful! \$${amount} added to wallet.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }

//   /// ================= CREATE PAYMENT INTENT =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }


// import 'dart:convert';
// import 'dart:html' as html; // Web only
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 0;
//   List<Map<String, dynamic>> transactions = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadWallet();

//     // Handle Stripe redirect on web
//     if (kIsWeb) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Payment Successful! \$${amount} added to wallet.'),
//               backgroundColor: Colors.green,
//             ),
//           );
//         }
//       }
//     }
//   }

//   /// ================= LOAD WALLET =================
//   void _loadWallet() {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .snapshots()
//         .listen((doc) {
//       final data = doc.data();
//       if (data != null) {
//         setState(() {
//           walletBalance = (data['walletBalance'] ?? 0).toInt();
//           transactions =
//               List<Map<String, dynamic>>.from(data['transactions'] ?? []);
//           _isLoading = false;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//                   const SizedBox(height: 20),

//                   /// ================= WALLET CARD =================
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           theme.colorScheme.primary.withOpacity(0.9),
//                           theme.colorScheme.primary.withOpacity(0.7),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset("images/wallet.png", height: 100),
//                         const SizedBox(width: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Your Wallet",
//                                 style: AppWidget.whiteTextStyle(22)),
//                             const SizedBox(height: 5),
//                             Text("\$$walletBalance",
//                                 style: AppWidget.whiteTextStyle(30)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= QUICK AMOUNT BUTTONS =================
//                   SizedBox(
//                     height: 50,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(10, (index) {
//                         final amount = (index + 1) * 100;
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 20),
//                           child: GestureDetector(
//                             onTap: () => makePayment(amount.toString()),
//                             child: Container(
//                               width: 130,
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.primary,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text("\$$amount",
//                                     style: AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// ================= ADD MONEY BUTTON =================
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         final controller = TextEditingController();
//                         await showDialog(
//                           context: context,
//                           builder: (_) => AlertDialog(
//                             backgroundColor: theme.cardColor,
//                             title: const Text("Enter Amount"),
//                             content: TextField(
//                               controller: controller,
//                               keyboardType: TextInputType.number,
//                               decoration:
//                                   const InputDecoration(hintText: "Amount in USD"),
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 child: const Text("Cancel"),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   final amt = controller.text.trim();
//                                   if (amt.isNotEmpty &&
//                                       int.tryParse(amt) != null) {
//                                     Navigator.pop(context);
//                                     makePayment(amt);
//                                   }
//                                 },
//                                 child: const Text("Pay"),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: const Text("Add Money"),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= TRANSACTIONS =================
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.surface,
//                       borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 20),
//                         Text("Your Transactions",
//                             style: AppWidget.headlineTextStyle(22)),
//                         const SizedBox(height: 10),
//                         if (transactions.isEmpty)
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("No transactions yet.",
//                                 style: theme.textTheme.bodyMedium),
//                           ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: transactions.length,
//                           itemBuilder: (context, index) {
//                             final tx = transactions[index];
//                             return ListTile(
//                               leading: Image.asset(
//                                 'images/cashback.png',
//                                 width: 32,
//                                 height: 32,
//                               ),
//                               title: Text(tx['title'],
//                                   style: theme.textTheme.titleMedium),
//                               subtitle: Text(tx['subtitle'],
//                                   style: theme.textTheme.bodySmall),
//                               trailing: Text("\$${tx['amount']}",
//                                   style: theme.textTheme.titleMedium),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) return;

//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({
//             'amount': amount,
//             'email': user.email,
//             'uid': user.uid,
//           }),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank');
//         }
//         return;
//       }

//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Payment Failed: $e'),
//             backgroundColor: Theme.of(context).colorScheme.error,
//           ),
//         );
//       }
//     }
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> _addTransaction(String amount) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final newTx = {
//       'title': 'Wallet Top-Up',
//       'subtitle': 'Completed',
//       'amount': int.parse(amount),
//       'date': DateTime.now().toIso8601String(),
//     };

//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, newTx);
//     });

//     final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
//     await userRef.set({
//       'walletBalance': walletBalance,
//       'transactions': transactions,
//     }, SetOptions(merge: true));

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Payment Successful! \$${amount} added to wallet.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }

//   /// ================= CREATE PAYMENT INTENT =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }


// import 'dart:convert';
// import 'dart:html' as html; // Web only
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 0;
//   List<Map<String, dynamic>> transactions = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadWallet();

//     // Handle Stripe redirect on web
//     if (kIsWeb) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Payment Successful! \$${amount} added to wallet.'),
//               backgroundColor: Colors.green,
//             ),
//           );
//         }
//       }
//     }
//   }

//   /// ================= LOAD WALLET =================
//   void _loadWallet() {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .snapshots()
//         .listen((doc) {
//       final data = doc.data();
//       if (data != null) {
//         setState(() {
//           walletBalance = (data['walletBalance'] ?? 0).toInt();
//           transactions =
//               List<Map<String, dynamic>>.from(data['transactions'] ?? []);
//           _isLoading = false;
//         });
//       }
//     });
//   }

//   /// ================= DEDUCT WALLET =================
//   Future<void> deductWallet(int amount, {String note = 'Order Payment'}) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

//     await FirebaseFirestore.instance.runTransaction((t) async {
//       final snapshot = await t.get(userRef);
//       final currentBalance = snapshot.data()?['walletBalance'] ?? 0;
//       final currentTransactions =
//           List<Map<String, dynamic>>.from(snapshot.data()?['transactions'] ?? []);

//       if (currentBalance < amount) {
//         throw Exception("Insufficient wallet balance");
//       }

//       final newTx = {
//         'title': note,
//         'subtitle': 'Completed',
//         'amount': -amount,
//         'date': DateTime.now().toIso8601String(),
//       };

//       t.set(
//         userRef,
//         {
//           'walletBalance': currentBalance - amount,
//           'transactions': [newTx, ...currentTransactions],
//         },
//         SetOptions(merge: true),
//       );
//     });

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Payment Successful! \$${amount} deducted from wallet.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//                   const SizedBox(height: 20),

//                   /// ================= WALLET CARD =================
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           theme.colorScheme.primary.withOpacity(0.9),
//                           theme.colorScheme.primary.withOpacity(0.7),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset("images/wallet.png", height: 100),
//                         const SizedBox(width: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Your Wallet",
//                                 style: AppWidget.whiteTextStyle(22)),
//                             const SizedBox(height: 5),
//                             Text("\$$walletBalance",
//                                 style: AppWidget.whiteTextStyle(30)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= QUICK AMOUNT BUTTONS =================
//                   SizedBox(
//                     height: 50,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(10, (index) {
//                         final amount = (index + 1) * 100;
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 20),
//                           child: GestureDetector(
//                             onTap: () => makePayment(amount.toString()),
//                             child: Container(
//                               width: 130,
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.primary,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text("\$$amount",
//                                     style: AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// ================= ADD MONEY BUTTON =================
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         final controller = TextEditingController();
//                         await showDialog(
//                           context: context,
//                           builder: (_) => AlertDialog(
//                             backgroundColor: theme.cardColor,
//                             title: const Text("Enter Amount"),
//                             content: TextField(
//                               controller: controller,
//                               keyboardType: TextInputType.number,
//                               decoration:
//                                   const InputDecoration(hintText: "Amount in USD"),
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 child: const Text("Cancel"),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   final amt = controller.text.trim();
//                                   if (amt.isNotEmpty &&
//                                       int.tryParse(amt) != null) {
//                                     Navigator.pop(context);
//                                     makePayment(amt);
//                                   }
//                                 },
//                                 child: const Text("Pay"),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: const Text("Add Money"),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= TRANSACTIONS =================
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.surface,
//                       borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 20),
//                         Text("Your Transactions",
//                             style: AppWidget.headlineTextStyle(22)),
//                         const SizedBox(height: 10),
//                         if (transactions.isEmpty)
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("No transactions yet.",
//                                 style: theme.textTheme.bodyMedium),
//                           ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: transactions.length,
//                           itemBuilder: (context, index) {
//                             final tx = transactions[index];
//                             return ListTile(
//                               leading: Image.asset(
//                                 'images/cashback.png',
//                                 width: 32,
//                                 height: 32,
//                               ),
//                               title: Text(tx['title'],
//                                   style: theme.textTheme.titleMedium),
//                               subtitle: Text(tx['subtitle'],
//                                   style: theme.textTheme.bodySmall),
//                               trailing: Text("\$${tx['amount']}",
//                                   style: theme.textTheme.titleMedium),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) return;

//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({
//             'amount': amount,
//             'email': user.email,
//             'uid': user.uid,
//           }),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank');
//         }
//         return;
//       }

//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Payment Failed: $e'),
//             backgroundColor: Theme.of(context).colorScheme.error,
//           ),
//         );
//       }
//     }
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> _addTransaction(String amount) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final newTx = {
//       'title': 'Wallet Top-Up',
//       'subtitle': 'Completed',
//       'amount': int.parse(amount),
//       'date': DateTime.now().toIso8601String(),
//     };

//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, newTx);
//     });

//     final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
//     await userRef.set({
//       'walletBalance': walletBalance,
//       'transactions': transactions,
//     }, SetOptions(merge: true));

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Payment Successful! \$${amount} added to wallet.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }

//   /// ================= CREATE PAYMENT INTENT =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }


// import 'dart:convert';
// import 'dart:html' as html; // Web only
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Wallet extends StatefulWidget {
//   const Wallet({super.key});

//   @override
//   State<Wallet> createState() => _WalletState();
// }

// class _WalletState extends State<Wallet> {
//   Map<String, dynamic>? paymentIntent;
//   int walletBalance = 0;
//   List<Map<String, dynamic>> transactions = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadWallet();

//     if (kIsWeb) {
//       final uri = Uri.base;
//       if (uri.queryParameters['payment'] == 'success') {
//         final amount = uri.queryParameters['amount'];
//         if (amount != null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Payment Successful! \$${amount} added to wallet.'),
//               backgroundColor: Colors.green,
//             ),
//           );
//         }
//       }
//     }
//   }

//   /// ================= LOAD WALLET =================
//   void _loadWallet() {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .snapshots()
//         .listen((doc) {
//       final data = doc.data();
//       if (data != null) {
//         setState(() {
//           walletBalance = (data['walletBalance'] ?? 0).toInt();
//           transactions =
//               List<Map<String, dynamic>>.from(data['transactions'] ?? []);
//           _isLoading = false;
//         });
//       }
//     });
//   }

//   /// ================= DEDUCT WALLET =================
//   Future<void> deductWallet(int amount) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final newTransaction = {
//       'title': 'Payment Deduction',
//       'subtitle': 'Order Placed',
//       'amount': -amount,
//       'date': DateTime.now().toIso8601String(),
//     };

//     setState(() {
//       walletBalance -= amount;
//       transactions.insert(0, newTransaction);
//     });

//     final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
//     await userRef.set({
//       'walletBalance': walletBalance,
//       'transactions': transactions,
//     }, SetOptions(merge: true));

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('\$$amount deducted for order.'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
//                   const SizedBox(height: 20),

//                   /// ================= WALLET CARD =================
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           theme.colorScheme.primary.withOpacity(0.9),
//                           theme.colorScheme.primary.withOpacity(0.7),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Row(
//                       children: [
//                         Image.asset("images/wallet.png", height: 100),
//                         const SizedBox(width: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Your Wallet",
//                                 style: AppWidget.whiteTextStyle(22)),
//                             const SizedBox(height: 5),
//                             TweenAnimationBuilder<int>(
//                               tween: IntTween(begin: 0, end: walletBalance),
//                               duration: const Duration(milliseconds: 500),
//                               builder: (context, value, child) => Text(
//                                 "\$$value",
//                                 style: AppWidget.whiteTextStyle(30),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= QUICK AMOUNT BUTTONS =================
//                   SizedBox(
//                     height: 50,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(10, (index) {
//                         final amount = (index + 1) * 100;
//                         return Padding(
//                           padding: const EdgeInsets.only(right: 20),
//                           child: GestureDetector(
//                             onTap: () => makePayment(amount.toString()),
//                             child: Container(
//                               width: 130,
//                               decoration: BoxDecoration(
//                                 color: theme.colorScheme.primary,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Text("\$$amount",
//                                     style: AppWidget.whiteTextStyle(18)),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// ================= ADD MONEY BUTTON =================
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         final controller = TextEditingController();
//                         await showDialog(
//                           context: context,
//                           builder: (_) => AlertDialog(
//                             backgroundColor: theme.cardColor,
//                             title: const Text("Enter Amount"),
//                             content: TextField(
//                               controller: controller,
//                               keyboardType: TextInputType.number,
//                               decoration: const InputDecoration(
//                                   hintText: "Amount in USD"),
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 child: const Text("Cancel"),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   final amt = controller.text.trim();
//                                   if (amt.isNotEmpty &&
//                                       int.tryParse(amt) != null) {
//                                     Navigator.pop(context);
//                                     makePayment(amt);
//                                   }
//                                 },
//                                 child: const Text("Pay"),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: const Text("Add Money"),
//                     ),
//                   ),

//                   const SizedBox(height: 30),

//                   /// ================= TRANSACTIONS =================
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.surface,
//                       borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(30)),
//                     ),
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 20),
//                         Text("Your Transactions",
//                             style: AppWidget.headlineTextStyle(22)),
//                         const SizedBox(height: 10),
//                         if (transactions.isEmpty)
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text("No transactions yet.",
//                                 style: theme.textTheme.bodyMedium),
//                           ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: transactions.length,
//                           itemBuilder: (context, index) {
//                             final tx = transactions[index];
//                             return ListTile(
//                               leading: Image.asset(
//                                 'images/cashback.png',
//                                 width: 32,
//                                 height: 32,
//                               ),
//                               title: Text(tx['title'],
//                                   style: theme.textTheme.titleMedium),
//                               subtitle: Text(tx['subtitle'],
//                                   style: theme.textTheme.bodySmall),
//                               trailing: Text("\$${tx['amount']}",
//                                   style: theme.textTheme.titleMedium),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   /// ================= PAYMENT =================
//   Future<void> makePayment(String amount) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) return;

//       if (kIsWeb) {
//         final response = await http.post(
//           Uri.parse('http://localhost:4242/create-checkout-session'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({
//             'amount': amount,
//             'email': user.email,
//             'uid': user.uid,
//           }),
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           html.window.open(data['url'], '_blank');
//         }
//         return;
//       }

//       paymentIntent = await createPaymentIntent(amount, 'USD');
//       if (paymentIntent == null) return;

//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: paymentIntent!['client_secret'],
//           merchantDisplayName: 'Wallet',
//         ),
//       );

//       await Stripe.instance.presentPaymentSheet();
//       _addTransaction(amount);
//     } catch (e) {
//       debugPrint('Payment error: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Payment Failed: $e'),
//             backgroundColor: Theme.of(context).colorScheme.error,
//           ),
//         );
//       }
//     }
//   }

//   /// ================= ADD TRANSACTION =================
//   Future<void> _addTransaction(String amount) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final newTx = {
//       'title': 'Wallet Top-Up',
//       'subtitle': 'Completed',
//       'amount': int.parse(amount),
//       'date': DateTime.now().toIso8601String(),
//     };

//     setState(() {
//       walletBalance += int.parse(amount);
//       transactions.insert(0, newTx);
//     });

//     final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
//     await userRef.set({
//       'walletBalance': walletBalance,
//       'transactions': transactions,
//     }, SetOptions(merge: true));

//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Payment Successful! \$${amount} added to wallet.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     }
//   }

//   /// ================= CREATE PAYMENT INTENT =================
//   Future<Map<String, dynamic>?> createPaymentIntent(
//       String amount, String currency) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:4242/create-payment-intent'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'amount': amount, 'currency': currency}),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body);
//     }
//     return null;
//   }
// }

//////////WORKING BILKUL SAHI UPPER WALA

import 'dart:convert';
import 'dart:html' as html; // Web only
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  Map<String, dynamic>? paymentIntent;
  int walletBalance = 0;
  List<Map<String, dynamic>> transactions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWallet();

    if (kIsWeb) {
      final uri = Uri.base;
      if (uri.queryParameters['payment'] == 'success') {
        final amount = uri.queryParameters['amount'];
        if (amount != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Payment Successful! \$${amount} added to wallet.'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    }
  }

  /// ================= LOAD WALLET =================
  void _loadWallet() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .snapshots()
        .listen((doc) {
      final data = doc.data();
      if (data != null) {
        setState(() {
          walletBalance = (data['walletBalance'] ?? 0).toInt();
          transactions =
              List<Map<String, dynamic>>.from(data['transactions'] ?? []);
          _isLoading = false;
        });
      }
    });
  }

  /// ================= DEDUCT WALLET =================
  Future<void> deductWallet(int amount, {String? title, String? subtitle}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final newTransaction = {
      'title': title ?? 'Payment Deduction',
      'subtitle': subtitle ?? 'Order Placed',
      'amount': -amount,
      'date': DateTime.now().toIso8601String(),
      'image': 'images/credit-card-payment.png', // Debit icon
    };

    setState(() {
      walletBalance -= amount;
      transactions.insert(0, newTransaction);
    });

    final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
    await userRef.set({
      'walletBalance': walletBalance,
      'transactions': transactions,
    }, SetOptions(merge: true));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('\$$amount deducted for order.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  /// ================= ADD WALLET / TOP-UP =================
  Future<void> _addTransaction(String amount) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final newTx = {
      'title': 'Wallet Top-Up',
      'subtitle': 'Completed',
      'amount': int.parse(amount),
      'date': DateTime.now().toIso8601String(),
      'image': 'images/wallet-topup.png', // Credit icon
    };

    setState(() {
      walletBalance += int.parse(amount);
      transactions.insert(0, newTx);
    });

    final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
    await userRef.set({
      'walletBalance': walletBalance,
      'transactions': transactions,
    }, SetOptions(merge: true));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment Successful! \$${amount} added to wallet.'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  /// ================= PAYMENT =================
  Future<void> makePayment(String amount) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      if (kIsWeb) {
        final response = await http.post(
          Uri.parse('http://localhost:4242/create-checkout-session'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'amount': amount,
            'email': user.email,
            'uid': user.uid,
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          html.window.open(data['url'], '_blank');
        }
        return;
      }

      paymentIntent = await createPaymentIntent(amount, 'USD');
      if (paymentIntent == null) return;

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          merchantDisplayName: 'Wallet',
        ),
      );

      await Stripe.instance.presentPaymentSheet();
      await _addTransaction(amount);
    } catch (e) {
      debugPrint('Payment error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Payment Failed: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  /// ================= CREATE PAYMENT INTENT =================
  Future<Map<String, dynamic>?> createPaymentIntent(
      String amount, String currency) async {
    final response = await http.post(
      Uri.parse('http://localhost:4242/create-payment-intent'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'amount': amount, 'currency': currency}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wallet Page", style: AppWidget.headlineTextStyle(26)),
                  const SizedBox(height: 20),

                  /// WALLET CARD
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary.withOpacity(0.9),
                          theme.colorScheme.primary.withOpacity(0.7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Image.asset("images/wallet.png", height: 100),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your Wallet",
                                style: AppWidget.whiteTextStyle(22)),
                            const SizedBox(height: 5),
                            TweenAnimationBuilder<int>(
                              tween: IntTween(begin: 0, end: walletBalance),
                              duration: const Duration(milliseconds: 500),
                              builder: (context, value, child) => Text(
                                "\$$value",
                                style: AppWidget.whiteTextStyle(30),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// QUICK AMOUNT BUTTONS
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(10, (index) {
                        final amount = (index + 1) * 100;
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () => makePayment(amount.toString()),
                            child: Container(
                              width: 130,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("\$$amount",
                                    style: AppWidget.whiteTextStyle(18)),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// ADD MONEY BUTTON
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        final controller = TextEditingController();
                        await showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: theme.cardColor,
                            title: const Text("Enter Amount"),
                            content: TextField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: "Amount in USD"),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final amt = controller.text.trim();
                                  if (amt.isNotEmpty &&
                                      int.tryParse(amt) != null) {
                                    Navigator.pop(context);
                                    makePayment(amt);
                                  }
                                },
                                child: const Text("Pay"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text("Add Money"),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// TRANSACTIONS
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text("Your Transactions",
                            style: AppWidget.headlineTextStyle(22)),
                        const SizedBox(height: 10),
                        if (transactions.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("No transactions yet.",
                                style: theme.textTheme.bodyMedium),
                          ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: transactions.length,
                          itemBuilder: (context, index) {
                            final tx = transactions[index];
                            return ListTile(
                              leading: Image.asset(
                                tx['image'] ?? 'images/cashback.png',
                                width: 32,
                                height: 32,
                              ),
                              title: Text(tx['title'],
                                  style: theme.textTheme.titleMedium),
                              subtitle: Text(tx['subtitle'],
                                  style: theme.textTheme.bodySmall),
                              trailing: Text(
                                tx['amount'] > 0
                                    ? "+\$${tx['amount']}"
                                    : "-\$${tx['amount'].abs()}",
                                style: theme.textTheme.titleMedium,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
