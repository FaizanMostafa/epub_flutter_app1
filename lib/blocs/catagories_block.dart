import 'dart:async';

import 'package:epub_flutter_app1/api/db_api.dart';
import 'package:epub_flutter_app1/models/catagory.dart';
import 'package:epub_flutter_app1/widgets/bloc_provider.dart';

class CatagoriesBloc implements BlocBase{

  List<Catagory> _catagories;
  StreamController<List<Catagory>> _catagoriesController = StreamController<List<Catagory>>();
  Sink<List<Catagory>> get _inCatagories => _catagoriesController.sink;
  Stream<List<Catagory>> get outCatagories => _catagoriesController.stream;

  CatagoriesBloc() {
    getCatagories();
  }

  void getCatagories(){
    DbApi dbAPi = DbApi();
    _catagories = dbAPi.getCatagories();
    _inCatagories.add(_catagories);
  }

  @override
  void dispose() {
    _catagoriesController.close();
  }
  
}