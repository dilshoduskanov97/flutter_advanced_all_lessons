import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationPage extends StatefulWidget {
  const LocalizationPage({Key? key}) : super(key: key);
  static const String id = "localization";

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(child: Text("Welcome".tr())),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MaterialButton(
                  child: const Text("English"),
                  elevation: 0,
                  minWidth: 100,
                  shape: const StadiumBorder(),
                  color: Colors.blue,
                  onPressed: () {
                    context.locale = const Locale("en", "EN");
                  },
                ),
                const SizedBox(width: 5),
                MaterialButton(
                  child: const Text("Uzbek"),
                  elevation: 0,
                  minWidth: 100,
                  shape: const StadiumBorder(),
                  color: Colors.red,
                  onPressed: () {
                    context.locale = const Locale("uz", "UZ");
                  },
                ),
                const SizedBox(width: 5),
                MaterialButton(
                  child: const Text("Russian"),
                  elevation: 0,
                  minWidth: 100,
                  shape: const StadiumBorder(),
                  color: Colors.green,
                  onPressed: () {
                    context.locale = const Locale("ru", "RU");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
