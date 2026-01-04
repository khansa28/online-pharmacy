// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/pages/home.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:online_pharmacy/pages/login.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/services/shared_pref.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:random_string/random_string.dart';

// class SignUp extends StatefulWidget{
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() =>_SignUpState();
// }

// class _SignUpState extends State <SignUp>{

// TextEditingController nameController = new TextEditingController();
// TextEditingController emailController = new TextEditingController();
// TextEditingController passwordController = new TextEditingController(); 
// bool loading=false;


// String? name, email, password; 

// Future<void> registration() async {
//   setState(() {
//     loading = true;
//   });
//   try{
//     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email!,
//       password: password!
//     );
//     String id = randomAlphaNumeric(10);
//     Map<String, dynamic> userInfoMap = {
//       "Name" : nameController.text,
//       "email" : emailController.text,
//       "Id" : id,
//     };

//     await SharedpreferenceHelper().saveUserId(id);
//     await SharedpreferenceHelper().saveUserName(nameController.text);
//     await SharedpreferenceHelper().saveUserEmail(emailController.text);

// await DatabaseMethods().addUserInfo(userInfoMap, id);
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home() ));
// ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.green,
//         content: Text('Registered Successfully!', style: AppWidget.whiteTextStyle(20.0),))
//     );


//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'weak-password') {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.red,
//         content: Text('The password provided is too weak.', style: AppWidget.whiteTextStyle(20.0),))
//     );
//     } else if (e.code == 'email-already-in-use') {
//       ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.red,
//         content: Text('The account already exists for that email.', style: AppWidget.whiteTextStyle(20.0),))
//     );
//     }
//   }
// }



//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Stack(
//             children: [
//               /// TOP YELLOW SECTION
//               Container(
//                 width: screenWidth,
//                 height: screenHeight * 0.45, // ✅ increased height
//                 decoration: const BoxDecoration(
//                   color: Color(0xfff7bc3c),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(60),
//                     bottomRight: Radius.circular(60),
//                   ),
//                 ),
//                 child: Column(
//                   children: const [
//                     SizedBox(height: 35),
//                     Text(
//                       "Join Us",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 60,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       "Create Free Account",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 36,
//                         fontFamily: 'FredokaLight',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               /// LOGIN CARD
//               Container(
//                 width: screenWidth,
//                 margin: EdgeInsets.only(
//                   top: screenHeight * 0.30, // ✅ fixed overlap
//                   left: 20,
//                   right: 20,
//                   bottom: 40,
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 240, 247, 234),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         "Personal Info",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 35,
//                           fontFamily: 'FredokaBold',
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 10),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Text(
//                         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                         textAlign: TextAlign.center,
//                       ),
//                     ),

//                   const SizedBox(height: 30),
//                     /// YOUR NAME
//                     const Text(
//                       "Full Name",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.only(left: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                         border: Border.all(
//                           color: Color.fromARGB(85, 0, 0, 0),
//                           width: 1.5,
//                         ),
//                       ),
//                       child: TextField(
//                         controller: nameController,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Your Name",
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 30),

//                     /// EMAIL
//                     const Text(
//                       "Email Address",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.only(left: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                         border: Border.all(
//                           color: Color.fromARGB(85, 0, 0, 0),
//                           width: 1.5,
//                         ),
//                       ),
//                       child: TextField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Your Email Address",
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 25),

//                     /// PASSWORD
//                     const Text(
//                       "Password",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.only(left: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                         border: Border.all(
//                           color: Color.fromARGB(85, 0, 0, 0),
//                           width: 1.5,
//                         ),
//                       ),
//                       child: TextField(
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Your Password",
//                         ),
//                       ),
//                     ),

                    

//                     SizedBox(height: 30),

//                     /// LOGIN BUTTON
//                     GestureDetector(
//                       onTap: () {
//         if(nameController.text!="" && emailController.text!="" && passwordController.text!=""){
//           setState(() {
//             name = nameController.text;
//             email = emailController.text;
//             password = passwordController.text; 
//           });
//           registration();
//         }
//       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: const Color(0xfff7bc3c),
//                           borderRadius: BorderRadius.circular(60),
//                         ),
//                         child: Center(
//                           child: loading? Center(child: CircularProgressIndicator(color: Colors.black,)):
//                           Text(
//                             "Create Account",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'FredokaBold',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 30),

//                     /// SIGNUP
//                     GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
//                     },  
//                       child: const Center(
//                         child: Text(
//                           "Back to Login Page",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: 'FredokaLight',
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/pages/home.dart';
// import 'package:online_pharmacy/pages/login.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/services/shared_pref.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:random_string/random_string.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   bool loading = false;

//   String? name, email, password;

//   Future<void> registration() async {
//     setState(() {
//       loading = true;
//     });

//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email!,
//         password: password!,
//       );

//       String id = randomAlphaNumeric(10);
//       Map<String, dynamic> userInfoMap = {
//         "Name": nameController.text,
//         "email": emailController.text,
//         "Id": id,
//       };

//       await SharedpreferenceHelper().saveUserId(id);
//       await SharedpreferenceHelper().saveUserName(nameController.text);
//       await SharedpreferenceHelper().saveUserEmail(emailController.text);

//       await DatabaseMethods().addUserInfo(userInfoMap, id);

//       /// ✅ Navigate to Home with wallet parameters
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Home(
//             walletBalance: 200, // default starting balance
//             updateWalletBalance: (newBalance) {
//               debugPrint("Wallet updated: $newBalance");
//             },
//           ),
//         ),
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.green,
//           content: Text(
//             'Registered Successfully!',
//             style: AppWidget.whiteTextStyle(20.0),
//           ),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.red,
//             content: Text(
//               'The password provided is too weak.',
//               style: AppWidget.whiteTextStyle(20.0),
//             ),
//           ),
//         );
//       } else if (e.code == 'email-already-in-use') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.red,
//             content: Text(
//               'The account already exists for that email.',
//               style: AppWidget.whiteTextStyle(20.0),
//             ),
//           ),
//         );
//       }
//     } finally {
//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Stack(
//             children: [
//               /// TOP YELLOW SECTION
//               Container(
//                 width: screenWidth,
//                 height: screenHeight * 0.45,
//                 decoration: const BoxDecoration(
//                   color: Color(0xfff7bc3c),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(60),
//                     bottomRight: Radius.circular(60),
//                   ),
//                 ),
//                 child: Column(
//                   children: const [
//                     SizedBox(height: 35),
//                     Text(
//                       "Join Us",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 60,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       "Create Free Account",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 36,
//                         fontFamily: 'FredokaLight',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               /// SIGNUP CARD
//               Container(
//                 width: screenWidth,
//                 margin: EdgeInsets.only(
//                   top: screenHeight * 0.30,
//                   left: 20,
//                   right: 20,
//                   bottom: 40,
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 240, 247, 234),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         "Personal Info",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 35,
//                           fontFamily: 'FredokaBold',
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Text(
//                         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     const SizedBox(height: 30),

//                     /// Full Name
//                     const Text(
//                       "Full Name",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.only(left: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                         border: Border.all(
//                           color: Color.fromARGB(85, 0, 0, 0),
//                           width: 1.5,
//                         ),
//                       ),
//                       child: TextField(
//                         controller: nameController,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Your Name",
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 30),

//                     /// Email
//                     const Text(
//                       "Email Address",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.only(left: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                         border: Border.all(
//                           color: Color.fromARGB(85, 0, 0, 0),
//                           width: 1.5,
//                         ),
//                       ),
//                       child: TextField(
//                         controller: emailController,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Your Email Address",
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 25),

//                     /// Password
//                     const Text(
//                       "Password",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.only(left: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                         border: Border.all(
//                           color: Color.fromARGB(85, 0, 0, 0),
//                           width: 1.5,
//                         ),
//                       ),
//                       child: TextField(
//                         controller: passwordController,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Your Password",
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 30),

//                     /// Signup Button
//                     GestureDetector(
//                       onTap: () {
//                         if (nameController.text != "" &&
//                             emailController.text != "" &&
//                             passwordController.text != "") {
//                           setState(() {
//                             name = nameController.text;
//                             email = emailController.text;
//                             password = passwordController.text;
//                           });
//                           registration();
//                         }
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: const Color(0xfff7bc3c),
//                           borderRadius: BorderRadius.circular(60),
//                         ),
//                         child: Center(
//                           child: loading
//                               ? const Center(
//                                   child: CircularProgressIndicator(
//                                     color: Colors.black,
//                                   ),
//                                 )
//                               : const Text(
//                                   "Create Account",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: 'FredokaBold',
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 30),

//                     /// Back to Login
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => const Login()),
//                         );
//                       },
//                       child: const Center(
//                         child: Text(
//                           "Back to Login Page",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: 'FredokaLight',
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_pharmacy/pages/login.dart';
import 'package:online_pharmacy/services/database.dart';
import 'package:online_pharmacy/services/shared_pref.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  String? name, email, password;

  Future<void> registration() async {
    setState(() {
      loading = true;
    });

    try {
      /// ✅ CREATE AUTH USER
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      final uid = userCredential.user!.uid;

      /// ✅ USER DATA FOR FIRESTORE
      Map<String, dynamic> userInfoMap = {
        "Name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "uid": uid,
        "walletBalance": 0, // 👈 default wallet balance
        "createdAt": DateTime.now(),
      };

      /// ✅ SAVE LOCALLY
      await SharedpreferenceHelper().saveUserId(uid);
      await SharedpreferenceHelper()
          .saveUserName(nameController.text.trim());
      await SharedpreferenceHelper()
          .saveUserEmail(emailController.text.trim());

      /// ✅ SAVE TO FIRESTORE
      await DatabaseMethods().addUserInfo(userInfoMap, uid);

      /// ✅ DO NOT NAVIGATE MANUALLY
      /// AuthGate/main.dart will handle navigation

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Registered Successfully!',
            style: AppWidget.whiteTextStyle(20.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            e.message ?? 'Signup failed',
            style: AppWidget.whiteTextStyle(18),
          ),
        ),
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              /// TOP YELLOW SECTION
              Container(
                width: screenWidth,
                height: screenHeight * 0.45,
                decoration: const BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xFFe0c3fc),
      Color(0xFF8ec5fc),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(60),
    bottomRight: Radius.circular(60),
  ),
),

                child: Column(
                  children: const [
                    SizedBox(height: 35),
                    Text(
                      "Join Us",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                        fontFamily: 'FredokaBold',
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Create Free Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'FredokaLight',
                      ),
                    ),
                  ],
                ),
              ),

              /// SIGNUP CARD
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(
                  top: screenHeight * 0.30,
                  left: 20,
                  right: 20,
                  bottom: 40,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 247, 234),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Personal Info",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontFamily: 'FredokaBold',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// Full Name
                    const Text(
                      "Full Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'FredokaBold',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: Color.fromARGB(85, 0, 0, 0),
                          width: 1.5,
                        ),
                      ),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Name",
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Email
                    const Text(
                      "Email Address",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'FredokaBold',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: Color.fromARGB(85, 0, 0, 0),
                          width: 1.5,
                        ),
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Email Address",
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// Password
                    const Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'FredokaBold',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: Color.fromARGB(85, 0, 0, 0),
                          width: 1.5,
                        ),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Password",
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Signup Button
                    GestureDetector(
                      onTap: () {
                        if (nameController.text.isNotEmpty &&
                            emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          setState(() {
                            name = nameController.text;
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          registration();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
  gradient: const LinearGradient(
    colors: [
      Color(0xFFe0c3fc),
      Color(0xFF8ec5fc),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  borderRadius: BorderRadius.circular(60),
),
                        child: Center(
                          child: loading
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                )
                              : const Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'FredokaBold',
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Back to Login
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "Back to Login Page",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'FredokaLight',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
