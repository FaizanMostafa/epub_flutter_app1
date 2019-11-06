import 'package:epub_flutter_app1/blocs/products_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:epub_flutter_app1/blocs/products_bloc.dart';
import 'package:epub_flutter_app1/models/product.dart';
import 'package:epub_flutter_app1/widgets/bloc_provider.dart';

class SelectedCatagoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ProductsBloc _productsBloc = BlocProvider.of<ProductsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catagory Details"),
      ),
      body: StreamBuilder<List<Product>>(
        stream: _productsBloc.outProducts,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext contect, int index){
                return Center(
                  child: Text(snapshot.data[index].name),
                );
              },
            );
          }
          return SizedBox();
        },
      )
    );
  }
}