import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/services/product_list.dart';
import 'package:project_uas/widgets/product_widget.dart';
import 'det_product.dart';

class SportPage extends StatefulWidget {
  const SportPage({super.key});

  @override
  State<SportPage> createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<ProductModel> electro = pro.where((item) {
      return item.id == 2 || item.id == 3 || item.id == 4;
    }).toList();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: size.width,
              margin: EdgeInsets.all(30),
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      width: size.width,
                      height: electro.length / 2 * 360,
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                        itemCount: electro.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.70,
                        ),
                        itemBuilder: (context, ind) {
                          return ProductWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetProduct(id: electro[ind].id),
                                ),
                              );
                            },
                            key: ValueKey(electro[ind].id),
                            name: electro[ind].name,
                            price: electro[ind].price.toString(),
                            ratings: electro[ind].ratings.toString(),
                            img: electro[ind].img,
                            onfavorite: () {
                              setState(() {
                                electro[ind].favorite = true;
                                ;
                              });
                            },
                            width: size.width / 2,
                            height: 200,
                            isfavorite: electro[ind].favorite, addr: electro[ind].addres,
                          );
                        },
                      ),
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
