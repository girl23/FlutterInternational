import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'hy_localization.dart';
//import 'hy_localizations_delegate.dart';
//import 'generated/l10n.dart';
import 'translations.dart';
import 'locale_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      localizationsDelegates: [                             //此处
        GlobalMaterialLocalizations.delegate,//指定本地化的字符串和一些其他的值
        GlobalWidgetsLocalizations.delegate,//对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate, //指定默认的文本排列方向, 由左到右或由右到左
//        HYLocalizationsDelegate.delegate,
//        S.delegate
        const TranslationsDelegate(),
        //自定义的国际化代理文件
      ],
      supportedLocales: localeUtil.supportedLocales(),

//      supportedLocales: S.delegate.supportedLocales,

//      supportedLocales: [                                   //此处
//        const Locale('zh'),
//        const Locale('en'),
//      ],
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title:Text(HYLocalizations.of(context).title),
//        title:Text(S.of(context).title),
      title:Text(Translations.of(context).text("title")),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
//            Text(HYLocalizations.of(context).greet),
//            Text(S.of(context).hello),
            Text(Translations.of(context).text("greet")),
            RaisedButton(
//              child: Text(HYLocalizations.of(context).pickTime),
//            child: Text(S.of(context).),
              child: Text(Translations.of(context).text("picktime")),
              onPressed: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2019),
                    lastDate: DateTime(2022)
                ).then((pickTime) {
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
