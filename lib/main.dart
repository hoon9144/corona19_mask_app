import 'package:flutter/material.dart';
import 'package:fluttermaskapi01/ui/view.dart';
import 'package:fluttermaskapi01/viewmodel/store_model.dart';
import 'package:provider/provider.dart';


void main() => runApp(

    ChangeNotifierProvider.value(value: StoreModel(),child: MyApp(),)
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mask api',
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: ApiPage(),
    );
  }
}



