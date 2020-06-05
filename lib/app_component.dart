import 'package:angular/angular.dart';
import 'time.dart';

@Component(
  selector: 'my-app',
  template: '''
  <h1>{{title}}</h1>
  <h2>{{time}}</h2>
  ''',
)
class AppComponent {
  final title = 'Sistema de cadastro de times de futebol';
  Time time = Time(1, 'Windstorm');
}
