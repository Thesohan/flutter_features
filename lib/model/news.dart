import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/model/source.dart';
part 'news.g.dart';

@JsonSerializable()
class News {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory News.fromJson(Map<String,dynamic>json)=> _$NewsFromJson(json);

  Map<String,dynamic> toJson()=> _$NewsToJson(this);

}
