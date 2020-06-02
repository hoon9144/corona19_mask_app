import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttermaskapi01/model/Store.dart';

class Repository {
  Future<List<Store>> fetch() async {
    List<Store> store = List<Store>();

    //제이슨 경로를 받아온다 res.body 몸통이있음.  받을때까지 기달림 비동기
    final res = await http.get(
        'https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat=37.536633&lng=127.051884&m=3000');
    //res 상태가 200 오케이라면~
    if (res.statusCode == 200) {
      print('http ok!!');
      //한글깨짐 utf 디코드 bodyBytes 로 해야함.
      final jsonParsed = jsonDecode(utf8.decode(res.bodyBytes));
      print(jsonParsed);

      //json 파일중에서 stores[]배열을 사용하겠단 의미임. 나중에 파싱할때 잘 생각해서 쓰면 될듯 필요한 것들만.
      final jsonStore = jsonParsed['stores'];
      //포이치로 돌려서 e => Store 클라스에 만들어놓은 fronJSON에 value를 저장함.
      jsonStore.forEach((e) =>
        store.add(Store.fromJson(e))
      );
      print('store add! : ${store}');

      return store
          .where((v) => v.remainStat == 'empty' || v.remainStat == 'few')
          .toList();
    } else {
      print('http error!');
    }
  }
}
