import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/ui/providers/customersList.dart';

class NewCustomer extends StatefulWidget {
  final CustomerList customerList;

  const NewCustomer({
    Key key,
    this.customerList,
  }) : super(key: key);

  @override
  _NewCustomerState createState() {
    return _NewCustomerState();
  }
}

  class _NewCustomerState extends State<NewCustomer>{

  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  String _name;
  String _age;

  final _nameController = TextEditingController(text: "");
  final _ageController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Customer"),
      ),
      body: _buildBody(),
    );
  }

 Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Form(
            key: this._formStateKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                  onSaved: (value){
                    _name = value;
                  },
                  controller: this._nameController,
                  decoration: InputDecoration(
                    focusedBorder:UnderlineInputBorder(
                      borderSide:BorderSide(
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    labelText: "Customer Name",
                    icon: Icon(Icons.account_box,color: Colors.green,),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  ),
                ),Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: TextFormField(
                    onSaved: (value) {
                      _age = value;
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    controller: _ageController,
                    decoration: InputDecoration(
                      focusedBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors.green,
                              width: 2,
                              style: BorderStyle.solid)),
                      labelText: "Age",
                      icon: Icon(
                        Icons.phone_android,
                        color: Colors.green,
                      ),
                      fillColor: Colors.white,
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text(
                  ('SAVE'),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _formStateKey.currentState.save();
                  // widget : is used to access property of parent stateful class
                  widget.customerList.addCustomer(
                      Customer(name: _name, age: int.parse(_age)));
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
 }

  }

