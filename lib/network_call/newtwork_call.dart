import 'package:dio/dio.dart';
import 'package:news_app/model/articles.dart';

class NetworkCall{

 Future<Articles>  fetchAllNews()async{
    try{
      Response response = await Dio().get("https://newsapi.org/v2/top-headlines?country=in&apiKey=eb1b6923ed7f413aa31dc9ab9a52647d");
      Articles art = Articles.fromJson(response.data);
      return art;
    }
    catch(exception){
      return null;
    }
  }
}
