import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_app/utils/localizations_utils/app_localizations_delegate.dart';
import 'config/index.dart';
import 'presentation/screens/index.dart';
import 'utils/shared_preferences/shared_preferences.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {


  static void setLocale(BuildContext context,Locale newLocale){
    final state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      _locale = locale;
    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme(),
      locale: _locale,
      supportedLocales: const [
        Locale("en",""),
        Locale("es",""),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      debugShowCheckedModeBanner: false,
      title: 'Multi Language',
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          
        }
      }
        return supportedLocales.first;
      },
      home:const HomeScreen()
    );
  }
}




