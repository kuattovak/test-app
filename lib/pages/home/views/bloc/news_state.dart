import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../../data/models/news_model.dart';

@immutable
abstract class NewsState extends Equatable {}

//data loading state
class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  final List<ArticleModel> article;
  NewsLoadedState(this.article);
  @override
  List<Object?> get props => [article];
}

class NewsErrorState extends NewsState {
  final String error;
  NewsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
