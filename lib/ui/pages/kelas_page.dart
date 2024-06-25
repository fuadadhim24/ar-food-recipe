import 'package:ar_food_recipe/shared/theme.dart';
import 'package:ar_food_recipe/ui/widgets/searchContainerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ar_food_recipe/data/kelas.dart';

class KelasPage extends StatefulWidget {
  @override
  State<KelasPage> createState() => _KelasPageState();
}

class _KelasPageState extends State<KelasPage> {
  int selectedIndex = 0;

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
          const SizedBox(height: 30),
          const SearchContainer(hintText: 'cth: bahaya gizi buruk'),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildNavigationToggle(0, 'Tangani'),
                buildNavigationToggle(1, 'Antisipasi'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          buildListCard(),
        ],
      ),
    );
  }

  Widget buildListCard() {
    return Expanded(
      child: ListView.builder(
        itemCount: Kelas.kelasList.length,
        itemBuilder: (context, index) {
          return buildCard(Kelas.kelasList[index]);
        },
      ),
    );
  }

  Widget buildCard(Map<String, dynamic> kelas) {
    String id = kelas['id'].toString();
    String title = kelas['title'].toString();
    String namaFoto = kelas['namaFoto'].toString();
    return GestureDetector(
      onTap: () {
        var listKelasChoosed = getKelasById(id);
        setListKelasChoosed(listKelasChoosed);
        debugPrint(Kelas.listKelasChoosed.toString());
        Get.toNamed('/detail-kelas');
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: orangeColor,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 130),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  Text(
                    'baca selengkapnya →',
                    style: greyTextStyle.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
            Container(
              width: 160,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/$namaFoto'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavigationToggle(int index, String text) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Text(
        text,
        style: blackTextStyle.copyWith(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Map<String, dynamic> getKelasById(String id) {
    var kelas = Kelas.kelasList
        .firstWhere((kelas) => kelas['id'] == id, orElse: () => {});
    return kelas;
  }

  void setListKelasChoosed(listKelasChoosed) {
    Kelas.listKelasChoosed.clear();
    Kelas.listKelasChoosed.addAll(listKelasChoosed);
  }
}
