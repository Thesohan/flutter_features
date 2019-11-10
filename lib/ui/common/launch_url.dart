import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrl extends StatelessWidget{
  final String url;
  final String text;
  const LaunchUrl({Key key, this.url, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        this.text,
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      onTap: _launchUrl,
    );
  }

  void _launchUrl()async{
    if(await canLaunch(this.url)){
      await launch(this.url);
    }
    else{
      throw "Couldn't launch ${this.url}";
    }
  }

}