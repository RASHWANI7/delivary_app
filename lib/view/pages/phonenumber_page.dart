import 'package:delivery_app/constants/constants.dart';
import 'package:delivery_app/view/widgets/second_button.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/model/authentication_provider.dart';
import 'package:provider/provider.dart';

class PhonenumberPage extends StatelessWidget {

   PhonenumberPage({super.key});

  TextEditingController phonenumberController = TextEditingController();
  final String _prefixText = '+963 ';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20,100,20,20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('lib/images/phone.jpg',height: 200,),
              const Text('Enter your phone number',style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
              ),),
              const SizedBox(height: 10,),
              const Text('We Will Send You The 4 digit verification code',style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: TextField(
                  controller: phonenumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 12.0,left: 15),
                      child: Text(_prefixText,style: const TextStyle( color: Colors.black, fontWeight: FontWeight.bold, ),),
                    ),
                    prefixStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold, ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), ),
                       enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide( color: Constants.primary_color, width: 2.0, ), ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Constants.primary_color,  width: 2.0, ), ), ),
                   ), ),
                  const SizedBox(height: 90,),
                  SecondButton(text: 'GENERATE OTP',
                      onTap: (){
                    if(phonenumberController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Center(child: Text('phone number is required')), duration: Duration(seconds: 3), backgroundColor: Colors.blue));
                    }else{
                      authProvider.PhoneNumber(phonenumber: '+963${phonenumberController.text}'.toString(),context: context);
                    }
                  })
            ],
          ),
        ),
      )
    );
  }
}
