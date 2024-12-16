import 'dart:convert';
import 'package:delivery_app/view/pages/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:delivery_app/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void ShowSnackBar(String error, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: Constants.primary_color,
        content: Center(
          child: Text(error),
        )));
  }

  Future<void> login(
      String phonenumber, String password, BuildContext context) async {
    setLoading(true);
    try {
      Response response = await http.post(
        Uri.parse('http://26.231.83.119:51962/api/login'),
        body: json.encode({
          'phonenumber': phonenumber,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // if the user the log in correct
      if (response.statusCode == 200) {
        print(response.body);
        setLoading(false);
        Navigator.pushNamed(context, 'home_page');
        Navigator.pop(context);
      }
      //
      else if (response.statusCode == 422) {
        setLoading(false);
        final Map<String, dynamic> responseData = jsonDecode(response.body);

      } else if (response.statusCode == 302) {
        // Redirect URL handling (not typically needed for APIs)
        print('Redirect URL: ${response.headers['location']}');
        setLoading(false);
      }
      //the user is not excised
      else if (response.statusCode == 401) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String errors = responseData['error'];
        setLoading(false);
        ShowSnackBar(errors, context);
        print(errors);
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }


  Future<void> SignUp(String firstName, String lastName, String phonenumber,
      String password, String confirmPassword, BuildContext context) async {
    Response response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/register'),
      body: json.encode({
        'first_name': firstName,
        'last_name': lastName,
        'phone': phonenumber,
        'password': password,
        'confirmPassword': confirmPassword,
      }),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final String userResponse = jsonResponse['token'];
      print(response.body);
      setLoading(false);
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Constants.primary_color,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('close'),
              ),
            ],
            title: const Text(
              'Your Account Added Successfully',
              style: TextStyle(fontSize: 22),
            ),
            contentPadding: const EdgeInsets.only(top: 20, left: 40),
            content: const Text('check your account',
                style: TextStyle(fontSize: 18)),
          ));
      // store the token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Constants.Access_Token, userResponse);
    }
    if (response.statusCode == 422) {
      var key;
      String errors = '';
      setLoading(false);
      print(' the body ' + response.body);
      // final String errors = responseData['error'][''];
      // setLoading(false);
      // print(errors);
      // ShowSnackBar(errors, context);
      final error = jsonDecode(response.body)['errors'];
      for (key in error.keys) {
        errors = '${error[key][0]}';
        print(errors);
        ShowSnackBar(errors, context);
      }
    }
    if (response.statusCode == 401) {
      print(response.body);
    }
  }
  Future <void>PhoneNumber({required String phonenumber,required BuildContext context}) async{
    print(phonenumber);
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return OtpPage(number: phonenumber);
    }));
  }
  Future<void> OTP({required String otp_number,required BuildContext context})async{
    print(otp_number);
  }
}
