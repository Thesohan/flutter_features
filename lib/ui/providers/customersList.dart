import 'package:flutter/cupertino.dart';

class CustomerList with ChangeNotifier {
  CustomerList({this.customers});

  final List<Customer> customers;

  getCustomers() => customers;

  void addCustomer(Customer customer) {
    customers.add(customer);
  notifyListeners();
  }
  void removeCustomer(int index) {
    customers.removeAt(index);
    notifyListeners();
  }
}

class Customer {
 final String name;
 final int age;
  Customer({
    this.name,
    this.age,
  });
}
