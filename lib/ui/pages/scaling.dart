import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/Util/sizeConfig.dart';

class Scaling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaling"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildWidgetWithoutScaling(),
        SizedBox(
          height: SizeConfig.blockSizeVertical*10,
        ),
        _buildWidgetWithScaling()
      ],
    );
  }

  Widget _buildWidgetWithoutScaling() {
    return Center(
      child: Container(
        height: 40.0,
        width: 40.0,
        color: Colors.green,
      ),
    );
  }

  Widget _buildWidgetWithScaling() {
    return Center(
      child: Container(
        height: SizeConfig.blockSizeVertical*40,
        width: SizeConfig.blockSizeHorizontal*40.0,
        color: Colors.green,
      ),
    );
  }
}