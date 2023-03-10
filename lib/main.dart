import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'core/config.dart';
import 'injector.dart' as di;
import 'app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialize(aLocaleLanguageList: languageList());
  defaultToastGravityGlobal = ToastGravity.BOTTOM;
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(CleanArcApp());
}
