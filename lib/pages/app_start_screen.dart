////UI building blocks
import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart';

import 'package:online_pharmacy/pages/splash_screen.dart';
import 'package:online_pharmacy/pages/auth_gate.dart';

////Animated loading indicator
import 'package:flutter_spinkit/flutter_spinkit.dart'; // 🌟 new
import 'package:google_fonts/google_fonts.dart';

////Controls timed navigation
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class AppStartScreen extends StatefulWidget {
  const AppStartScreen({super.key});

  @override
  State<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends State<AppStartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  // 🎧 Audio Player
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    // 🎬 Animation setup
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _scaleAnim =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _controller.forward();

    // 🎧 Play intro sound
    _audioPlayer = AudioPlayer();
    _playIntroSound();

    // ⏱ Navigate after 6 seconds
    Timer(const Duration(seconds: 6), () {
      final user = FirebaseAuth.instance.currentUser;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              user == null ? const SplashScreen() : const AuthGate(),
        ),
      );
    });
  }

  Future<void> _playIntroSound() async {
    await _audioPlayer.setVolume(0.4); // soft & premium
    await _audioPlayer.play(
      AssetSource('sounds/intro.mp3'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose(); // 🚿 prevents memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFe0c3fc), // light purple
              Color(0xFF8ec5fc), // light blue
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnim,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🏥 LOGO
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.4),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "images/pharmacy.jpg",
                    height: 120,
                  ),
                ),

                const SizedBox(height: 30),

                // 🧾 APP NAME
                Text(
                  "Online Pharmacy",
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Your health, delivered with care",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.deepPurple.shade300,
                  ),
                ),

                const SizedBox(height: 30),

                // 🌟 Dotted Loader
                const SpinKitThreeBounce(
                  color: Colors.deepPurple,
                  size: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
