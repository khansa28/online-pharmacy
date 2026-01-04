import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_pharmacy/admin/add_product.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';


class AdminLogin extends StatefulWidget{
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState(); 
  
}

class _AdminLoginState extends State<AdminLogin> {

TextEditingController usernamecontroller = new TextEditingController();
TextEditingController passwordcontroller = new TextEditingController();

  @override 
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              /// TOP YELLOW SECTION
              Container(
                width: screenWidth,
                height: screenHeight * 0.45, // ✅ increased height
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
                      "Admin Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                        fontFamily: 'FredokaBold',
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Manage Complete App",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
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
                  top: screenHeight * 0.30, // ✅ fixed overlap
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
                        "Unique ID",
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

                    /// EMAIL
                    const Text(
                      "Username",
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
                      controller: usernamecontroller,  
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Username",
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
                      controller: passwordcontroller,  
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Your Password",
                        ),
                      ),
                    ),

                    

                    const SizedBox(height: 50),

                    /// LOGIN BUTTON
                    GestureDetector(
                      onTap: () {
                        if(usernamecontroller.text!=""&& passwordcontroller.text!=""){
                          loginAdmin();
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

                        child: const Center(
                          child: Text(
                            "Login Account",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'FredokaBold',
                            ),
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
  
    loginAdmin() async {
  final snapshot =
      await FirebaseFirestore.instance.collection("Admin").get();

  bool userFound = false;

  for (var doc in snapshot.docs) {
    if (doc['id'] == usernamecontroller.text.trim()) {
      userFound = true;

      if (doc['password'] == passwordcontroller.text.trim()) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddProduct()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Incorrect password',
              style: AppWidget.whiteTextStyle(20),
            ),
          ),
        );
      }
      return;
    }
  }

  if (!userFound) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Username not found',
          style: AppWidget.whiteTextStyle(20),
        ),
      ),
    );
  }
}


}
