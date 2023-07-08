import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/login/login.dart';
import 'controllers/PurchaseOrderController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register PurchaseOrderController
    Get.put(PurchaseOrderController());

    return GetMaterialApp(
      home: LoginPage(),
    );
  }
}
