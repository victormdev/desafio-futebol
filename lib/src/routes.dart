import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'dashboard_component.template.dart' as dashboard_template;
import 'time_component.template.dart' as time_template;
import 'time_list_component.template.dart' as time_list_template;

export 'route_paths.dart';

class Routes {
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final time = RouteDefinition(
    routePath: RoutePaths.time,
    component: time_template.TimeComponentNgFactory,
  );

  static final times = RouteDefinition(
    routePath: RoutePaths.times,
    component: time_list_template.TimeListComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    dashboard,
    time,
    times,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}