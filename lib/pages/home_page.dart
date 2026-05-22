import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/pages/det_product.dart';
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
    var nonFavorite = pro.where((p) => p.favorite == false).toList();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //search
              GestureDetector(
                onTap: () => showSearch(context: context, delegate: CustomSearch()),
                child: SearchBar(leading: Icon(Icons.search),
                  hintText: "Search",
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.0)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30.0))),
                  elevation: WidgetStatePropertyAll(10.0),
                  onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                ),
              ),


              //categories
              Container(
                width: size.width,
                height: 100,
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
                height: 180,
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

//search ga tau jadi ngaknya
class CustomSearch extends SearchDelegate {
  List<String> searchTerm = [
    'Sepatu',
    'Baju',
    'Laptop',
    'Ayam bakar',
    'Minuman',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> match = [];
    for (var prod in searchTerm) {
      if (prod.toLowerCase().contains(query.toLowerCase())) {
        match.add(prod);
      }
    }
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, s) {
        var result = match[s];
        return ListTile(title: Text(result));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> match = [];
    for (var prod in searchTerm) {
      if (prod.toLowerCase().contains(query.toLowerCase())) {
        match.add(prod);
      }
    }
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, s) {
        var result = match[s];
        return ListTile(title: Text(result));
      },
    );
  }
}
