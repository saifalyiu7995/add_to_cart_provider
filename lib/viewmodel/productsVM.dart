import 'package:flutter/widgets.dart';
import 'package:providercart/model/productModel.dart';

class ProductsVM with ChangeNotifier {
  List<Products> lst = List<Products>();

  add(String image, String name) {
    lst.add(Products(image: image, name: name));
    notifyListeners();
  }

  del(int index) {
    lst.removeAt(index);
    notifyListeners();
  }
}
