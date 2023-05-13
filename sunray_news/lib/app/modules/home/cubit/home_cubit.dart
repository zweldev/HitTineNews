import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sunray_news/app/model/news_model.dart';

import '../../../service/api_service.dart';

part 'home_state.dart';

APIService service = APIService.instance;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(news: [], loading: true));

  void getNews({String? category}) async {
    var data = await service.getNews(category: category, country: 'us');
      if (data.isNotEmpty) {
        emit(state.copyWith(news: data, loading: false));
      }
  }

  void refresh() {
    state.news?.clear();
    getNews();
  }
}
