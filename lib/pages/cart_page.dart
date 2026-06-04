import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';

import '../services/product_list.dart';

class ChartPage extends StatefulWidget {
  final ProductModel id;
  const ChartPage({super.key, required this.id});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final unchart = pro.where((element) => element.chart == true).toList();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.lightBlue),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Card(child: Text("Chart"))],
                    ),
                    SizedBox(
                      width: size.width - 60,
                      height: size.height,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: unchart.length,
                        itemBuilder: (context, s) {
                          if (unchart[s].chart == true) {
                            return Card(
                              elevation: 5,
                              child: Container(
                                width: size.width - 150,
                                height: 150,
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      unchart[s].img,
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
                                          Text("Product:${unchart[s].name}",

                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text("Price: ${unchart[s].price.toString()}"
                                            ,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text("Payment: ${ unchart[s].pay}"
                                           ,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text("Deliveri: ${ unchart[s].deliv}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    unchart[s].chart =
                                                        !unchart[s].chart;
                                                    ;
                                                  });
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
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
      ),
    );
  }
}
