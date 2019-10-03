import 'package:flutter/material.dart';
import 'package:news_app/models/api_model.dart';

abstract class NewsListingState {}

class NewsUninitializedState extends NewsListingState {}

class NewsFetchingState extends NewsListingState {}

class NewsFetchedState extends NewsListingState {
  final List<Articles> articles;
  NewsFetchedState({@required this.articles});
}

class NewsErrorState extends NewsListingState {}

class NewsEmptyState extends NewsListingState {}