import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'hy_localization.dart';
class HYLocalizationsDelegate extends LocalizationsDelegate<HYLocalizations> {
  @override
//  用于当前环境的Locale，是否在我们支持的语言范围
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
//  当Localizations Widget重新build时，是否调用load方法重新加载Locale资源
//  一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次Localizations重新build时都加载一遍；
//  所以一般情况下返回false即可；
  bool shouldReload(LocalizationsDelegate<HYLocalizations> old) {
    return false;
  }

  @override
//  当Locale发生改变时（语言环境），加载对应的HYLocalizations资源
//  这个方法返回的是一个Future，因为有可能是异步加载的；
//  但是我们这里是直接定义的一个Map，因此可以直接返回一个同步的Future（SynchronousFuture）
  Future<HYLocalizations> load(Locale locale) {
    return SynchronousFuture(HYLocalizations(locale));
  }
//  static Map<String, Map<String, String>> _localizedValues = {};

//  Future<bool> loadJson() async {
//    // 1.加载json文件
//    String jsonString = await rootBundle.loadString("assets/json/i18n.json");
//
//    // 2.转成map类型
//    final Map<String, dynamic> map = json.decode(jsonString);
//
//    // 3.注意：这里是将Map<String, dynamic>转成Map<String, Map<String, String>>类型
//    _localizedValues = map.map((key, value) {
//      return MapEntry(key, value.cast<String, String>());
//    });
//    return true;
//  }
//  @override
//
//  Future<HYLocalizations> load(Locale locale) async {
//    final localization = HYLocalizations(locale);
//    await localization.loadJson();
//    return localization;
//  }
  static HYLocalizationsDelegate delegate = HYLocalizationsDelegate();
}