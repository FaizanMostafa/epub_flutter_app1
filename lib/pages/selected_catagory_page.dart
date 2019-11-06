import 'package:epub_flutter_app1/models/product.dart';
import 'package:flutter/material.dart';

class SelectedCatagoryPage extends StatelessWidget {

  const SelectedCatagoryPage({Key key, @required this.products}) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catagory Details"),
      ),
      body: ListView(
        children: products.map((product) {
          return Text(product.name);
        }).toList(),
      ),
    );
  }
}