import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'src/time_service.dart';
import 'src/route_paths.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="RoutePaths.dashboard.toUrl()"
         [routerLinkActive]="'active'">Dashboard</a>
      <a [routerLink]="RoutePaths.times.toUrl()"
         [routerLinkActive]="'active'">Times</a>
    </nav>
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  styleUrls: ['app_component.css'],
  directives: [routerDirectives],
  providers: [ClassProvider(TimeService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'Sistema de cadastro de times de futebol';
}