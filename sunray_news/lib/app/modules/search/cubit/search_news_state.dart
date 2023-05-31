part of 'search_news_cubit.dart';

class SearchNewsState extends Equatable {
  final List<NewsModel> articles;
  final bool loading;

  SearchNewsState({
    required this.articles,
    required this.loading,
  });

  SearchNewsState copyWith({
    List<NewsModel>? articles,
    bool? loading,
  }) {
    return SearchNewsState(
        articles: articles ?? this.articles, loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [articles, loading];
}
