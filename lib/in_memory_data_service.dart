import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'src/time.dart';

class InMemoryDataService extends MockClient {
  static final _initialTimes = [
    {1, 'Bahia', 'Bahia de Feira', 1888},
    {2, 'São Paulo', 'Santos', 2000},
    {3, 'São Paulo', 'Palmeiras', 2000},
    {4, 'Bahia', 'Vitória', 2000},
    {5, 'São Paulo', 'Corinthins', 1910}
  ];
  
  static List<Time> _timesDb;
  static int _nextId;
  static Future<Response> _handler(Request request) async {
    if (_timesDb == null) resetDb();
    var data;
    switch (request.method) {
      case 'GET':
        final id = int.tryParse(request.url.pathSegments.last);
        if (id != null) {
          data = _timesDb
              .firstWhere((time) => time.id == id); // throws if no match
        } else {
          String prefix = request.url.queryParameters['name'] ?? '';
          final regExp = RegExp(prefix, caseSensitive: false);
          data = _timesDb.where((time) => time.nome.contains(regExp)).toList();
        }
        break;
      case 'POST':
        var nome = json.decode(request.body)['nome'];
        var estado = json.decode(request.body)['estado'];
        var ano = json.decode(request.body)['ano'];
        var newTime = Time(_nextId++, estado, nome, ano );
        _timesDb.add(newTime);
        data = newTime;
        break;
      case 'PUT':
        var timeChanges = Time.fromJson(json.decode(request.body));
        var targetTime = _timesDb.firstWhere((h) => h.id == timeChanges.id);
        targetTime.nome = timeChanges.nome;
        data = targetTime;
        break;
      case 'DELETE':
        var id = int.parse(request.url.pathSegments.last);
        _timesDb.removeWhere((time) => time.id == id);
        // No data, so leave it as null.
        break;
      default:
        throw 'Unimplemented HTTP method ${request.method}';
    }
    return Response(json.encode({'data': data}), 200,
        headers: {'content-type': 'application/json'});
  }
  static resetDb() {
    // _timesDb = _initialTimes.map((json) => Time.fromJson(json)).toList();
    _nextId = _timesDb.map((time) => time.id).fold(0, max) + 1;
  }
  static String lookUpName(int id) =>
      _timesDb.firstWhere((time) => time.id == id, orElse: null)?.nome;
  InMemoryDataService() : super(_handler);
}