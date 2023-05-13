// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({this.news , required this.loading});

  final List<NewsModel>? news;
  final bool loading;

  @override
  List<Object> get props => [];

  HomeState copyWith({
    List<NewsModel>? news,
    bool? loading,
  }) {
    return HomeState(
      news: news ?? this.news,
      loading: loading ?? this.loading,
    );
  }
}
