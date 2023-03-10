import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CleanArcApp extends StatelessWidget {
  const CleanArcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Arc${!isMobile ? ' ${platformName()}' : ''}',
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
        debugShowCheckedModeBanner: false,
        home: Container()
    );
  }
}
