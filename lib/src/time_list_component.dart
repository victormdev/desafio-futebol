import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'time.dart';
import 'time_service.dart';

@Component(
  selector: 'my-times',
  templateUrl: 'time_list_component.html',
  styleUrls: ['time_list_component.css'],
  directives: [coreDirectives],
  pipes: [commonPipes],
)
class TimeListComponent implements OnInit {
  final TimeService _timeService;
  final Router _router;
  List<Time> times;
  Time selected;

  TimeListComponent(this._timeService, this._router);

  // retorna todos os times
  Future<void> _getTimes() async {
    times = await _timeService.getAll();
  }
  // cadastra um novo time
  Future<void> add(String estado, String nome, ano) async {
  nome = nome.trim();
  estado = estado.trim();
  if (nome.isEmpty) return null;
  if (estado.isEmpty) return null;
  if (ano == "") return null;
  times.add(await _timeService.create(estado, nome, ano));
  selected = null;
}
  void ngOnInit() => _getTimes();

  void onSelect(Time time) => selected = time;

  String _timeUrl(int id) =>
      RoutePaths.time.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_timeUrl(selected.id));
}