import 'package:flutter/material.dart';

import 'prefs_class.dart';

class SharedPreferencesNew extends StatefulWidget {
  const SharedPreferencesNew({Key? key}) : super(key: key);
  static const String id = "shared_preferences_new";

  @override
  State<SharedPreferencesNew> createState() => _SharedPreferencesNewState();
}

class _SharedPreferencesNewState extends State<SharedPreferencesNew> {
  String myName = "";

  void showName() async {
    String? name = await Prefs.loadName();
    if (name != null) {
      setState(() {
        myName = name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Prefs.storeName("Hi Flutter Developer");
              },
              child: const Text("Store Name"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showName();
              },
              child: const Text("Load Name"),
            ),
            SizedBox(height: 10),
            Text("Name: " + myName),
          ],
        ),
      ),
    );
  }
}
