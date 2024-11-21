import 'package:flutter/material.dart';
import 'package:tourism_app/constant.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tourism_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart'; // استيراد Firebase Auth

class LogIN extends StatefulWidget {
  const LogIN({super.key});

  @override
  State<LogIN> createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  final _emailController = TextEditingController(); // للتحكم في حقل البريد الإلكتروني
  final _passwordController = TextEditingController(); // للتحكم في حقل كلمة السر
  String _errorMessage = ""; // لعرض رسالة الخطأ

  // دالة لتسجيل الدخول باستخدام البريد الإلكتروني وكلمة السر
  Future<void> _login() async {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = "البريد الإلكتروني أو كلمة السر غير صحيحة!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: kTextLightColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
            FadeInUp(
              duration: Duration(seconds: 2),
              child: Padding(
                padding: const EdgeInsets.only(top: 100, right: 100),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 450, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FadeInUp(
                    duration: Duration(milliseconds: 1600),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "الايميل او رقم الهاتف",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: kTextColor,
                                width: 4.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: kTextColor,
                                width: 4.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _passwordController,
                          obscureText: true, // لإخفاء كلمة السر
                          decoration: InputDecoration(
                            hintText: "كلمة السر",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: kTextColor,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: kTextColor,
                                width: 4.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        if (_errorMessage.isNotEmpty)
                          Text(
                            _errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 630, right: 30),
              child: FadeInUp(
                duration: Duration(milliseconds: 1600),
                child: ElevatedButton(
                  onPressed: _login, // استدعاء الدالة لتسجيل الدخول
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 140),
                      backgroundColor: kTextColor),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
