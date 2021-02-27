import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercart/view/widgets/cartItem.dart';
import 'package:providercart/viewmodel/productsVM.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer<ProductsVM>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: Container(
            height: screenSize.height,
            width: double.infinity,
            child: ListView.builder(
              itemCount: value.lst.length ?? 3,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  background: Container(
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    value.del(index);
                  },
                  child: CartItem(
                    screenSize: screenSize,
                    image: value.lst[index].image,
                    itemName: value.lst[index].name,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
