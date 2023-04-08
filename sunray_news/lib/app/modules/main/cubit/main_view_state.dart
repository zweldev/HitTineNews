// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_view_cubit.dart';

class MainViewState extends Equatable {
  const MainViewState({
    required this.currentPageIndex,
  });

  final int currentPageIndex;

  @override
  List<Object> get props => [currentPageIndex];

  MainViewState copyWith({
    int? currentPageIndex,
  }) {
    return MainViewState(
        currentPageIndex: currentPageIndex ?? this.currentPageIndex);
  }
}
