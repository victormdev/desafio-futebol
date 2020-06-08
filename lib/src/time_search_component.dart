import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';
import 'route_paths.dart';
import 'time_search_service.dart';
import 'time.dart';

@Component(
  selector: 'time-search',
  templateUrl: 'time_search_component.html',
  styleUrls: ['time_search_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(TimeSearchService)],
  pipes: [commonPipes],
)
class TimeSearchComponent implements OnInit {
  TimeSearchService _timeSearchService;
  Router _router;

 Stream<List<Time>> times;
 StreamController<String> _searchTerms = StreamController<String>.broadcast();

 TimeSearchComponent(this._timeSearchService, this._router) {}

 void search(String term) => _searchTerms.add(term);

 void ngOnInit() async {
   times = _searchTerms.stream
       .transform(debounce(Duration(milliseconds: 300)))
       .distinct()
       .transform(switchMap((term) => term.isEmpty
           ? Stream<List<Time>>.fromIterable([<Time>[]])
           : _timeSearchService.search(term).asStream()))
       .handleError((e) {
     print(e); // for demo purposes only
   });
 }

 String _timeUrl(int id) =>
     RoutePaths.time.toUrl(parameters: {idParam: '$id'});

// detalhes do time
 Future<NavigationResult> gotoDetail(Time time) =>
    _router.navigate(_timeUrl(time.id));
}