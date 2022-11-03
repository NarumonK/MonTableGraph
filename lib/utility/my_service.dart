import 'package:dio/dio.dart';

class MyService {
  Future<void> insertNumber({required String number}) async {
    String urlAPI =
        'https://www.androidthai.in.th/fluttertraining/insertNumberMon.php?isAdd=true&number=$number';
    await Dio().get(urlAPI).then((value) => print('Insert number Success'));
  }
}
