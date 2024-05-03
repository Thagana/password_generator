import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  // BehaviorSubject
  final _selectedIndexController = BehaviorSubject<int>.seeded(1);


  Stream<int> get selectIndexStream {
    return _selectedIndexController.stream;
  }

  void updateSelectedIndex(int index) {
    _selectedIndexController.sink.add(index);
  }

  @override
  Future<void> close () async {
    await _selectedIndexController.close();
  }

}
