import 'package:flutter/material.dart';
import 'package:project_uas/pages/detail_page.dart';
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
    var nonFavorite = pro;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(8, 12, 8, 12),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Icon(Icons.search), Text('Search')],
                  ),
                ),
              ),
            ),
            //banners (carousel)
            SizedBox(
              width: size.width,
              height: 150,
              child: PageView(
                allowImplicitScrolling: true,
                scrollDirection: Axis.horizontal,
                children: [
                  BannerHeader(
                    imageAsset: "aset/awa/bug.png",
                    title: "belanja 100 juta",
                    subtitle: "diskon 50%",
                  ),
                  BannerHeader(
                    imageAsset: "aset/awa/promo1.jpg",
                    title: "",
                    subtitle: "",
                  ),
                  BannerHeader(
                    imageAsset: "aset/awa/code.png",
                    title: "",
                    subtitle: "#100peng",
                  ),
                ],
              ),
            ),
            //categories
            Container(
              width: size.width,
              height: 300,
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
            //pruduct
              Container(
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
                  itemCount: pro.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, s) => ProductWidget(
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
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}