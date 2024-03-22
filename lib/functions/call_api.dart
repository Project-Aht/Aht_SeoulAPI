import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class API extends GetxController {
  List<Map<String, String>> schools = [];
  bool loading = true;

  Future<void> callAPI() async {
    for (int index = 1; index <= 13; index++) {
      var url = Uri.parse(
        'https://open.neis.go.kr/hub/schoolInfo?KEY=cd3d82c9b70b4de3a1591e48d6507ea2&Type=json&pSize=1000&pIndex=$index',
      );
      var response = await http.get(url);
      List arr = jsonDecode(response.body)['schoolInfo'][1]['row'];

      for (var schoolData in arr) {
        String name = schoolData['SCHUL_NM'];
        String address = schoolData['ORG_RDNMA'] ?? '';
        int maxGrade = (schoolData['SCHUL_KND_SC_NM'] == '초등학교') ? 6 : 3;
        schools.add({
          'name': name,
          'address': address,
          'maxGrade': '$maxGrade',
        });
      }
    }
    print('api loaded');
    loading = false;
    update();
  }

  void clear() {
    schools.clear();
  }
}
