import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewState(currentPageIndex: 0));

  void onPageChange(int index) {
    emit(state.copyWith(currentPageIndex: index));
  }
}
