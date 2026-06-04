import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/pages/det_product.dart';
import 'package:project_uas/services/banner_service.dart';
import 'package:project_uas/services/product_list.dart';
import 'package:project_uas/widgets/banner_header.dart';
import 'package:project_uas/widgets/product_widget.dart';

import '../services/category_service.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var nonFavorite = pro.where((p) => p.favorite == false).toList();
    var trueFavorite = pro.where((p) => p.favorite == true).toList();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SearchAnchor.bar(
                  barHintText: "Search",
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    String input = controller.value.text.toLowerCase();
                    var fillter = pro
                        .where((s) => s.name.toLowerCase().contains(input))
                        .toList();
                    return fillter.map(
                          (pro) => ListTile(
                        leading: Image.asset(
                          pro.img,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(pro.name),
                        subtitle: Text("Rp ${pro.price}"),
                        onTap: () {
                          controller.closeView(pro.name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetProduct(id: pro.id),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
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
                    return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(cat[s].icon, color: cat[s].color, size: 30),
                            Text(cat[s].labelcat),
                          ],
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
              //favorite
        GestureDetector(
          child: Container(
          width: size.width,
            margin: EdgeInsetsGeometry.all(30),
            child:
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Favorite"),
                    TextButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage(),));},
                      child: Row(children: [Icon(Icons.list), Text("All")]),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width - 50,
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trueFavorite.length,
                    shrinkWrap: true,
                    itemBuilder: (context, s) {
                        if (pro[s].favorite == true) {
                          return Card(
                            elevation: 5,
                            child: Container(
                              width: size.width - 150,
                              height: 200,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [

                                  Image.asset(
                                    trueFavorite[s].img,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          trueFavorite[s].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          trueFavorite[s].price.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(children: [
                                          Icon(
                                            Icons.star, color: Colors.yellow,),
                                          Text(
                                            trueFavorite[s].ratings.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ]

                                        ),

                                        Row(mainAxisAlignment: MainAxisAlignment
                                            .end,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  pro[s].favorite =
                                                  !pro[s].favorite;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                  ),
                ),
              ],
            ),
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
                              builder: (context) => DetProduct(id: nonFavorite[s].id),
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
                            nonFavorite[s].favoriteadd = DateTime.now();
                          });
                        },
                        width: size.width / 2,
                        height: 200,
                        isfavorite: nonFavorite[s].favorite, addr: nonFavorite[s].addres,
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