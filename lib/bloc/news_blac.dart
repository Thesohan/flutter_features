import 'dart:async';
import 'package:news_app/bloc/bloc.dart';
import 'package:news_app/model/articles.dart';
import 'package:news_app/repository/repository.dart';

class NewsBloc extends Bloc{
  final repository = Repository();

  StreamController<Articles>  _articlesStreamController=  StreamController<Articles>();
  Stream<Articles> get articleStream => _articlesStreamController.stream;

  NewsBloc(){
    fetchAllNews();
  }

  @override
  void dispose() {
    _articlesStreamController.close();
  }


  fetchAllNews() async{
    Articles articles = await repository.fetchAllNews();
    _articlesStreamController.add(articles);
  }

}