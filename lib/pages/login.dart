// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/pages/home.dart';
// import 'package:online_pharmacy/pages/signup.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController emailcontroller = new TextEditingController();
//    TextEditingController passwordcontroller = new TextEditingController();

// String? email, password;


// userLogin() async{
//   try{
//     await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
//   } on FirebaseAuthException catch(e){
//     if(e.code=='invalid-credential'){
//       ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.red,
//         content: Text('You have Entered an invalid Email or Password', style: AppWidget.whiteTextStyle(20.0),))
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
//                       "Hello",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 60,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       "Welcome Back!",
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
//                         "Login Account",
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
//                         controller: emailcontroller,
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
//                         controller: passwordcontroller,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Your Password",
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 10),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: const [
//                         Text(
//                           "Forget Password?",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontFamily: 'FredokaLight',
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 30),

//                     /// LOGIN BUTTON
//                     GestureDetector(
//                       onTap: () {
//                         if(emailcontroller.text!="" && passwordcontroller.text!=""){
//                           setState(() {
//                            email= emailcontroller.text;
//                            password=passwordcontroller.text; 
//                           });
//                         }
//                       userLogin();

//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: const Color(0xfff7bc3c),
//                           borderRadius: BorderRadius.circular(60),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "Login Account",
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
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
//                       },
//                       child: const Center(
//                         child: Text(
//                           "Create New Account",
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
import 'package:online_pharmacy/pages/bottom_nav.dart';
import 'package:online_pharmacy/pages/signup.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;

  Future<void> userLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Please enter email and password"),
        ),
      );
      return;
    }

    setState(() => loading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigate to BottomNav to manage wallet state centrally
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNav()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login Successful!"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message = "Login failed";
      if (e.code == 'user-not-found') {
        message = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message, style: AppWidget.whiteTextStyle(20)),
        ),
      );
    } finally {
      setState(() => loading = false);
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
                      "Hello",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                        fontFamily: 'FredokaBold',
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'FredokaLight',
                      ),
                    ),
                  ],
                ),
              ),

              /// LOGIN CARD
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(
                  top: screenHeight * 0.30,
                  left: 20,
                  right: 20,
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
                    const Center(
                      child: Text(
                        "Login Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontFamily: 'FredokaBold',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// EMAIL
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

                    /// PASSWORD
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

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'FredokaLight',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    /// LOGIN BUTTON
                    GestureDetector(
                      onTap: userLogin,
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
                                  color: Colors.black)
                              : const Text(
                                  "Login Account",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'FredokaBold',
                                  ),
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// SIGNUP
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignUp()),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "Create New Account",
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
