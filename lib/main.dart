import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_project/Utils/route_names.dart';
import 'Screens/Auth/Register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const RegistrationScreen(),
      getPages: AppRoute.appRoutes(),
    );
  }
}
