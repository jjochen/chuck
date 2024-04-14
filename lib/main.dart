import 'package:chuck/app/chuck_app.dart';
import 'package:chuck/app/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator.setup();
  runApp(const ChuckApp());
}
