import 'package:flutter/material.dart';

class RequestClass{
  String name;
  int mobile;
  String description;
  DateTime date;
  String status;
  double amount;

  RequestClass({
    @required this.name,
    @required this.mobile,
    @required this.description,
    @required this.date,
    @required this.status,
    this.amount,
  });
}