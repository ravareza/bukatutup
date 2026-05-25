import 'package:flutter/material.dart';

import '../services/product_list.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    bool remember = true;
    var size = MediaQuery.of(context).size;
    var unchart = pro.where((element) => element.chart == true).toList();
    return Scaffold(
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
                      children: [Card(child: Text("Chart"),)],
                    ),
                    SizedBox(
                      width: size.width - 60,
                      height: size.height,
                      child: ListView.builder(
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
                                    Checkbox(
                                      value: remember,
                                      onChanged: (value) {
                                        setState(() {
                                          remember = !remember;
                                        });
                                      },
                                    ),
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
                                          Text(
                                            unchart[s].name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            unchart[s].price.toString(),
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
                                                unchart[s].ratings.toString(),
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
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    pro[s].chart =
                                                        !pro[s].chart;
                                                    ;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.shopping_cart,
                                                  color: Colors.green,
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
