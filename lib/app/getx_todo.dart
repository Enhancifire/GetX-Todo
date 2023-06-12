import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/presentation/home.dart';

class GetXTodo extends StatelessWidget {
  const GetXTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple, brightness: Brightness.dark),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
