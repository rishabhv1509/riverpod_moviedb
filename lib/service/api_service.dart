import 'package:dio/dio.dart';

class ApiService {
  String apiKey = '9e9d99a2';
  String baseUrl = 'https://www.omdbapi.com/';
  getMovieData(String movie) async {
    try {
      var result = await Dio()
          .get(baseUrl, queryParameters: {'t': movie, 'apikey': apiKey});
      return result.data;
    } catch (e) {
      print('ERROR IN FETCHING MOVIE DATA : $e');
    }
  }
}
