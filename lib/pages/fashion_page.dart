import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/widgets/product_widget.dart';
import '../services/product_list.dart';
import '../pages/det_product.dart';

class FashionPage extends StatefulWidget {
  const FashionPage({super.key});

  @override
  State<FashionPage> createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<ProductModel> fashionItems = pro.where((item) {
      return item.id == 5 || item.id == 6;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Fashion")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: fashionItems.length,
          itemBuilder: (context, id) {
            return ProductWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetProduct(id: fashionItems[id].id),
                  ),
                );
              },
              key: ValueKey(fashionItems[id].id),
              name: fashionItems[id].name,
              price: fashionItems[id].price.toString(),
              ratings: fashionItems[id].ratings.toString(),
              img: fashionItems[id].img,
              onfavorite: () {
                setState(() {
                  int idAsli = fashionItems[id].id;
                  pro[idAsli].favorite = true;
                });
              },
              width: size.width / 2,
              height: 200,
              isfavorite: fashionItems[id].favorite,
            );
          },
        ),
      ),
    );
  }
}
