import 'package:delivery_app/view/pages/history_page.dart';
import 'package:delivery_app/view/pages/navigator_page.dart';
import 'package:delivery_app/view/pages/login_page.dart';
import 'package:delivery_app/view/pages/otp_page.dart';
import 'package:delivery_app/view/pages/phonenumber_page.dart';
import 'package:delivery_app/view/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app/model/authentication_provider.dart';
import 'package:delivery_app/view/pages/sign_up_page.dart';
import 'package:delivery_app/view/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SignUpPage(),
        routes: {
          'log_in_page': (context) => const LogInPage(),
          'sign_up_page': (context) => const SignUpPage(),
          'home_page': (context) => const HomePage(),
          'setting_page': (context) => const SettingPage(),
          'history_page': (context) => const HistoryPage(),
          'phonenumber_page': (context) =>  PhonenumberPage(),
          //'otp_page': (context) =>const OtpPage(),
        },
      ),
    );
  }
}


