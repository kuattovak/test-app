import 'package:firebase_authorization/pages/home/data/repository/repositories.dart';
import 'package:firebase_authorization/pages/home/views/bloc/news_event.dart';
import 'package:firebase_authorization/pages/home/views/bloc/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;

  NewsBloc(this._newsRepository) : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final article = await _newsRepository.fetchNews();
        emit(NewsLoadedState(article));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}
