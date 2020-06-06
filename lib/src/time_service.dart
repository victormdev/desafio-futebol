import 'time.dart';
import 'mock_times.dart';

class TimeService {
  // List<Time> getAll() => mockTimes;
  Future<List<Time>> getAll() async => mockTimes;

}