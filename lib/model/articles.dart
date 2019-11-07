import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/model/news.dart';
part 'articles.g.dart';


@JsonSerializable()
class Articles {
  final List<News> articles;

  Articles({this.articles});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}
