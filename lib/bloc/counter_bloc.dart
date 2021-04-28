import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter = 0;

  final _countSubject = BehaviorSubject.seeded(0); // 마지막으로 들어온 값만 보여줌, stream을 지원함.

  void addCounter() {
    _counter++;
    _countSubject.add(_counter);
  }

  Stream<int> get count$ => _countSubject.stream; // countSubject의 값을 요청하면 count의 stream 값을 준다.
}