import 'package:epub_flutter_app1/blocs/catagories_block.dart';
import 'package:epub_flutter_app1/blocs/products_bloc.dart';
import 'package:epub_flutter_app1/models/catagory.dart';
import 'package:epub_flutter_app1/models/product.dart';
import 'package:epub_flutter_app1/pages/selected_catagory_page.dart';
import 'package:epub_flutter_app1/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CatagoriesBloc _catagoriesBloc = BlocProvider.of<CatagoriesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: StreamBuilder(
        stream: _catagoriesBloc.outCatagories,
        builder: (BuildContext context, AsyncSnapshot<List<Catagory>> catagories){
          if(catagories.hasData){
            return ListView.builder(
              itemCount: catagories.data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => 
                      BlocProvider<ProductsBloc>(
                        bloc: ProductsBloc(catagories.data[index]),
                        child: SelectedCatagoryPage(),
                      )
                    )
                  ),
                  title: Text(
                  catagories.data[index].name,
                  style: TextStyle(fontSize: 24.0),
                  ),
                );
              },
            );
          }
          return SizedBox();
        }
      )
    );
  }
}