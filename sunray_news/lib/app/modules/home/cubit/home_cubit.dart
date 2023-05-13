import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sunray_news/app/model/news_model.dart';

import '../../../service/api_service.dart';

part 'home_state.dart';

APIService service = APIService.instance;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(news: [], loading: true));

  void getNews({String? category}) async {
    List<NewsModel> news = await service.getNewsForTopHeadline(country: 'us');
    print('getNews working ${news.map((e) => e.urlToImg).toList()}');
    emit(state.copyWith(
      news: await service.getNewsForTopHeadline(country: 'us'),
      loading: false,
    ));
  }
}
