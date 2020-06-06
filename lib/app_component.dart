import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/time.dart';
import 'src/mock_times.dart';
import 'src/time_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  providers: [ClassProvider(TimeService)],
  directives: [coreDirectives, formDirectives],
)
class AppComponent {
  final title = 'Sistema de cadastro de times de futebol';
  List<Time> times = mockTimes;
  Time time = Time(1, 'São Paulo', 'Corinthians', 1910);
  final TimeService _timeService;
  AppComponent(this._timeService);

  Future<void> _getTimes() async {
  times = await _timeService.getAll();
  }
}
