import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:sunray_news/app/service/api_service.dart';

import '../../../model/news_model.dart';

part 'search_news_state.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit() : super(SearchNewsState(articles: [], loading: false));

  void search({
    required String query,
  }) async {
    emit(state.copyWith(loading: true));
    List<NewsModel>? r = await APIService.instance.searchNews(query);
    emit(state.copyWith(articles: r, loading: false));
  }
}
