import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_all_lessons/hive_nosql_database/hive_home_page.dart';
import 'package:flutter_advanced_all_lessons/shared_preferences/email_and_password/pages/signUp_page.dart';
import 'home_page.dart';
import 'localization/localization_page.dart';
import 'shared_preferences/email_and_password/pages/signIn_page.dart';
import 'shared_preferences/home_page.dart';
import 'shared_preferences/storeName_and_loadName/homepage.dart';
import 'toast_and_googleFonts/toast_and_google_fonts_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales:  [
          Locale('en', 'EN'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ')
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale:  Locale('en', 'EN'),
        child:  MyApp()),
  );
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
      routes: {
        HomePage.id: (context) =>  HomePage(),
        LocalizationPage.id: (context) =>  LocalizationPage(),
        SharedPreferencesNew.id: (context) =>  SharedPreferencesNew(),
        ToastAndFonts.id: (context) =>  ToastAndFonts(),
        SignInPage.id: (context) =>  SignInPage(),
        SharedPreferencesHomePage.id: (context) => SharedPreferencesHomePage(),
        SignUpPage.id: (context) =>  SignUpPage(),
        HiveHomePage.id: (context) =>  HiveHomePage(),

      },
    );
  }
}
