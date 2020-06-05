import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'time.dart';

@Component(
  selector: 'my-app',
  template: '''
  <h1>{{title}}</h1>
  <h2>{{time.name}}</h2>
  <div><label>id: </label>{{time.id}}</div>
  <div><label>name: </label>{{time.name}}</div>
  <div><label>ano: </label>{{time.ano}}</div>
  <div>
    <label>name: </label>
    <input [(ngModel)]="time.name" placeholder="Digite o nome do time aqui">
  </div>
  ''',
  directives: [formDirectives],
)
class AppComponent {
  final title = 'Sistema de cadastro de times de futebol';
  Time time = Time(1, 'Corinthians', 1910);
}
