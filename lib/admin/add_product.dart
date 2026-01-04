// import 'package:flutter/material.dart';
// import 'package:online_pharmacy/services/database.dart';
// import 'package:online_pharmacy/widgets/support_widget.dart';

// class AddProduct extends StatefulWidget {
//   const AddProduct({super.key});

//   @override
//   State<AddProduct> createState() => _AddProductState();
// }

// class _AddProductState extends State<AddProduct> {
//   TextEditingController productnameController = TextEditingController();
//   TextEditingController productpriceController = TextEditingController();
//   TextEditingController brandnameController = TextEditingController();
//   TextEditingController productdescriptionController = TextEditingController();

//   final List<String> productCategory = [
//     'Medicine',
//     'Supplements',
//     'Herbal',
//     'Vitamins'
//   ];

//   String? value;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

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
//   gradient: LinearGradient(
//     colors: [
//       Color(0xFFe0c3fc),
//       Color(0xFF8ec5fc),
//     ],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   ),
//   borderRadius: BorderRadius.only(
//     bottomLeft: Radius.circular(60),
//     bottomRight: Radius.circular(60),
//   ),
// ),
//                 child: const Column(
//                   children: [
//                     SizedBox(height: 35),
//                     Text(
//                       "Add Product",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 60,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               /// FORM CARD
//               Container(
//                 width: screenWidth,
//                 margin: EdgeInsets.only(
//                   top: screenHeight * 0.30,
//                   left: 20,
//                   right: 20,
//                   bottom: 40,
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 20,
//                   vertical: 30,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 240, 247, 234),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),

//                     /// PRODUCT NAME
//                     const Text(
//                       "Product Name",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 24,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     _buildTextField("Product Name", productnameController),

//                     const SizedBox(height: 20),

//                     /// PRODUCT PRICE
//                     const Text(
//                       "Product Price",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 24,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     _buildTextField("Product Price", productpriceController),

//                     const SizedBox(height: 20),

//                     /// PRODUCT CATEGORY
//                     const Text(
//                       "Product Category",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 24,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(60),
//                         border: Border.all(
//                           color: const Color.fromARGB(85, 0, 0, 0),
//                           width: 1.5,
//                         ),
//                       ),
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           value: value,
//                           hint: const Text("Select Category"),
//                           icon: const Icon(
//                             Icons.arrow_drop_down,
//                             color: Colors.black,
//                             size: 36,
//                           ),
//                           dropdownColor: Colors.white,
//                           isExpanded: true,
//                           items: productCategory
//                               .map(
//                                 (item) => DropdownMenuItem<String>(
//                                   value: item,
//                                   child: Text(
//                                     item,
//                                     style:
//                                         AppWidget.headlineTextStyle(18.0),
//                                   ),
//                                 ),
//                               )
//                               .toList(),
//                           onChanged: (val) {
//                             setState(() {
//                               value = val;
//                             });
//                           },
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     /// PRODUCT BRAND
//                     const Text(
//                       "Brand Name",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 24,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     _buildTextField("Brand Name", brandnameController),

//                     const SizedBox(height: 20),

//                     /// PRODUCT DESCRIPTION
//                     const Text(
//                       "Product Description",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 24,
//                         fontFamily: 'FredokaBold',
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: TextField(
//                         controller: productdescriptionController,
//                         maxLines: 5,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                           hintText:
//                               "Write Something about the product......",
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20.0),

//                     GestureDetector(
//                       onTap: () async {
//                         // Check if all fields are filled
//                         if (productnameController.text.isNotEmpty &&
//                             productpriceController.text.isNotEmpty &&
//                             brandnameController.text.isNotEmpty &&
//                             value != null &&
//                             productdescriptionController.text.isNotEmpty) {
//                           Map<String, dynamic> addProduct = {
//                             "Name": productnameController.text,
//                             "Price": productpriceController.text,
//                             "Category": value,
//                             "BrandName": brandnameController.text,
//                             "Product Description": productdescriptionController.text,
//                             "UpdateName": productnameController.text.toUpperCase(),
//                             "SearchKey": productnameController.text[0].toUpperCase()
//                           };
//                           print(addProduct);
//                           await DatabaseMethods().addProduct(addProduct);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               backgroundColor: Colors.green,
//                               content: Text(
//                                 "Product Added Successfully!",
//                                 style: AppWidget.whiteTextStyle(20.0),
//                               ),
//                             ),
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               backgroundColor: Colors.red,
//                               content: Text(
//                                 "Please fill all the details",
//                                 style: AppWidget.whiteTextStyle(20.0),
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                       child: Container(
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//   gradient: const LinearGradient(
//     colors: [
//       Color(0xFFe0c3fc),
//       Color(0xFF8ec5fc),
//     ],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   ),
//   borderRadius: BorderRadius.circular(60),
// ),
//                         child: const Center(
//                           child: Text(
//                             "Add Product",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: 'FredokaBold',
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     const SizedBox(height: 40),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// REUSABLE TEXTFIELD (with controller)
//   Widget _buildTextField(String hint, TextEditingController controller) {
//     return Container(
//       padding: const EdgeInsets.only(left: 20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(60),
//         border: Border.all(
//           color: const Color.fromARGB(85, 0, 0, 0),
//           width: 1.5,
//         ),
//       ),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           hintText: hint,
//         ),
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart' as http;

// class AddProduct extends StatefulWidget {
//   const AddProduct({super.key});

//   @override
//   State<AddProduct> createState() => _AddProductState();
// }

// class _AddProductState extends State<AddProduct> {
//   // Controllers for product fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController categoryController = TextEditingController();
//   final TextEditingController brandController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();

//   Uint8List? selectedImageBytes; // Image bytes for web
//   bool _isLoading = false;

//   // ================= PICK IMAGE FOR WEB =================
//   Future<void> pickImage() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       withData: true,
//     );

//     if (result != null && result.files.single.bytes != null) {
//       setState(() {
//         selectedImageBytes = result.files.single.bytes;
//       });
//     }
//   }

//   // ================= UPLOAD IMAGE TO CLOUDINARY =================
//   Future<String?> uploadImageToCloudinary(Uint8List imageBytes) async {
//     final uri = Uri.parse(
//         "https://api.cloudinary.com/v1_1/dmtn1vi6k/image/upload");

//     final request = http.MultipartRequest("POST", uri)
//       ..fields['upload_preset'] = 'yzzr5uri'
//       ..fields['folder'] = 'products'
//       ..files.add(http.MultipartFile.fromBytes('file', imageBytes,
//           filename: "product_image.png"));

//     final response = await request.send();
//     final res = await http.Response.fromStream(response);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(res.body);
//       return data['secure_url'];
//     } else {
//       debugPrint("Cloudinary upload failed: ${res.body}");
//       return null;
//     }
//   }

//   // ================= ADD PRODUCT TO FIRESTORE =================
//   Future<void> addProduct() async {
//     if (nameController.text.isEmpty ||
//         priceController.text.isEmpty ||
//         categoryController.text.isEmpty ||
//         brandController.text.isEmpty ||
//         descriptionController.text.isEmpty ||
//         selectedImageBytes == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Please fill all fields and select an image"),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     // Upload image to Cloudinary
//     final imageUrl = await uploadImageToCloudinary(selectedImageBytes!);
//     if (imageUrl == null) {
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     // Add product to Firestore
//     await FirebaseFirestore.instance.collection('products').add({
//       'product_name': nameController.text.trim(),
//       'price': double.parse(priceController.text.trim()),
//       'category': categoryController.text.trim(),
//       'brand_name': brandController.text.trim(),
//       'description': descriptionController.text.trim(),
//       'image_url': imageUrl,
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     setState(() {
//       _isLoading = false;
//       nameController.clear();
//       priceController.clear();
//       categoryController.clear();
//       brandController.clear();
//       descriptionController.clear();
//       selectedImageBytes = null;
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Product added successfully!"),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final theme = Theme.of(context);

//     return Scaffold(
//       backgroundColor: theme.scaffoldBackgroundColor,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// HEADER
//             Text(
//               "Add Product",
//               style: TextStyle(
//                 fontSize: 36,
//                 fontFamily: 'FredokaBold',
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(height: 20),

//             /// PRODUCT NAME
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: "Product Name",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),

//             /// PRICE
//             TextField(
//               controller: priceController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "Price",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),

//             /// CATEGORY
//             TextField(
//               controller: categoryController,
//               decoration: InputDecoration(
//                 labelText: "Category",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),

//             /// BRAND
//             TextField(
//               controller: brandController,
//               decoration: InputDecoration(
//                 labelText: "Brand Name",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),

//             /// DESCRIPTION
//             TextField(
//               controller: descriptionController,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 labelText: "Description",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),

//             /// IMAGE PICKER
//             GestureDetector(
//               onTap: pickImage,
//               child: Container(
//                 height: 150,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: Colors.grey),
//                 ),
//                 child: selectedImageBytes != null
//                     ? Image.memory(selectedImageBytes!, fit: BoxFit.cover)
//                     : const Center(child: Text("Pick Product Image")),
//               ),
//             ),
//             const SizedBox(height: 25),

//             /// ADD PRODUCT BUTTON
//             _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: addProduct,
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         backgroundColor: theme.colorScheme.primary,
//                       ),
//                       child: const Text(
//                         "Add Product",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: 'FredokaBold',
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:online_pharmacy/widgets/support_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  /// CATEGORY DROPDOWN
  String selectedCategory = "Medicine";
  final List<String> categories = [
    "Medicine",
    "Supplements",
    "Vitamins",
    "Herbal",
  ];

  Uint8List? selectedImageBytes;
  bool _isLoading = false;

  /// ================= PICK IMAGE (WEB) =================
  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      setState(() {
        selectedImageBytes = result.files.single.bytes;
      });
    }
  }

  /// ================= CLOUDINARY UPLOAD =================
  Future<String?> uploadImageToCloudinary(Uint8List imageBytes) async {
    final uri =
        Uri.parse("https://api.cloudinary.com/v1_1/dmtn1vi6k/image/upload");

    final request = http.MultipartRequest("POST", uri)
      ..fields['upload_preset'] = 'yzzr5uri'
      ..fields['folder'] = 'products'
      ..files.add(
        http.MultipartFile.fromBytes(
          'file',
          imageBytes,
          filename: "product_image.png",
        ),
      );

    final response = await request.send();
    final res = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data['secure_url'];
    } else {
      debugPrint("Cloudinary upload failed: ${res.body}");
      return null;
    }
  }

  /// ================= ADD PRODUCT =================
  Future<void> addProduct() async {
    if (nameController.text.isEmpty ||
        priceController.text.isEmpty ||
        brandController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedImageBytes == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields and select an image"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    final imageUrl = await uploadImageToCloudinary(selectedImageBytes!);
    if (imageUrl == null) {
      setState(() => _isLoading = false);
      return;
    }

    await FirebaseFirestore.instance.collection('products').add({
      'product_name': nameController.text.trim(),
      'price': double.parse(priceController.text.trim()),
      'category': selectedCategory,
      'brand_name': brandController.text.trim(),
      'description': descriptionController.text.trim(),
      'image_url': imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() {
      _isLoading = false;
      nameController.clear();
      priceController.clear();
      brandController.clear();
      descriptionController.clear();
      selectedImageBytes = null;
      selectedCategory = "Medicine";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Product added successfully!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  /// ================= UI =================
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            const Text(
              "Add Product",
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'FredokaBold',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            /// PRODUCT NAME
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Product Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 15),

            /// PRICE
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 15),

            /// CATEGORY DROPDOWN (RESTORED)
            const Text(
              "Category",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'FredokaBold',
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color.fromARGB(85, 0, 0, 0),
                  width: 1.5,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  isExpanded: true,
                  items: categories
                      .map(
                        (cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(
                            cat,
                            style: const TextStyle(
                              fontFamily: 'FredokaRegular',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// BRAND
            TextField(
              controller: brandController,
              decoration: InputDecoration(
                labelText: "Brand Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 15),

            /// DESCRIPTION
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 15),

            /// IMAGE PICKER
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey),
                ),
                child: selectedImageBytes != null
                    ? Image.memory(
                        selectedImageBytes!,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Text("Pick Product Image"),
                      ),
              ),
            ),
            const SizedBox(height: 25),

            /// ADD PRODUCT BUTTON
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: addProduct,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      child: const Text(
                        "Add Product",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'FredokaBold',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
