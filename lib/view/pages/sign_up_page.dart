import 'package:flutter/material.dart';
import 'package:delivery_app/constants/constants.dart';
import 'package:delivery_app/model/authentication_provider.dart';
import 'package:delivery_app/view/widgets/text_field.dart';
import 'package:delivery_app/view/widgets/my_button.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<SignUpPage> {
  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController phonenumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

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
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Constants.primary_color,
                    Constants.secondary_color
                  ])),
              child: const Padding(
                padding: EdgeInsets.only(
                    top: 30, left: 10, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Create a new account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 27),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 35),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: (const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 20, right: 20, bottom: 20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20, right: 20, bottom: 20),
                            child: Column(
                              children: [
                                Text_Field(
                                  controller: firstnameController,
                                  hint: 'First Name',
                                  icon: null,
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text_Field(
                                  controller: lastnameController,
                                  hint: 'Last Name',
                                  icon: null,
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text_Field(
                                  controller: phonenumberController,
                                  hint: 'phone number',
                                  icon: null,
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text_Field(
                                  controller: passwordController,
                                  hint: 'Password',
                                  icon: null,
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text_Field(
                                  controller: confirmpasswordController,
                                  hint: 'Confirm Password',
                                  icon: null,
                                  obscureText: true,
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                My_Button(
                                  text: 'Confirm',
                                  onTap: () {
                                    authProvider.setLoading(true);
                                    if (firstnameController.text.isEmpty ||
                                        lastnameController.text.isEmpty ||
                                        phonenumberController.text.isEmpty ||
                                        passwordController.text.isEmpty ||
                                        confirmpasswordController
                                            .text.isEmpty) {
                                      ShowSnackBar('all field are required');
                                      authProvider.setLoading(false);
                                    }
                                    else {
                                      String phone='+963${phonenumberController.text}'.toString();
                                      authProvider.SignUp(
                                        firstnameController.text.toString(),
                                        lastnameController.text.toString(),
                                        phone,
                                        passwordController.text.toString(),
                                        confirmpasswordController.text
                                            .toString(),
                                        context,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
