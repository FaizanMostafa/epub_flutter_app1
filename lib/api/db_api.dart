import 'package:epub_flutter_app1/models/catagory.dart';
import 'package:epub_flutter_app1/models/product.dart';

class DbApi {
  List<Catagory> getCatagories(){
    List<Catagory> tempList = [Catagory(), Catagory(), Catagory(), Catagory(), Catagory(), Catagory()];
    return tempList;
  }
  List<Product> getProducts(Catagory catagory){
    List<Product> tempList = [Product.create("Handsfree"), Product.create("Charger"), Product.create("Data Cable"), Product.create("Temper Glass"), Product.create("Pouch")];
    return tempList;
  }
}