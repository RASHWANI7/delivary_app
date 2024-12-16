import 'package:delivery_app/view/widgets/otp_number.dart';
import 'package:delivery_app/view/widgets/second_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import 'package:delivery_app/model/authentication_provider.dart';

class OtpPage extends StatelessWidget {
  String number;
   OtpPage({super.key,required this.number});

  TextEditingController firstnumberController = TextEditingController();
  TextEditingController secondnumberController = TextEditingController();
  TextEditingController thirdnumberController = TextEditingController();
  TextEditingController fourthnumberController = TextEditingController();

  final FocusNode firstFocus = FocusNode();
  final FocusNode secondFocus = FocusNode();
  final FocusNode thirdFocus = FocusNode();
  final FocusNode fourthFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:const EdgeInsets.fromLTRB(15,140,15,20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/images/phone.jpg',height: 180,),
              const SizedBox(height: 20,),
              const Text('OTP Verification',style: TextStyle(
                color: Colors.black,
                fontSize: 23,
              ),),
              const SizedBox(height: 5,),
              Text('Enter the OTP sent to $number',style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 19,
              ),),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,20,30,70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  OtpNumber(controller: firstnumberController,currentFocus: firstFocus, nextFocus: secondFocus),
                  OtpNumber(controller: secondnumberController,currentFocus: secondFocus, nextFocus: thirdFocus),
                  OtpNumber(controller: thirdnumberController,currentFocus: thirdFocus, nextFocus: fourthFocus),
                  OtpNumber(controller: fourthnumberController,currentFocus: fourthFocus, nextFocus: fourthFocus),
                ],),
              ),
              SecondButton(text: 'VERIFY & CONTINUE', onTap: (){
                if(firstnumberController.text.isEmpty||secondnumberController.text.isEmpty||thirdnumberController.text.isEmpty||fourthnumberController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Center(child: Text('phone number is required')), duration: Duration(seconds: 3), backgroundColor: Colors.blue));
                }else{
                  String otp = firstnumberController.text + secondnumberController.text+thirdnumberController.text+fourthnumberController.text;
                  authProvider.OTP(otp_number: otp,context: context);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

