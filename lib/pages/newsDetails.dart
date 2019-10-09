import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/api_model.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsDetails extends StatefulWidget {
  final Articles article;
  NewsDetails(this.article);
  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(0.0),
              bottomRight: const Radius.circular(48.0)),
                          child: widget.article.urlToImage!=null? Container(
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:CachedNetworkImageProvider(widget.article.urlToImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ):Container(
                height: MediaQuery.of(context).size.height/2,
                color: Colors.indigo[900],
                child: Center(
                  child: Text("No Image Found",style: TextStyle(color: Colors.white),),
                ),
              )
            ),
            Container(
              color: Colors.white,
              child: Padding(
            padding: const EdgeInsets.only(top:5.0,bottom:5.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    widget.article.title,
                    //maxLines: 2,
                    minFontSize: 22.0,
                    style: TextStyle(color: Colors.black),
                  ),),
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    widget.article.description==null?"":widget.article.description,
                    minFontSize: 16.0,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AutoSizeText(
                    widget.article.content==null?"":widget.article.content,
                    minFontSize: 16.0,
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.newspaper,color: Colors.indigo[900],),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: AutoSizeText(
                            widget.article.url==null?"":widget.article.source.name,
                            minFontSize: 18.0,
                            style: TextStyle(color: Colors.indigo[900]),
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      _launchURL(widget.article.url);
                    },
                  ),
                ),
              ],
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
