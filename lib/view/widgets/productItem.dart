import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercart/viewmodel/productsVM.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {Key key, @required this.screenSize, this.image, this.itemName})
      : super(key: key);

  final Size screenSize;
  final String image, itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: screenSize.height * 0.2,
      width: screenSize.width * 0.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.blue[200].withOpacity(0.3),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              height: screenSize.height * 0.13,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              imageUrl: image ?? 'https://picsum.photos/250?image=9',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(itemName ?? "Item"),
          ),
          Consumer<ProductsVM>(
            builder: (context, value, child) => InkWell(
              onTap: () {
                value.add(image, itemName);
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                    height: screenSize.height * 0.03,
                    width: screenSize.width * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue),
                    child: Center(
                      child: Text(
                        "ADD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
