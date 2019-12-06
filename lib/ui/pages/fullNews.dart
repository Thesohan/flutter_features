import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/ui/common/launch_url.dart';

class FullNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final News news = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: _buildBody(context, news),

    );
  }

  Widget _buildBody(BuildContext context, News news) {
    return Column(
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    news.urlToImage,
                    fit: BoxFit.cover,
                    height: 296.0,
                    repeat: ImageRepeat.noRepeat,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      news.title,
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            backgroundColor: Colors.white70,
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0).copyWith(top: 8),
                    child: Text(
                      news.description,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.subhead.copyWith(
                            fontSize: 16.0,
                            backgroundColor: Colors.white70,
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(top: 4.0, bottom: 8.0),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.share,
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.save,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        LaunchUrl(url: news.url,text: "See Full news here",)
      ],

    );
  }
}
