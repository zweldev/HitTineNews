import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sunray_news/app/model/news_model.dart';

import '../../../service/api_service.dart';

part 'home_state.dart';

APIService service = APIService.instance;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(loading: true));

  void getNews({String? category, bool loading = true}) async {
    if (loading || state.news == null) {
      emit(state.copyWith(loading: true));

      var data = await service.getNews(category: category);
      if (data.isNotEmpty) {
        emit(state.copyWith(news: data));
      }

      emit(state.copyWith(loading: false));

    }
  }

}
