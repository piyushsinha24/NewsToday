import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/bloc/news_listing_bloc.dart';
import 'package:news_app/bloc/news_listing_event.dart';
import 'package:news_app/pages/newsListing.dart';
import 'package:news_app/services/repository.dart';
import 'package:news_app/widgets/categoryBox.dart';

class HomePage extends StatefulWidget {
  final NewsRepository repository;

  HomePage({this.repository});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsListingBloc _newsListingBloc;

  @override
  void initState() {
    super.initState();
    _newsListingBloc = NewsListingBloc(newsRepository: widget.repository);
    _newsListingBloc.dispatch(CategorySelectedEvent(category: 'General'));
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> category = [
    'General',
    'Sports',
    'Technology',
    'Health',
    'Entertainment',
    'Business',
    'Science'
  ];
  List<IconData> icon = [
    FontAwesomeIcons.globe,
    FontAwesomeIcons.basketballBall,
    FontAwesomeIcons.satellite,
    FontAwesomeIcons.heartbeat,
    FontAwesomeIcons.theaterMasks,
    FontAwesomeIcons.chartBar,
    FontAwesomeIcons.microscope
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) => _newsListingBloc,
      child: Scaffold(
        backgroundColor: Colors.indigo[900],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text("NewsToday"),
          bottom: PreferredSize(
            child: Container(
                width: double.infinity,
                height: 120.0,
                child: new ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryBox(category[index], Icon(icon[index]));
                    })),
            preferredSize: Size(0.0, 120.0),
          ),
        ),
        body: ClipRRect(
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(0.0),
              topRight: const Radius.circular(48.0)),
          child: Container(
            color: Colors.white,
            height: 800.0,
            child: Column(
              children: <Widget>[
                NewsListing(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
