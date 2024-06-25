import 'package:ar_food_recipe/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 13, right: 13, top: 36),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kelas',
                style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed('/detail-menu');
            },
            child: Container(
              width: 120,
              height: 120,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
