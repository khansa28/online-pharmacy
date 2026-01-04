import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_pharmacy/pages/auth_gate.dart';
// import 'package:lottie/lottie.dart'; // enable later if you want

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "title": "Expert Extra Care",
      "description": "Get personalized expert care and guidance.",
      "image": "images/doctor.png",
    },
    {
      "title": "Pharmacy with Aim",
      "description": "All your medicines in one place, delivered quickly.",
      "image": "images/injection.png",
    },
    {
      "title": "Serving You Truth",
      "description": "Honest advice and guidance for your health.",
      "image": "images/bottle.png",
    },
  ];

  List<Widget> _sparkles = [];

  void _generateSparkles() {
    final random = Random();
    setState(() {
      _sparkles = List.generate(12, (index) {
        final dx = random.nextDouble() * 200 - 100;
        final dy = random.nextDouble() * 200 - 100;
        return Positioned(
          left: 100 + dx,
          top: 50 + dy,
          child: const Icon(
            Icons.star,
            color: Colors.yellowAccent,
            size: 12,
          ),
        );
      });
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() => _sparkles.clear());
    });
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AuthGate()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌈 Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFe0c3fc), Color(0xFF8ec5fc)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // ⏭ Skip Button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: _finishOnboarding,
              child: Text(
                "Skip",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),

          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => currentPage = index),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // IMAGE / LOTTIE
                    Image.asset(_pages[index]['image']!, height: 240),
                    // Lottie.asset("assets/lottie/pharmacy.json", height: 240),

                    const SizedBox(height: 40),

                    Text(
                      _pages[index]['title']!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      _pages[index]['description']!,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: Colors.deepPurple.shade300,
                      ),
                    ),

                    const SizedBox(height: 50),

                    GestureDetector(
                      onTap: () {
                        _generateSparkles();
                        if (index < _pages.length - 1) {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          _finishOnboarding();
                        }
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.deepPurple.withOpacity(0.45),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Text(
                              index == _pages.length - 1
                                  ? "Get Started"
                                  : "Next",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ..._sparkles,
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
