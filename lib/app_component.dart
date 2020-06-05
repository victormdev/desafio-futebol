import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/time.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [formDirectives],
)
class AppComponent {
  final title = 'Sistema de cadastro de times de futebol';
  Time time = Time(1, 'Corinthians', 1910);
}
