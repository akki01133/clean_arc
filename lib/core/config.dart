import 'package:nb_utils/nb_utils.dart';

/// can be replaced with the .env credentials or create a separate Config class either
const String baseUrl = 'https://newsapi.org/v2/';
const String apiKey = 'yourApiKey';
const String country = 'id';
const int pageSize = 20;


List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(id: 1, name: 'English', languageCode: 'en', fullLanguageCode: 'en-US', flag: 'images/flag/ic_us.png'),
    LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', fullLanguageCode: 'hi-IN', flag: 'images/flag/ic_hi.png'),
  ];
}
