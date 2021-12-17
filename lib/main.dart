import 'package:flutter/material.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:my_app/app_widget.dart';
import 'core/shared_modules/cache/cache_module.dart';

void main() {
  initModule(CacheModule());
  runApp(AppWidget());
}