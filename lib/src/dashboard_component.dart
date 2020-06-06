  
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'time.dart';
import 'time_service.dart';
import 'time_search_component.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [coreDirectives, TimeSearchComponent, routerDirectives],
)
class DashboardComponent implements OnInit {
  List<Time> times;

  final TimeService _timeService;

  DashboardComponent(this._timeService);

  String timeUrl(int id) => RoutePaths.time.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    times = (await _timeService.getAll()).skip(1).take(4).toList();
  }
}