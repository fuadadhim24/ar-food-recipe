import 'package:ar_food_recipe/ui/pages/detail_menu_page.dart';
import 'package:ar_food_recipe/ui/widgets/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const BottomNavigation()),
        GetPage(name: '/detail-menu', page: () => const DetailMenuPage()),
      ],
    );
  }
}
