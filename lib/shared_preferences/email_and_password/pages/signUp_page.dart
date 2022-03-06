import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/pref_service.dart';
import 'signIn_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = "sign_up_page";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isFull = false;
  String warning = '';

  void _dialog(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Warning'),
            content: Text(text),
            actions: [
              isFull
                  ? TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, SignInPage.id);
                      },
                      child: Text('Login in'))
                  : TextButton(onPressed: _clear, child: Text('Clear')),
            ],
          );
        });
  }

  bool _alreadySignUp() {
    Pref.loadUser().then((user) {
      if (user != null) {
        setState(() {
          isFull = true;
        });
      }
    });
    return isFull;
  }

  void _clear() {
    Pref.removeUser();
    _emailController.clear();
    _passwordController.clear();
    _nameController.clear();
    _phoneController.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _alreadySignUp();
  }

  void _doSignUp(bool _isFull) {
    if (_isFull) {
      setState(() {
        warning = 'Already you have an account, back to Sign In';
      });
      _dialog(warning);
    } else {
      String email = _emailController.text.toString().trim();
      String password = _passwordController.text.toString().trim();
      String name = _nameController.text.toString().trim();
      String phone = _phoneController.text.toString().trim();

      User user =
          User(email: email, password: password, name: name, phone: phone);
      Pref.storeUser(user);

      setState(() {
        isFull = email.length != 0 &&
            password.length != 0 &&
            phone.length != 0 &&
            name.length != 0;
      });

      if (isFull) {
        Navigator.pushReplacementNamed(context, SignInPage.id);
      } else {
        _dialog('Try again!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // #back button
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, SignInPage.id);
                  },
                ),
              ),

              // #texts
              SizedBox(
                height: 30,
              ),
              Text(
                "Let's Get Started!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Create an account to Q Allure to get all features',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(
                height: 30,
              ),

              // #text_fields
              Container(
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color(0xFF2196F3),
                    )),
                child: TextField(
                  style: TextStyle(
                      color: Color(0xFF2196F3),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.person,
                      color: Color(0xFF2196F3),
                      size: 18,
                    ),
                    hintText: 'Name',
                    hintStyle:
                        TextStyle(color: Color(0xFF2196F3), fontSize: 15),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey[400],
                        size: 22,
                      ),
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 15)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        CupertinoIcons.device_phone_portrait,
                        color: Colors.grey[400],
                        size: 22,
                      ),
                      hintText: 'Phone',
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 15)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.lock,
                        color: Colors.grey[400],
                        size: 16,
                      ),
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 15)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.lock,
                        color: Colors.grey[400],
                        size: 16,
                      ),
                      hintText: 'Confirm Password',
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 15)),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              // #signin
              Container(
                height: 55,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  color: Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(27.5),
                ),
                child: TextButton(
                  child: Text(
                    'CREATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    _doSignUp(isFull);
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  GestureDetector(
                    child: Text(
                      'Login here',
                      style: TextStyle(
                          color: Color(0xFF2196F3),
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignInPage.id);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
