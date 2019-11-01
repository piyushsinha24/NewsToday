import 'package:news_app/models/api_model.dart';
import 'package:news_app/services/news_provider.dart';

class NewsRepository {
  NewsApiProvider _newsApiProvider = NewsApiProvider();

  Future<List<Articles>> fetchHeadlines() =>
      _newsApiProvider.fetchHeadlines();
  Future<List<Articles>> fetchHeadlinesByCategory(String category) =>
      _newsApiProvider.fetchHeadlinesByCategory(category);
}