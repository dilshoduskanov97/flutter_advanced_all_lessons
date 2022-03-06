import 'package:flutter/material.dart';

class HiveHomePage extends StatefulWidget {
  const HiveHomePage({Key? key}) : super(key: key);
  static const String id = "hive_home_page";

  @override
  State<HiveHomePage> createState() => _HiveHomePageState();
}

class _HiveHomePageState extends State<HiveHomePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _doLogin(){
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    print(username);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(hintText: "UserName"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: _doLogin,
                child: Text("Login"),
            ),
          ],
        ),
      ),
    ));
  }
}
