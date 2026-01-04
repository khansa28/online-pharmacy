import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:online_pharmacy/pages/home.dart';
import 'package:online_pharmacy/pages/order.dart';
import 'package:online_pharmacy/pages/profile.dart';
import 'package:online_pharmacy/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
  int walletBalance = 200;

  void updateWalletBalance(int newBalance) {
    setState(() {
      walletBalance = newBalance;
    });
  }

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      Home(
        walletBalance: walletBalance,
        updateWalletBalance: updateWalletBalance,
      ),
      Order(
        walletBalance: walletBalance,
        updateWalletBalance: updateWalletBalance,
      ),
      const Wallet(), // Wallet manages its own state (as you requested)
      const Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Colors.black,
        index: currentTabIndex,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.shopping_bag, color: Colors.white),
          Icon(Icons.wallet, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
      body: IndexedStack(
        index: currentTabIndex,
        children: pages,
      ),
    );
  }
}
