import 'package:flutter/material.dart';
import 'package:fluttermaskapi01/viewmodel/store_model.dart';
import 'package:provider/provider.dart';
import 'widgets/remain_list_tile.dart';

class ApiPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final storeModel = Provider.of<StoreModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('마스크 있는곳 ${storeModel.store.length}'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: () {
              storeModel.fetch();
            }),
          ],
        ),body: storeModel.isLoading ? loading() : ListView(
        children: storeModel.store
            .map((e) {
          return ListTile(
            title: Text('${e.name}'),
            subtitle: Text('${e.addr}'),
            trailing: ListTile1(e.remainStat),
          );
        }).toList()
    )
    );
  }


  Widget loading(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('로딩중..'),
          CircularProgressIndicator()
        ],
      ),
    );
  }



}
