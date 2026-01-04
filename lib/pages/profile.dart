// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:online_pharmacy/pages/login.dart';
// import '../main.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   bool _isProcessing = false;
//   File? _profileImageFile;
//   final ImagePicker _picker = ImagePicker();
//   bool _loadingImage = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadLocalProfileImage();
//   }

//   /// ================= LOAD LOCAL IMAGE =================
//   Future<void> _loadLocalProfileImage() async {
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/profile_image.png');
//     if (await file.exists()) {
//       setState(() => _profileImageFile = file);
//     }
//   }

//   /// ================= PICK IMAGE =================
//   Future<void> _pickProfileImage() async {
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 80,
//     );
//     if (pickedFile == null) return;

//     setState(() => _loadingImage = true);

//     try {
//       final dir = await getApplicationDocumentsDirectory();
//       final savedFile = await File(pickedFile.path).copy('${dir.path}/profile_image.png');

//       setState(() => _profileImageFile = savedFile);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to save image: $e')),
//       );
//     } finally {
//       setState(() => _loadingImage = false);
//     }
//   }

//   /// ================= SHOW LOADING =================
//   void _showLoading() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => const Center(child: CircularProgressIndicator()),
//     );
//   }

//   /// ================= LOGOUT =================
//   Future<void> _handleLogout() async {
//     if (_isProcessing) return;
//     setState(() => _isProcessing = true);

//     _showLoading();
//     await Future.delayed(const Duration(seconds: 3));

//     await FirebaseAuth.instance.signOut();

//     if (!mounted) return;
//     Navigator.pop(context);

//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const Login()),
//       (_) => false,
//     );

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("You have been Logged Out Successfully!"),
//         backgroundColor: Colors.green,
//       ),
//     );

//     setState(() => _isProcessing = false);
//   }

//   /// ================= DELETE ACCOUNT =================
//   Future<void> _handleDeleteAccount() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final confirm = await showDialog<bool>(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) {
//         return Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           child: Padding(
//             padding: const EdgeInsets.all(25),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(18),
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFff416c), Color(0xFFff4b2b)],
//                     ),
//                   ),
//                   child: const Icon(Icons.warning_rounded, color: Colors.white, size: 40),
//                 ),
//                 const SizedBox(height: 20),
//                 Text("Delete Account?", style: AppWidget.headlineTextStyle(22)),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "This action is permanent and cannot be undone.\nAll your data will be removed.",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 const SizedBox(height: 25),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                         ),
//                         onPressed: () => Navigator.pop(context, false),
//                         child: const Text("Cancel"),
//                       ),
//                     ),
//                     const SizedBox(width: 15),
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                         ),
//                         onPressed: () => Navigator.pop(context, true),
//                         child: const Text("Delete", style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     if (confirm != true) return;

//     _showLoading();
//     await Future.delayed(const Duration(seconds: 3));

//     try {
//       await user.delete();

//       if (!mounted) return;
//       Navigator.pop(context);

//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => const Login()),
//         (_) => false,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Your account has been deleted successfully."),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       String message = "Failed to delete account.";
//       if (e.code == 'requires-recent-login') {
//         message = "Please log in again before deleting your account for security reasons.";
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Profile Page", style: AppWidget.headlineTextStyle(30)),
//               const SizedBox(height: 40),

//               /// 🌟 PROFILE IMAGE
//               Center(
//                 child: Stack(
//                   children: [
//                     CircleAvatar(
//   radius: 75,
//   backgroundColor: Colors.grey[300],
//   child: _profileImageFile != null
//       ? ClipOval(
//           child: Image.file(
//             _profileImageFile!,
//             width: 150,
//             height: 150,
//             fit: BoxFit.cover,
//           ),
//         )
//       : const Icon(
//           Icons.person,
//           size: 80,
//           color: Colors.white,
//         ),
// ),

//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: _pickProfileImage,
//                         child: CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.black,
//                           child: _loadingImage
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Icon(Icons.edit, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 40),

//               /// DARK MODE
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.brightness_6, size: 40),
//                     const SizedBox(width: 20),
//                     Text("Dark Mode", style: AppWidget.headlineTextStyle(20)),
//                     const Spacer(),
//                     Switch(
//                       value: themeNotifier.value == ThemeMode.dark,
//                       onChanged: (value) {
//                         themeNotifier.value =
//                             value ? ThemeMode.dark : ThemeMode.light;
//                         setState(() {});
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               buildProfileCard(
//                 icon: Icons.person_outline,
//                 title: "Name",
//                 subtitle: "KMHUSSAIN",
//                 context: context,
//               ),

//               const SizedBox(height: 20),

//               buildProfileCard(
//                 icon: Icons.mail_outline,
//                 title: "Email",
//                 subtitle: "kmhussain2003@gmail.com",
//                 context: context,
//               ),

//               const SizedBox(height: 20),

//               /// LOGOUT
//               GestureDetector(
//                 onTap: _handleLogout,
//                 child: buildProfileActionCard(
//                   icon: Icons.logout,
//                   title: "Log Out",
//                   context: context,
//                 ),
//               ),

//               const SizedBox(height: 20),

//               /// DELETE ACCOUNT
//               GestureDetector(
//                 onTap: _handleDeleteAccount,
//                 child: buildProfileActionCard(
//                   icon: Icons.delete,
//                   title: "Delete Account",
//                   context: context,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildProfileCard({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required BuildContext context,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 40),
//           const SizedBox(width: 20),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title, style: AppWidget.lightTextStyle(18)),
//               Text(subtitle, style: AppWidget.headlineTextStyle(20)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildProfileActionCard({
//     required IconData icon,
//     required String title,
//     required BuildContext context,
//   }) {
//     return Container(
//       height: 80,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 40),
//           const SizedBox(width: 20),
//           Text(title, style: AppWidget.headlineTextStyle(20)),
//           const Spacer(),
//           const Icon(Icons.arrow_forward_ios),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:online_pharmacy/pages/login.dart';
// import '../main.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   bool _isProcessing = false;
//   bool _loadingImage = false;

//   Uint8List? _profileImageBytes;
//   final ImagePicker _picker = ImagePicker();

//   /// ================= PICK PROFILE IMAGE (WEB SAFE) =================
//   Future<void> _pickProfileImage() async {
//     setState(() => _loadingImage = true);

//     try {
//       final XFile? pickedFile = await _picker.pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 80,
//       );

//       if (pickedFile == null) {
//         setState(() => _loadingImage = false);
//         return;
//       }

//       final bytes = await pickedFile.readAsBytes();

//       setState(() {
//         _profileImageBytes = bytes;
//         _loadingImage = false;
//       });
//     } catch (e) {
//       setState(() => _loadingImage = false);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to pick image: $e")),
//       );
//     }
//   }

//   /// ================= SHOW LOADING =================
//   void _showLoading() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }

//   /// ================= LOGOUT =================
//   Future<void> _handleLogout() async {
//     if (_isProcessing) return;
//     setState(() => _isProcessing = true);

//     _showLoading();
//     await Future.delayed(const Duration(seconds: 2));

//     await FirebaseAuth.instance.signOut();

//     if (!mounted) return;
//     Navigator.pop(context);

//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const Login()),
//       (_) => false,
//     );

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("You have been Logged Out Successfully!"),
//         backgroundColor: Colors.green,
//       ),
//     );

//     setState(() => _isProcessing = false);
//   }

//   /// ================= DELETE ACCOUNT =================
//   Future<void> _handleDeleteAccount() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final confirm = await showDialog<bool>(
//       context: context,
//       barrierDismissible: false,
//       builder: (_) {
//         return Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//           child: Padding(
//             padding: const EdgeInsets.all(25),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(18),
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFff416c), Color(0xFFff4b2b)],
//                     ),
//                   ),
//                   child: const Icon(Icons.warning_rounded,
//                       color: Colors.white, size: 40),
//                 ),
//                 const SizedBox(height: 20),
//                 Text("Delete Account?",
//                     style: AppWidget.headlineTextStyle(22)),
//                 const SizedBox(height: 10),
//                 const Text(
//                   "This action is permanent and cannot be undone.\nAll your data will be removed.",
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 25),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () => Navigator.pop(context, false),
//                         child: const Text("Cancel"),
//                       ),
//                     ),
//                     const SizedBox(width: 15),
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.redAccent,
//                         ),
//                         onPressed: () => Navigator.pop(context, true),
//                         child: const Text(
//                           "Delete",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );

//     if (confirm != true) return;

//     _showLoading();
//     await Future.delayed(const Duration(seconds: 2));

//     try {
//       await user.delete();

//       if (!mounted) return;
//       Navigator.pop(context);

//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => const Login()),
//         (_) => false,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Your account has been deleted successfully."),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       Navigator.pop(context);
//       String message = "Failed to delete account.";
//       if (e.code == 'requires-recent-login') {
//         message =
//             "Please log in again before deleting your account for security reasons.";
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message), backgroundColor: Colors.red),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Profile Page", style: AppWidget.headlineTextStyle(30)),
//               const SizedBox(height: 40),

//               /// ================= PROFILE IMAGE =================
//               Center(
//                 child: Stack(
//                   children: [
//                     CircleAvatar(
//                       radius: 75,
//                       backgroundColor: Colors.grey[300],
//                       child: _profileImageBytes != null
//                           ? ClipOval(
//                               child: Image.memory(
//                                 _profileImageBytes!,
//                                 width: 150,
//                                 height: 150,
//                                 fit: BoxFit.cover,
//                               ),
//                             )
//                           : const Icon(
//                               Icons.person,
//                               size: 80,
//                               color: Colors.white,
//                             ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: _pickProfileImage,
//                         child: CircleAvatar(
//                           radius: 24,
//                           backgroundColor: Colors.black,
//                           child: _loadingImage
//                               ? const CircularProgressIndicator(
//                                   color: Colors.white,
//                                   strokeWidth: 2,
//                                 )
//                               : const Icon(Icons.edit, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 40),

//               /// ================= DARK MODE =================
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.brightness_6, size: 40),
//                     const SizedBox(width: 20),
//                     Text("Dark Mode",
//                         style: AppWidget.headlineTextStyle(20)),
//                     const Spacer(),
//                     Switch(
//                       value: themeNotifier.value == ThemeMode.dark,
//                       onChanged: (value) {
//                         themeNotifier.value =
//                             value ? ThemeMode.dark : ThemeMode.light;
//                         setState(() {});
//                       },
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               buildProfileCard(
//                 icon: Icons.person_outline,
//                 title: "Name",
//                 subtitle: "KMHUSSAIN",
//                 context: context,
//               ),

//               const SizedBox(height: 20),

//               buildProfileCard(
//                 icon: Icons.mail_outline,
//                 title: "Email",
//                 subtitle: "kmhussain2003@gmail.com",
//                 context: context,
//               ),

//               const SizedBox(height: 20),

//               GestureDetector(
//                 onTap: _handleLogout,
//                 child: buildProfileActionCard(
//                   icon: Icons.logout,
//                   title: "Log Out",
//                   context: context,
//                 ),
//               ),

//               const SizedBox(height: 20),

//               GestureDetector(
//                 onTap: _handleDeleteAccount,
//                 child: buildProfileActionCard(
//                   icon: Icons.delete,
//                   title: "Delete Account",
//                   context: context,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildProfileCard({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required BuildContext context,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 40),
//           const SizedBox(width: 20),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title, style: AppWidget.lightTextStyle(18)),
//               Text(subtitle, style: AppWidget.headlineTextStyle(20)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildProfileActionCard({
//     required IconData icon,
//     required String title,
//     required BuildContext context,
//   }) {
//     return Container(
//       height: 80,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 40),
//           const SizedBox(width: 20),
//           Text(title, style: AppWidget.headlineTextStyle(20)),
//           const Spacer(),
//           const Icon(Icons.arrow_forward_ios),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';
// import 'package:online_pharmacy/pages/login.dart';
// import '../main.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile>
//     with SingleTickerProviderStateMixin {
//   bool _isProcessing = false;
//   bool _loadingImage = false;

//   Uint8List? _profileImageBytes;
//   final ImagePicker _picker = ImagePicker();

//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;

//   String _name = '';
//   String _email = '';

//   @override
//   void initState() {
//     super.initState();

//     final user = FirebaseAuth.instance.currentUser;
//     _name = user?.displayName ?? "User";
//     _email = user?.email ?? "";

//     _controller =
//         AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
//     _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

//     _controller.forward();
//   }

//   /// ================= PROFILE COMPLETION =================
//   double get profileCompletion {
//     int completed = 0;
//     if (_profileImageBytes != null) completed++;
//     if (_name.isNotEmpty) completed++;
//     if (_email.isNotEmpty) completed++;
//     return completed / 3;
//   }

//   /// ================= PICK IMAGE =================
//   Future<void> _pickProfileImage() async {
//     setState(() => _loadingImage = true);

//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

//     if (pickedFile != null) {
//       final bytes = await pickedFile.readAsBytes();
//       setState(() => _profileImageBytes = bytes);
//     }

//     setState(() => _loadingImage = false);
//   }

//   /// ================= EDIT NAME =================
//   Future<void> _editName() async {
//     final controller = TextEditingController(text: _name);

//     final result = await showDialog<String>(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Edit Name"),
//         content: TextField(controller: controller),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () => Navigator.pop(context, controller.text),
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );

//     if (result != null && result.isNotEmpty) {
//       await FirebaseAuth.instance.currentUser?.updateDisplayName(result);
//       setState(() => _name = result);
//     }
//   }

//   /// ================= EDIT EMAIL =================
//   Future<void> _editEmail() async {
//     final controller = TextEditingController(text: _email);

//     final result = await showDialog<String>(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Edit Email"),
//         content: TextField(controller: controller),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
//           ElevatedButton(
//             onPressed: () => Navigator.pop(context, controller.text),
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );

//     if (result != null && result.isNotEmpty) {
//       try {
//         await FirebaseAuth.instance.currentUser?.updateEmail(result);
//         setState(() => _email = result);
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Re-login required to change email")),
//         );
//       }
//     }
//   }

//   /// ================= LOGOUT =================
//   Future<void> _handleLogout() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const Login()),
//       (_) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FadeTransition(
//         opacity: _fadeAnimation,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Text("Profile", style: AppWidget.headlineTextStyle(30)),
//                 const SizedBox(height: 30),

//                 /// PROFILE IMAGE
//                 Stack(
//                   children: [
//                     CircleAvatar(
//                       radius: 70,
//                       backgroundColor: Colors.grey[300],
//                       child: _profileImageBytes != null
//                           ? ClipOval(
//                               child: Image.memory(
//                                 _profileImageBytes!,
//                                 width: 140,
//                                 height: 140,
//                                 fit: BoxFit.cover,
//                               ),
//                             )
//                           : const Icon(Icons.person, size: 70),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: GestureDetector(
//                         onTap: _pickProfileImage,
//                         child: CircleAvatar(
//                           radius: 22,
//                           backgroundColor: Colors.black,
//                           child: _loadingImage
//                               ? const CircularProgressIndicator(color: Colors.white)
//                               : const Icon(Icons.edit, color: Colors.white),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),

//                 const SizedBox(height: 25),

//                 /// PROFILE COMPLETION
//                 Column(
//                   children: [
//                     CircularProgressIndicator(
//                       value: profileCompletion,
//                       strokeWidth: 8,
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       "Profile ${(profileCompletion * 100).round()}% Complete",
//                       style: AppWidget.lightTextStyle(16),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 30),

//                 /// NAME
//                 GestureDetector(
//                   onTap: _editName,
//                   child: buildProfileCard(
//                     icon: Icons.person,
//                     title: "Name",
//                     subtitle: _name,
//                     context: context,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 /// EMAIL
//                 GestureDetector(
//                   onTap: _editEmail,
//                   child: buildProfileCard(
//                     icon: Icons.email,
//                     title: "Email",
//                     subtitle: _email,
//                     context: context,
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 GestureDetector(
//                   onTap: _handleLogout,
//                   child: buildProfileActionCard(
//                     icon: Icons.logout,
//                     title: "Logout",
//                     context: context,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildProfileCard({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required BuildContext context,
//   }) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 36),
//           const SizedBox(width: 20),
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(title, style: AppWidget.lightTextStyle(16)),
//             Text(subtitle, style: AppWidget.headlineTextStyle(18)),
//           ]),
//           const Spacer(),
//           const Icon(Icons.edit),
//         ],
//       ),
//     );
//   }

//   Widget buildProfileActionCard({
//     required IconData icon,
//     required String title,
//     required BuildContext context,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 36),
//           const SizedBox(width: 20),
//           Text(title, style: AppWidget.headlineTextStyle(18)),
//         ],
//       ),
//     );
//   }
// }

// extension on User? {
//   Future<void> updateEmail(String result) async {}
// }



import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_pharmacy/widgets/support_widget.dart';
import 'package:online_pharmacy/pages/login.dart';
import '../main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>
    with SingleTickerProviderStateMixin {
  bool _isProcessing = false;
  bool _loadingImage = false;

  Uint8List? _profileImageBytes;
  final ImagePicker _picker = ImagePicker();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    _name = user?.displayName ?? "User";
    _email = user?.email ?? "";

    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  /// ================= PROFILE COMPLETION =================
  double get profileCompletion {
    int completed = 0;
    if (_profileImageBytes != null) completed++;
    if (_name.isNotEmpty) completed++;
    if (_email.isNotEmpty) completed++;
    return completed / 3;
  }

  /// ================= PICK IMAGE (WEB SAFE) =================
  Future<void> _pickProfileImage() async {
    setState(() => _loadingImage = true);

    final XFile? picked =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (picked != null) {
      final bytes = await picked.readAsBytes();
      setState(() => _profileImageBytes = bytes);
    }

    setState(() => _loadingImage = false);
  }

  /// ================= EDIT NAME =================
  Future<void> _editName() async {
    final controller = TextEditingController(text: _name);

    final result = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Name"),
        content: TextField(controller: controller),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text("Save"),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(result);
      setState(() => _name = result);
    }
  }

  /// ================= EDIT EMAIL =================
  Future<void> _editEmail() async {
    final controller = TextEditingController(text: _email);

    final result = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Email"),
        content: TextField(controller: controller),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text("Save"),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      try {
        await FirebaseAuth.instance.currentUser?.updateEmail(result);
        setState(() => _email = result);
      } catch (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please re-login to change email"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// ================= LOGOUT =================
  Future<void> _handleLogout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const Login()),
      (_) => false,
    );
  }

  /// ================= DELETE ACCOUNT =================
  Future<void> _handleDeleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFff416c), Color(0xFFff4b2b)],
                  ),
                ),
                child: const Icon(Icons.warning_rounded,
                    color: Colors.white, size: 40),
              ),
              const SizedBox(height: 20),
              Text("Delete Account?", style: AppWidget.headlineTextStyle(22)),
              const SizedBox(height: 10),
              const Text(
                "This action is permanent and cannot be undone.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text("Delete"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    if (confirm != true) return;

    try {
      await user.delete();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const Login()),
        (_) => false,
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Re-login required to delete account"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Profile", style: AppWidget.headlineTextStyle(30)),
                const SizedBox(height: 30),

                /// PROFILE IMAGE
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey[300],
                      child: _profileImageBytes != null
                          ? ClipOval(
                              child: Image.memory(
                                _profileImageBytes!,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(Icons.person, size: 70),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickProfileImage,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.black,
                          child: _loadingImage
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 20),

                /// PROFILE COMPLETION
                Column(
                  children: [
                    CircularProgressIndicator(
                      value: profileCompletion,
                      strokeWidth: 7,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Profile ${(profileCompletion * 100).round()}% Complete",
                      style: AppWidget.lightTextStyle(16),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// DARK MODE
                buildDarkModeTile(),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: _editName,
                  child: buildProfileCard(
                    icon: Icons.person,
                    title: "Name",
                    subtitle: _name,
                    context: context,
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: _editEmail,
                  child: buildProfileCard(
                    icon: Icons.email,
                    title: "Email",
                    subtitle: _email,
                    context: context,
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: _handleLogout,
                  child: buildProfileActionCard(
                    icon: Icons.logout,
                    title: "Logout",
                    context: context,
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: _handleDeleteAccount,
                  child: buildProfileActionCard(
                    icon: Icons.delete,
                    title: "Delete Account",
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDarkModeTile() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.brightness_6, size: 36),
          const SizedBox(width: 20),
          Text("Dark Mode", style: AppWidget.headlineTextStyle(18)),
          const Spacer(),
          Switch(
            value: themeNotifier.value == ThemeMode.dark,
            onChanged: (value) {
              themeNotifier.value =
                  value ? ThemeMode.dark : ThemeMode.light;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget buildProfileCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 36),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: AppWidget.lightTextStyle(16)),
            Text(subtitle, style: AppWidget.headlineTextStyle(18)),
          ]),
          const Spacer(),
          const Icon(Icons.edit),
        ],
      ),
    );
  }

  Widget buildProfileActionCard({
    required IconData icon,
    required String title,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 36),
          const SizedBox(width: 20),
          Text(title, style: AppWidget.headlineTextStyle(18)),
        ],
      ),
    );
  }
}

extension on User? {
  Future<void> updateEmail(String result) async {}
}
