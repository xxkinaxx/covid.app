import 'dart:convert';
import 'package:api_covid/config/config.dart';
import 'package:api_covid/model/hoaxes.dart';
import 'package:api_covid/model/hospital.dart';
import 'package:api_covid/model/news.dart';
import 'package:api_covid/model/stats.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<List<Hoaxes>?> getHoaxes() async{
    var url = Uri.parse('${baseurl}hoaxes');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if(response.statusCode == 200){
      List<dynamic> jsonResponse =jsonDecode(response.body);
      return jsonResponse.map((hoax) => Hoaxes.fromJson(hoax)).toList();
    } else {
      print('Request gagal, status: ${response.statusCode}');
      return null;
    }
  }
  Future<List<Hospitals>?> getHospitals() async{
    var url = Uri.parse('${baseurl}hospitals');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if(response.statusCode == 200){
      List<dynamic> jsonResponse =jsonDecode(response.body);
      return jsonResponse.map((hospital) => Hospitals.fromJson(hospital)).toList();
    } else {
      print('Request gagal, status: ${response.statusCode}');
      return null;
    }
  }
  Future<List<News>?> getNews() async{
    var url = Uri.parse('${baseurl}news');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if(response.statusCode == 200){
      List<dynamic> jsonResponse =jsonDecode(response.body);
      return jsonResponse.map((news) => News.fromJson(news)).toList();
    } else {
      print('Request gagal, status: ${response.statusCode}');
      return null;
    }
  }

  Future<List<Stats>?> getStats() async{
    var url = Uri.parse('${baseurl}stats');
    print(url);

    var response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      final List<dynamic> regions = data['regions'];

      List<Stats> statsList = regions.map((region) => Stats.fromJson(region)).toList();

      return statsList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}