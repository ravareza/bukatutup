import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/pages/det_product.dart';
import 'package:project_uas/services/banner_service.dart';
import 'package:project_uas/services/product_list.dart';
import 'package:project_uas/widgets/banner_header.dart';
import 'package:project_uas/widgets/product_widget.dart';

import '../services/category_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var nonFavorite = pro.where((p) => p.favorite == false).toList();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //searcbar

              //categories
              Container(
                width: size.width,
                height: 110,
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: cat.length,
                  itemBuilder: (context, s) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => cat[s].page),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(cat[s].icon, color: cat[s].color, size: 30),
                            Text(cat[s].labelcat),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              //banners (carousel)
              SizedBox(
                width: size.width,
                height: 200,
                child: PageView(
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(banner.length, (index) => BannerHeader(imageAsset: banner[index].imageAsset),)
                ),
              ),
              //pruduct
              GestureDetector(
                child: Container(
                  width: size.width,
                  height: pro.length / 2 * 240,
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: nonFavorite.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, s) {
                      return ProductWidget(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetProduct(id: pro[s].id),
                            ),
                          );
                        },
                        key: ValueKey(nonFavorite[s].id),
                        name: nonFavorite[s].name,
                        price: nonFavorite[s].price.toString(),
                        ratings: nonFavorite[s].ratings.toString(),
                        img: nonFavorite[s].img,
                        onfavorite: () {
                          setState(() {
                            nonFavorite[s].favorite = true;
                          });
                        },
                        width: size.width / 2,
                        height: 200,
                        isfavorite: nonFavorite[s].favorite,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}