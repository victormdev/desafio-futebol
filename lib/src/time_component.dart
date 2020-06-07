import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'time.dart';
import 'time_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-time',
  templateUrl: 'time_component.html',
  styleUrls: ['time_component.css'],
  directives: [coreDirectives, formDirectives],
)
class TimeComponent implements OnActivate {
  Time time;
  final TimeService _timeService;
  final Location _location;

  TimeComponent(this._timeService, this._location);

  // retorna um time pelo ID
  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) time = await (_timeService.get(id));
  }

  // atualiza um time já existente
  Future<void> save() async {
      await _timeService.update(time);
      goBack();
    }

  // apaga um time
  Future<void> delete() async {
      await _timeService.delete(time.id);
      goBack();
    }

  void goBack() => _location.back();
}