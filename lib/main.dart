import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/auth_gate.dart';


import 'package:flutter_stripe/flutter_stripe.dart';
import 'config/stripe_keys.dart';


import 'package:online_pharmacy/admin/add_product.dart';
import 'package:online_pharmacy/admin/admin_login.dart';


import 'package:online_pharmacy/pages/bottom_nav.dart';
import 'package:online_pharmacy/pages/home.dart';
import 'package:online_pharmacy/pages/signup.dart';
import 'package:online_pharmacy/pages/wallet.dart';
import 'package:online_pharmacy/pages/detail_page.dart';
import 'package:online_pharmacy/pages/login.dart';
import 'package:online_pharmacy/pages/splash_screen.dart';
import 'package:online_pharmacy/pages/app_start_screen.dart';
import 'package:online_pharmacy/pages/profile.dart';


import 'package:flutter/foundation.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';

// 🌟 ValueNotifier to control theme globally
ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Stripe publishable key //// Stripe uses client-side publishable keys
  Stripe.publishableKey =
      'pk_test_51SiKQ4CQOIWnU6e5RDZSh2x3f0kkk7Ol3r08GBNQIfEuU6GEER3JRLOwZoqKDBUVEjpCJxedvoDyXE7gy80lXoJ100W73aOnla';

//////Initializes Firebase based on platform (Android / iOS / Web)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Online Pharmacy',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: const Color(0xFFF0EEFC),
            cardColor: const Color(0xFFE1DBF8),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: const Color(0xFF1E1E2C),
            cardColor: const Color(0xFF2A2A3B),
          ),
          themeMode: currentMode,
          home: Login(),
        );
      },
    );
  }
}
