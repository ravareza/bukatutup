import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/widgets/product_widget.dart';
import '../services/product_list.dart';
import '../pages/det_product.dart';

class FashFood extends StatefulWidget {
  const FashFood({super.key});

  @override
  State<FashFood> createState() => _FashFoodState();
}

class _FashFoodState extends State<FashFood> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<ProductModel> foodItems = pro.where((item) {
      return item.id == 7 || item.id == 8;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Fash Food")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: foodItems.length,
          itemBuilder: (context, id) {
            return ProductWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetProduct(id: foodItems[id].id),
                  ),
                );
              },
              key: ValueKey(foodItems[id].id),
              name: foodItems[id].name,
              price: foodItems[id].price.toString(),
              ratings: foodItems[id].ratings.toString(),
              img: foodItems[id].img,
              onfavorite: () {
                setState(() {
                  int idAsli = foodItems[id].id;
                  pro[idAsli].favorite = true;
                });
              },
              width: size.width / 2,
              height: 200,
              isfavorite: foodItems[id].favorite,
            );
          },
        ),
      ),
    );
  }
}
