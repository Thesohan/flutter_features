import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_blac.dart';
import 'package:news_app/model/articles.dart';
import 'package:news_app/model/news.dart';

class MyHomePage extends StatelessWidget {
  final title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsBloc newsBloc = NewsBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SafeArea(child: _buildBody(newsBloc)),
    );
  }
}

Widget _buildBody(NewsBloc newsBloc) {
  return StreamBuilder<Articles>(
    stream: newsBloc.articleStream,
    builder: (context, snapshot) {
      return snapshot.data != null
          ? NewsList(
              newsList: snapshot.data.articles,
            )
          : Text("no data");
    },
  );
}

class NewsList extends StatelessWidget {
  final List<News> newsList;

  const NewsList({Key key, this.newsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(0.0).copyWith(
          top: 4.0,
          bottom: 4.0,
        ),
        itemBuilder: (context, index) {
          return _ListViewItemBuilder(news: newsList[index]);
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: newsList.length);
  }
}

class _ListViewItemBuilder extends StatelessWidget {
  final News news;

  const _ListViewItemBuilder({Key key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String urlToImage = news.urlToImage;
    return Container(
      height: 196.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 4.0,
            right: 4.0,
            child: Card(
              margin: EdgeInsets.all(0.0),
              elevation: 4.0,
              borderOnForeground: true,
              child: urlToImage != null
                  ? Image.network(
                      news.urlToImage,
                      fit: BoxFit.cover,
                      height: 196.0,
                      repeat: ImageRepeat.noRepeat,
                    )
                  : Container(),
            ),
          ),
          Positioned(
            top: 140.0,
            left: 4.0,
            right: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.title,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white70,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
