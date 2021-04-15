import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiCall {
  String apiKey = '9e9d99a2';
  String baseUrl = 'https://www.omdbapi.com/';
  Future getMovieData(String movie) async {
    try {
      Response result = await Dio()
          .get(baseUrl, queryParameters: {'t': movie, 'apikey': apiKey});
      return result.data;
    } catch (e) {
      print('ERROR IN FETCHING MOVIE DATA : $e');
    }
  }
}

final apiCallProvider = Provider<ApiCall>((ref) => ApiCall());
