import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/time.dart';
import 'src/mock_times.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, formDirectives],
)
class AppComponent {
  final title = 'Sistema de cadastro de times de futebol';
  List<Time> times = mockTimes;
  Time time = Time('São Paulo', 'Corinthians', 1910);
}
