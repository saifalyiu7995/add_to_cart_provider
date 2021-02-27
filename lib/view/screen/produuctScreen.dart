import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercart/view/screen/cart.dart';
import 'package:providercart/view/widgets/cartCounter.dart';
import 'package:providercart/view/widgets/productItem.dart';
import 'package:providercart/viewmodel/productsVM.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 8, bottom: 8),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Icon(Icons.shopping_cart_rounded,
                          color: Colors.blue, size: 25)),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Consumer<ProductsVM>(
                      builder: (context, value, child) => CartCounter(
                        count: value.lst.length.toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_rounded, color: Colors.blue, size: 25),
        ),
        title: Center(
          child: Text(
            "My Mart",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: screenSize.height * 0.24,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: prds.length,
            itemBuilder: (context, index) => ProductItem(
              screenSize: screenSize,
              image: prds[index]["image"],
              itemName: prds[index]["name"],
            ),
          ),
        ),
      )),
    );
  }
}

final prds = [
  {
    "name": "ABCD",
    "image":
        "https://lapntab.com/storage/app/public/images/products/oppo-a12_1.jpg"
  },
  {
    "name": "QQWE",
    "image":
        "https://lapntab.com/storage/app/public/images/products/oppo-f15_1.jpg"
  },
  {
    "name": "WWSA",
    "image":
        "https://lapntab.com/storage/app/public/images/products/reno-5_1.jpg"
  },
  {
    "name": "EXMP",
    "image":
        "https://lapntab.com/storage/app/public/images/products/apple-iphone-11-pro-64gb_1.jpg"
  },
  {
    "name": "SADS",
    "image":
        "https://lapntab.com/storage/app/public/images/products/hp-envy-13-ah1011tx-8th-gen_1.jpg"
  },
  {
    "name": "SADS",
    "image":
        "https://lapntab.com/storage/app/public/images/products/hp-pavilion-15-cs1034tx-i7_1.jpg"
  },
];
