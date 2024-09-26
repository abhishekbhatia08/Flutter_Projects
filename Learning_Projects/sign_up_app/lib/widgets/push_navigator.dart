import 'package:flutter/material.dart';

void pushNavigator(context, router) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => router)));
}
