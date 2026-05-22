import 'package:flutter/material.dart';
import 'package:project_uas/services/product_list.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var nonFavorite = pro
        .where((element) => element.favorite == true)
        .toList();
    return GestureDetector(
      child: Scaffold(
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child:
              SizedBox(
                  height: size.height,
                  width: size.width,
                  child: ListView(
                    children: [
                      Container(
                        width: size.width,
                        margin: EdgeInsetsGeometry.all(30),
                        child: Column(
                          children: [
                            Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [Text("Favorite",)],
                              ),
                            ),
                            SizedBox(
                              width: size.width - 60,
                              height: size.height,
                              child: ListView.builder(
                                itemCount: nonFavorite.length,
                                itemBuilder: (context, s) {
                                  if (nonFavorite[s].favorite == true) {
                                    return Card(
                                      elevation: 5,
                                      child: Container(
                                        width: size.width - 150,
                                        height: 150,
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              nonFavorite[s].img,
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
                                                    nonFavorite[s].name,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    nonFavorite[s].price.toString(),
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      ),
                                                      Text(
                                                        nonFavorite[s].ratings.toString(),
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
      
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
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
                                                            ;
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
                    ],
                  ),
                ),
          ),
      ),
    );
  }
}

