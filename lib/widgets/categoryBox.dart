import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_listing_bloc.dart';
import 'package:news_app/bloc/news_listing_event.dart';

class CategoryBox extends StatefulWidget {
  final String title;
  final Icon icon;
  CategoryBox(this.title, this.icon);

  @override
  _CategoryBoxState createState() => _CategoryBoxState();
}

class _CategoryBoxState extends State<CategoryBox> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      highlightElevation: 1.0,
      onPressed: () {
        BlocProvider.of<NewsListingBloc>(context).dispatch(
            CategorySelectedEvent(
                category: widget.title != 'General'
                    ? widget.title.toLowerCase()
                    : ""));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.transparent,
      textColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.icon,
          SizedBox(height: 5.0),
          AutoSizeText(
            widget.title,
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 2,
            wrapWords: false,
          ),
        ],
      ),
    );
  }
}
