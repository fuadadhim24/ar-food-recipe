import 'package:ar_food_recipe/data/recipes.dart';
import 'package:ar_food_recipe/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllMenuPage extends StatefulWidget {
  const AllMenuPage({super.key});

  @override
  State<AllMenuPage> createState() => _AllMenuPageState();
}

class _AllMenuPageState extends State<AllMenuPage> {
  List<Map<String, dynamic>> items = Recipes.listRecipes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semua Menu',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: (items.length / 2).ceil(),
        itemBuilder: (context, rowIndex) {
          int startIndex = rowIndex * 2;
          int count =
              startIndex + 2 <= items.length ? 2 : items.length - startIndex;

          return Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: count,
              itemBuilder: (context, index) {
                final recipe = items[startIndex + index];
                final id = recipe['id'];
                final nama = recipe['nama'];
                final namaFoto = recipe['namaFoto'];
                final durasiMasak = recipe['durasiMasak'];

                return GestureDetector(
                  onTap: () {
                    Map<String, dynamic> getRecipe = getRecipeById(id);
                    setListRecipeChoosed(getRecipe);
                    Get.toNamed('/detail-menu');
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: blackColor,
                      image: DecorationImage(
                        image: AssetImage('assets/img/$namaFoto'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          nama,
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: whiteColor,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  durasiMasak + ' menit',
                                  style: whiteTextStyle.copyWith(fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Map<String, dynamic> getRecipeById(String id) {
    var recipe = Recipes.listRecipes
        .firstWhere((res) => res['id'] == id, orElse: () => {});
    return recipe;
  }

  void setListRecipeChoosed(listRecipeChoosed) {
    Recipes.listRecipeChoosed.clear();
    Recipes.listRecipeChoosed.addAll(listRecipeChoosed);
  }
}
