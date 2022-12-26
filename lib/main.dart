import 'package:flutter/material.dart';

import 'app/MyApp.dart';
import 'app/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  initAppModule();
  runApp(MyApp());
}
