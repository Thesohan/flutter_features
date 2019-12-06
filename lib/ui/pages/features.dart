import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/pages/newCustomer.dart';
import 'package:news_app/ui/pages/showCustomerList.dart';
import 'package:news_app/ui/providers/customersList.dart';
import 'package:provider/provider.dart';

import 'MyHomePage.dart';

class Features extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Features"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(32.0),
        shrinkWrap: true,
        primary: true,
        children: <Widget>[
          RaisedButton(
            child: Text("News"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'My News'),
                ),
              );
            },
          ),
          RaisedButton(
            child: Text("Providers Example"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    builder: (_) => CustomerList(
                      customers: [
                        Customer(name: "Sohan", age: 22),
                      ],
                    ),
                    child: ShowCustomerList(title: "Customer List",),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
