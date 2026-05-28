import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/widgets/product_widget.dart';
import '../services/product_list.dart';
import '../pages/det_product.dart';

class SportPage extends StatefulWidget {
  const SportPage({super.key});

  @override
  State<SportPage> createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<ProductModel> sportItems = pro.where((item) {
      return item.id == 2 || item.id == 3 || item.id == 4;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Sport")),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: sportItems.length,
          itemBuilder: (context, id) {
            return ProductWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetProduct(id: sportItems[id].id),
                  ),
                );
              },
              key: ValueKey(sportItems[id].id),
              name: sportItems[id].name,
              price: sportItems[id].price.toString(),
              ratings: sportItems[id].ratings.toString(),
              img: sportItems[id].img,
              onfavorite: () {
                setState(() {
                  int idAsli = sportItems[id].id;
                  pro[idAsli].favorite = true;
                });
              },
              width: size.width / 2,
              height: 200,
              isfavorite: sportItems[id].favorite,
            );
          },
        ),
      ),
    );
  }
}
