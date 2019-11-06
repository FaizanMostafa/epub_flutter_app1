import 'dart:async';

import 'package:epub_flutter_app1/api/db_api.dart';
import 'package:epub_flutter_app1/models/catagory.dart';
import 'package:epub_flutter_app1/models/product.dart';
import 'package:epub_flutter_app1/widgets/bloc_provider.dart';

class ProductsBloc implements BlocBase{
  List<Product> _products;
  
  final _productsController = StreamController<List<Product>>();
  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  ProductsBloc(Catagory catagory) {
    getProducts(catagory);
  }

  void getProducts(Catagory catagory) async {
    DbApi dbAPi = DbApi();
    _products = await dbAPi.getProducts(catagory);
    _inProducts.add(_products);
  }

  @override
  void dispose() {
    _productsController.close();
  }
  
}