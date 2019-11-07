import 'package:news_app/model/articles.dart';
import 'package:news_app/network_call/newtwork_call.dart';

class Repository {
  final NetworkCall networkCall = NetworkCall();
  Future<Articles> fetchAllNews() => networkCall.fetchAllNews();
}
