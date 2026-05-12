import 'package:flutter/material.dart';

import '../services/product_list.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Container(
              width: size.width,
              margin: EdgeInsetsGeometry.all(30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Favorite")],
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: pro.length,
                      itemBuilder: (context, s) {
                        if (pro[s].favorite == true) {
                          return Card(
                            elevation: 5,
                            child: Container(
                              width: size.width - 150,
                              height: 150,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    pro[s].img,
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
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: IconButton(
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
                                        ),
                                        Text(
                                          pro[s].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          pro[s].price.toString(),
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
                                              pro[s].ratings.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
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
    );
  }
}
