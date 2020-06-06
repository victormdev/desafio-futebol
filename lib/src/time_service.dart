import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'time.dart';

class TimeService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _timesUrl = 'api/times'; // URL to web API

  final Client _http;

  TimeService(this._http);

  // retorna todos os times cadastrados
  Future<List<Time>> getAll() async {
    try {
      final response = await _http.get(_timesUrl);
      final times = (_extractData(response) as List)
          .map((json) => Time.fromJson(json))
          .toList();
      return times;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
 }

 // retornar um time pelo seu ID
 Future<Time> get(int id) async {
   try {
     final response = await _http.get('$_timesUrl/$id');
     return Time.fromJson(_extractData(response));
   } catch (e) {
     throw _handleError(e);
   }
 }

  // cadastrar um time
  Future<Time> create(String nome) async {
    try {
      final response = await _http.post(_timesUrl,
          headers: _headers, body: json.encode({'nome': nome}));
      return Time.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  // atualizar um time
  Future<Time> update(Time time) async {
    try {
      final url = '$_timesUrl/${time.id}';
      final response =
          await _http.put(url, headers: _headers, body: json.encode(time));
      return Time.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  // apagar um time pelo ID
  Future<void> delete(int id) async {
    try {
      final url = '$_timesUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }

}