import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_news_state.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit() : super(SearchNewsInitial());
}
