import 'package:flutter/material.dart';

class HYLocalizations {
  final Locale locale;
  static HYLocalizations of(BuildContext context) {
    return Localizations.of(context, HYLocalizations);
  }
  HYLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "title": "home",
      "greet": "hello~",
      "picktime": "Pick a Time"
    },
    "zh": {
      "title": "首页",
      "greet": "你好~",
      "picktime": "选择一个时间"
    }
  };

  String get title {
    return _localizedValues[locale.languageCode]["title"];
  }

  String get greet {
    return _localizedValues[locale.languageCode]["greet"];
  }

  String get pickTime {
    return _localizedValues[locale.languageCode]["picktime"];
  }
}