import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liveasy_intern/tools/widget.dart';
import 'package:liveasy_intern/views/otp.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:liveasy_intern/views/profile.dart';

class MobileNumber extends StatefulWidget {
  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phoneController = TextEditingController();
  String countrycode = "";
  String verificationCode;

  void _onCountryChange(CountryCode countryCode) {
    this.countrycode = countryCode.dialCode;
    print("New Country selected: " + countryCode.dialCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale("en", "uk"),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
      ],
      home: Scaffold(
        appBar: eAppBar(),
        extendBodyBehindAppBar: true,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Please enter your mobile number",
                style: bigTextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You'll receive 4 digit code",
                style: selectLanguageTextStyle(),
              ),
              Text(
                "To verify next",
                style: selectLanguageTextStyle(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: 300,
                height: 50,
                decoration: eBoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CountryCodePicker(
                      onChanged: _onCountryChange,
                      initialSelection: 'IN',
                      favorite: ['IN'],
                      showFlag: true,
                      showFlagMain: true,
                      onInit: (code) => {
                        print(
                            "on init ${code.name} ${code.dialCode} ${code.name}"),
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      //padding: EdgeInsets.only(),
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      child: Expanded(

                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: TextField(
                              //maxLength: 10,
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintText: "Mobile Number",
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black26,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Otpscreen(phoneController.text)));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff03032E),
                  ),
                  child: Center(
                    child: Text(
                      "CONTINUE",
                      style: elevatedButtonTextStyle(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
