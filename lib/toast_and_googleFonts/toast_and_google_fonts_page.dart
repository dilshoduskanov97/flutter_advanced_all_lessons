import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ToastAndFonts extends StatefulWidget {
  const ToastAndFonts({Key? key}) : super(key: key);
  static const String id = "toast_and_fonts";

  @override
  State<ToastAndFonts> createState() => _ToastAndFontsState();
}

class _ToastAndFontsState extends State<ToastAndFonts> {
  void toastFlutter() {
    Fluttertoast.showToast(
        msg: "Hi Flutter Developer",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFFFF1744),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Flutter"),
      ),
      body: Center(
        child: MaterialButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          onPressed: () {
            toastFlutter();
          },
          child: Text(
            'Toast and GoogleFonts',
            style: GoogleFonts.italiana(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
