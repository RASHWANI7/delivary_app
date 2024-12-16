import 'package:flutter/material.dart';
import 'package:delivery_app/view/widgets/text_field.dart';
import 'package:delivery_app/view/widgets/my_button.dart';
import 'package:delivery_app/constants/constants.dart';
import 'package:delivery_app/model/authentication_provider.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _Log_InState();
}

class _Log_InState extends State<LogInPage> {
  TextEditingController phonenumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void ShowSnackBar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Constants.primary_color,
        content: Center(
          child: Text(error),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [ Constants.primary_color, Constants.secondary_color
                  ])),
              child: const Padding(
                padding: EdgeInsets.only(top: 50.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hello\nSign in !',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(140))),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 35.0, right: 35, top: 70, bottom: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text_Field(
                              controller: phonenumberController,
                              hint: 'phone number',
                              icon: Icons.check,
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text_Field(
                              controller: passwordController,
                              hint: 'Password',
                              icon: Icons.visibility_off,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            My_Button(
                              text: 'Log In',
                              onTap: () {
                                if (phonenumberController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  ShowSnackBar('all field are required');
                                  authProvider.setLoading(false);
                                }
                                else {
                                  authProvider.login(
                                      phonenumberController.text.toString(),
                                      passwordController.text.toString(),
                                      context);
                                }
                              },
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Do not have an account',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, 'phonenumber_page');
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
