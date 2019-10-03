import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';

class AppBloc extends BlocBase {
  BehaviorSubject _pages = BehaviorSubject<int>.seeded(1);

  Stream get outPages => _pages.stream;

  void moveToDirect() {
    print("Move direct");
    _pages.sink.add(2);
  }

  void moveToFeed() {
    print("Move feed");
    _pages.sink.add(1);
  }

  void moveToCamera() {
    print("Move camera");
    _pages.sink.add(0);
  }

  @override
  void dispose() {
    _pages.close();
    super.dispose();
  }
}
