import 'package:flutter/material.dart';
import 'package:haidar_website/core/di/injection.dart';

import 'core/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies
  await configureDependencies();
  
  runApp(const App());
}