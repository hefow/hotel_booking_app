import 'package:flutter/material.dart';
import 'package:frontend/screans/onboarding.dart';
import 'package:get/get.dart';
import 'package:frontend/components/hotel_controller.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(HotelController()); // Register the controller
      }),
      home: const Onboarding(), // Or your initial page
    ),
  );
}
