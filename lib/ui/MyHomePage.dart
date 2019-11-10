import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bloc/news_blac.dart';
import 'package:news_app/model/articles.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/ui/full_news.dart';

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
        top: 8.0,
        bottom: 8.0,
      ),
      itemBuilder: (context, index) {
        return index != 0
            ? _ListViewItemBuilder(news: newsList[index])
            : _BuildTopNews(news: newsList[index]);
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: newsList.length,
    );
  }
}

class _BuildTopNews extends StatelessWidget {
  final News news;

  const _BuildTopNews({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsCard(
      news: news,
    );
  }
}

class _ListViewItemBuilder extends StatelessWidget {
  final News news;

  const _ListViewItemBuilder({Key key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AllNewsCard(news: news);
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    @required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.0,
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullNews(),
              settings: RouteSettings(arguments: news),
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 4.0,
              right: 4.0,
              child: Card(
                margin: EdgeInsets.all(0.0),
                elevation: 4.0,
                borderOnForeground: true,
                child: news.urlToImage != null
                    ? Image.network(
                        news.urlToImage,
                        fit: BoxFit.cover,
                        height: 240.0,
                        repeat: ImageRepeat.noRepeat,
                      )
                    : Container(),
              ),
            ),
            Positioned(
              top: 180.0,
              left: 4.0,
              right: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  news.title,
                  maxLines: 2,
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
      ),
    );
  }
}

class AllNewsCard extends StatelessWidget {
  const AllNewsCard({
    Key key,
    @required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullNews(),
              settings: RouteSettings(arguments: news),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  news.title,
                  maxLines: 2,
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
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  news.urlToImage,
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
