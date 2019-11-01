import 'package:flutter/material.dart';
import 'package:news_app/services/repository.dart';
//pages import
import './pages/home.dart';
void main(){
  NewsRepository _repository=NewsRepository();
   runApp(MyApp(repository:_repository));
   }

class MyApp extends StatelessWidget {
  final NewsRepository repository;
  MyApp({this.repository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsToday',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(repository:repository),
    );
  }
}

