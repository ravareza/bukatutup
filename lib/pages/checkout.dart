import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/pages/cart_page.dart';
import 'package:project_uas/pages/menu_page.dart';

import '../services/product_list.dart';

class Checkout extends StatefulWidget {
  final ProductModel product;
  const Checkout({super.key, required this.product});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int? count;
  String? selecPay;
  String? selecDeliv;
  List<String> pay = [
    'Cash On Delivery',
    'PayLater',
    'BRI',
    'BNI',
    'Gopay',
    'DANA',
    'OVO',
    'ShopeePay',
  ];

  List<String> deliv = [
    'J&T Express',
    'SiCepat Ekspres',
    'Anteraja',
    'JNE',
    'SPX',
  ];

  void _addToCart() {
    final index = pro.indexWhere((element) => element.id == widget.product.id);
    if (index != -1) {
      setState(() {
        pro[index].chart = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //Gmaps
              Container(
                width: size.width - 50,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/awa/map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              //pruductkecil
              ListTile(
                leading: Image.asset(
                  product.img,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Rp ${product.price}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // dropdown metod
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        'Payment:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      DropdownButton<String>(
                        hint: const Text('Payment Method'),
                        value: selecPay,
                        items: pay.map((s) {
                          return DropdownMenuItem<String>(
                            value: s,
                            child: Text(
                              s,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selecPay = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        'Delivery:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      DropdownButton<String>(
                        hint: const Text('Delivery Method'),
                        value: selecDeliv,
                        items: deliv.map((s) {
                          return DropdownMenuItem<String>(
                            value: s,
                            child: Text(
                              s,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selecDeliv = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 200),
              Card(
                child: Column(
                  children: [
                    Text(
                      "Ringkasan Pesanan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1x ${product.name}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          product.price,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(
                          Size(size.width - 20, 70),
                        ),
                        backgroundColor: WidgetStatePropertyAll(Colors.green),
                      ),
                      onPressed: () {
                        _addToCart();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>MenuPage(),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Pesanan berhasil dibuat! Lihat di cart"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: Text(
                        "Konfirmasi Pesanan",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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