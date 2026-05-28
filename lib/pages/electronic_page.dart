import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/widgets/product_widget.dart';
import '../services/product_list.dart';
import '../pages/det_product.dart';

class ElectronicPage extends StatefulWidget {
  const ElectronicPage({super.key});

  @override
  State<ElectronicPage> createState() => _ElectronicPageState();
}

class _ElectronicPageState extends State<ElectronicPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<ProductModel> electronicItems = pro.where((item) {
      return item.id == 0 || item.id == 1 || item.id == 9;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Electronic")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: electronicItems.length,
          itemBuilder: (context, id) {
            return ProductWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetProduct(id: electronicItems[id].id),
                  ),
                );
              },
              key: ValueKey(electronicItems[id].id),
              name: electronicItems[id].name,
              price: electronicItems[id].price.toString(),
              ratings: electronicItems[id].ratings.toString(),
              img: electronicItems[id].img,
              onfavorite: () {
                setState(() {
                  electronicItems[id].favorite = true;
                });
              },
              width: size.width / 2,
              height: 200,
              isfavorite: electronicItems[id].favorite,
            );
          },
        ),
      ),
    );
  }
}
