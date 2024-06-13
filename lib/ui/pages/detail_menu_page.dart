import 'package:ar_food_recipe/shared/theme.dart';
import 'package:flutter/material.dart';

class DetailMenu extends StatefulWidget {
  const DetailMenu({super.key});

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        centerTitle: true,
        bottomOpacity: 0,
        forceMaterialTransparency: true,
        title: Text(
          'Detail Menu',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
