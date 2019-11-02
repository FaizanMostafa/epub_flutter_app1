import 'package:epub_flutter_app1/blocs/catagories_block.dart';
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
        builder: (BuildContext context, AsyncSnapShot<List<Catagory>> catagories){
          if(catagories.hasData){
            return ListView.builder(
              itemCount: catagories.data.length,
              itemBuilder: (BuildContext context, int index){
                return Text(
                  catagories.data[index].name,
                  style: TextStyle(fontSize: 24.0),
                  );
              },
            )
          }
        }
      )
    );
  }
}