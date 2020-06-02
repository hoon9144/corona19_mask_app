import 'package:flutter/material.dart';


class ListTile1 extends StatelessWidget {
  String data;
  ListTile1(this.data);

  @override
  Widget build(BuildContext context) {
    return _buildLocation(data);
  }

  Widget _buildLocation(String data){

    var title = '';
    var content = '';
    var color;

    switch(data){
      case 'plenty':
        title = '많음';
        content = '100개이상';
        color = Colors.greenAccent;
        break;
      case 'some':
        title = '양호';
        content = '30이상100미만';
        color = Colors.yellow;
        break;
      case 'few':
        title = '소진임박';
        content = '30개미만';
        color = Colors.red;
        break;
      case 'empty':
        title = '없음';
        content = '1개이하';
        color = Colors.grey;
        break;
      case 'break':
        title = '판매중지';
        content = '';
        color = Colors.black;
        break;

    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('${title}' ,style:  TextStyle(fontSize: 12 ,fontWeight: FontWeight.bold ,color: color) ,),
        Text('${content}' ,style:  TextStyle(fontSize: 10 ,fontWeight: FontWeight.bold ,color: color) ,),
      ],);
  }
}
