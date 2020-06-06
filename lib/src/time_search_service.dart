import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'time.dart';

class TimeSearchService {
  final Client _http;

  TimeSearchService(this._http);

  Future<List<Time>> search(String term) async {
    try {
      final response = await _http.get('app/times/?nome=$term');
      return (_extractData(response) as List)
          .map((json) => Time.fromJson(json))
          .toList();
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
}