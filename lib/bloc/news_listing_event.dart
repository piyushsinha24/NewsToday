import 'package:flutter/material.dart';

abstract class NewsListingEvent{}

class CategorySelectedEvent extends NewsListingEvent {
  final String category;

  CategorySelectedEvent({@required this.category}) : assert(category != null);
}