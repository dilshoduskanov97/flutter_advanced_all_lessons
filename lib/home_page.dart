import 'package:flutter/material.dart';
import 'package:flutter_advanced_all_lessons/localization/localization_page.dart';
import 'hive_nosql_database/hive_home_page.dart';
import 'shared_preferences/home_page.dart';
import 'shared_preferences/storeName_and_loadName/homepage.dart';
import 'toast_and_googleFonts/toast_and_google_fonts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, ToastAndFonts.id);
              },
              shape: StadiumBorder(),
              minWidth: 300,

              child: Text("Toast and Google Fonts Page"),
              color: Color(0xFF263238),
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, LocalizationPage.id);
              },
              shape: StadiumBorder(),
              minWidth: 300,
              child: Text("Localization Page"),
              color: Color(0xFF263238),
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, SharedPreferencesHomePage.id);
              },
              shape: StadiumBorder(),
              minWidth: 300,
              child: Text("SharedPreferences Page"),
              color: Color(0xFF263238),
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, HiveHomePage.id);
              },
              shape: StadiumBorder(),
              minWidth: 300,
              child: Text(" Hive Page"),
              color: Color(0xFF263238),
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, SharedPreferencesNew.id);
              },
              shape: StadiumBorder(),
              minWidth: 300,
              child: Text(" Page"),
              color: Color(0xFF263238),
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, SharedPreferencesNew.id);
              },
              shape: StadiumBorder(),
              minWidth: 300,
              child: Text(" Page"),
              color: Color(0xFF263238),
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, SharedPreferencesNew.id);
              },
              shape: StadiumBorder(),
              minWidth: 300,
              child: Text(" Page"),
              color: Color(0xFF263238),
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
