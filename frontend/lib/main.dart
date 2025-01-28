import 'package:flutter/material.dart';
import 'package:frontend/screans/home.dart';
import 'package:frontend/screans/onboarding.dart';
import 'package:get/get.dart';
import 'package:frontend/components/hotel_controller.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: HotelSearchPage());
//   }
// }

// Your controller file

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(HotelController()); // Register the controller
      }),
      home: const HotelSearchPage(), // Or your initial page
    ),
  );
}

