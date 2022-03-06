import 'package:flutter/material.dart';
import 'email_and_password/pages/signIn_page.dart';
import 'storeName_and_loadName/homepage.dart';

class SharedPreferencesHomePage extends StatefulWidget {
  const SharedPreferencesHomePage({Key? key}) : super(key: key);
  static String id = "sharedPreferencesHomePage";

  @override
  State<SharedPreferencesHomePage> createState() =>
      _SharedPreferencesHomePageState();
}

class _SharedPreferencesHomePageState extends State<SharedPreferencesHomePage> {
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
                Navigator.pushNamed(context, SharedPreferencesNew.id);
              },
              shape: const StadiumBorder(),
              minWidth: 200,
              child: const Text("Store and Load Page"),
              color: const Color(0xFF263238),
              textColor: Colors.white,
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInPage.id);
              },
              shape: const StadiumBorder(),
              minWidth: 200,
              child: const Text("Email and Password Page"),
              color: const Color(0xFF263238),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
