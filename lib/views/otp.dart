import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_intern/tools/widget.dart';
import 'package:liveasy_intern/views/profile.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class Otpscreen extends StatefulWidget {
  final String phone;

  Otpscreen(this.phone);

  @override
  _OtpscreenState createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController otpController = TextEditingController();
  String verificationCode;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: eAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Verify Phone",
              style: bigTextStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Code is sent to ${widget.phone}',
              style: selectLanguageTextStyle(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldStyle: FieldStyle.box,
                  fieldWidth: 50,
                  style: TextStyle(fontSize: 16),
                  onChanged: (pin) {
                    print("Changed" + pin);
                  },
                  onCompleted: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: verificationCode, smsCode: pin))
                          .then((value) async {
                        if (value.user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePageScreen()),
                              (route) => true);
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      scaffoldKey.currentState
                          .showSnackBar(SnackBar(content: Text("Invalid OTP")));
                    }
                    print("Completed" + pin);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  " Request Again",
                  style: TextStyle(color: Color(0xff0F55B9), fontSize: 17),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff03032E),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePageScreen()));
                },
                child: Center(
                  child: Text(
                    "VERIFY AND CONTINUE",
                    style: elevatedButtonTextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _verifyPhone() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePageScreen()),
                  (route) => true);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationID, int resendToken) {
          setState(() {
            verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
