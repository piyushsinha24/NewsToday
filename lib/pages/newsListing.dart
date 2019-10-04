import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/bloc/news_listing_bloc.dart';
import 'package:news_app/bloc/news_listing_states.dart';
import 'package:news_app/models/api_model.dart';
import 'package:news_app/pages/newsDetails.dart';
import 'package:news_app/widgets/message.dart';

class NewsListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<NewsListingBloc>(context),
      builder: (context, state) {
        if (state is NewsUninitializedState) {
          return Message(message: "Select a category");
        } else if (state is NewsEmptyState) {
          return Message(message: "No News found");
        } else if (state is NewsErrorState) {
          return Message(message: "Something went wrong");
        } else if (state is NewsFetchingState) {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        } else {
          final stateAsNewsFetchedState = state as NewsFetchedState;
          final articles = stateAsNewsFetchedState.articles;
          return buildNewsList(articles);
        }
      },
    );
  }

  Widget buildNewsList(List<Articles> articles) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, index) {
          Articles article = articles[index];
          return Container(
            color: Colors.white30,
            child: GestureDetector(
              child: ListTile(
                leading: CircleAvatar(
                  child: article.urlToImage!=null?
                          article.urlToImage.contains('https') ||
                          article.urlToImage.contains('file://')
                      ? Image.network(article.urlToImage)
                      : Icon(FontAwesomeIcons.newspaper):Icon(FontAwesomeIcons.newspaper),
                  radius: 30.0,
                  backgroundColor: Colors.indigo[50],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: AutoSizeText(
                    article.title,
                    maxLines: 2,
                    minFontSize: 18,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                subtitle: Text(
                  article.source.name,
                  style: TextStyle(fontSize: 16.0, color: Colors.black54),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsDetails(article)));
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            height: 8.0,
            color: Colors.transparent,
          );
        },
        itemCount: articles.length,
      ),
    );
  }
}
