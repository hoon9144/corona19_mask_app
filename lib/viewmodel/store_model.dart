import 'package:flutter/cupertino.dart';
import 'package:fluttermaskapi01/model/Store.dart';
import 'package:fluttermaskapi01/repository/store_repository.dart';

class StoreModel with ChangeNotifier {
  
  final _storeRepository = Repository();
  List<Store> store = [];
  //처음 로딩중일때 띄우는 화면
  bool isLoading = false;

  StoreModel(){
    fetch();
  }

  Future fetch() async {
    //처음 로딩중일때 띄우는 화면
    isLoading = true;
    notifyListeners();
    store = await _storeRepository.fetch();
    notifyListeners();
    isLoading = false;
  }

}