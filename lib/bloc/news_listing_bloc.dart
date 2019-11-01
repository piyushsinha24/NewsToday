import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/news_listing_event.dart';
import 'package:news_app/bloc/news_listing_states.dart';
import 'package:news_app/models/api_model.dart';
import 'package:news_app/services/repository.dart';
class NewsListingBloc extends Bloc<NewsListingEvent,NewsListingState>{
  final NewsRepository newsRepository;
  NewsListingBloc({this.newsRepository}) : assert(newsRepository != null);

  @override
  NewsListingState get initialState => NewsUninitializedState();

  @override
  Stream<NewsListingState> mapEventToState(NewsListingEvent event)async* {
    yield NewsFetchingState();
    List<Articles>articles;
    try{
    if(event is CategorySelectedEvent)
      articles = await newsRepository.fetchHeadlinesByCategory(event.category);
    if(articles.length==0)
      yield NewsEmptyState();
    else
      yield NewsFetchedState(articles: articles);
    }catch(_){
      yield NewsErrorState();
    }
  }
  
}