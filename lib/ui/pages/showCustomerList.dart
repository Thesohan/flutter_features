import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/providers/customersList.dart';
import 'package:provider/provider.dart';

import 'newCustomer.dart';

class ShowCustomerList extends StatefulWidget {
  ShowCustomerList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ShowCustomerListState createState() => _ShowCustomerListState();
}

class _ShowCustomerListState extends State<ShowCustomerList> {
  @override
  Widget build(BuildContext context) {
    // this is how you can access object of the customer list class
    // there are 2 ways you can access 1.Provider and 2. Consumer(We will look in another article)
    final customerList = Provider.of<CustomerList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: customerList.getCustomers().length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${customerList.getCustomers()[index].name}'),
            subtitle: Text('${customerList.getCustomers()[index].age}'),
            trailing: Container(
              width: 50,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // removed customer
                      customerList.removeCustomer(index);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigated to new customer page and passed object of CustomerList so that page can change data of customer list.
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewCustomer(customerList: customerList)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}