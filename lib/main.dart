import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/video_info.dart';

import 'home_page.dart';

import 'video_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
    );
  }
}

// 9805930542
// 8219648915