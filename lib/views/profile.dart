import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_intern/tools/widget.dart';

class ProfilePageScreen extends StatefulWidget {
  @override
  _ProfilePageScreenState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  int _value = 0;
  String uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: eAppBar(),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Select Your Profile",
                style: bigTextStyle(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 100,
              decoration: eBoxDecoration(),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.scale(
                    scale: 2,
                    child: Radio(
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage("assets/images/shipper.png"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: Text(
                            "Shipper",
                            style: profileTextStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Loren ipsum dolor sit amet,",
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "consectetur adipiscing",
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 100,
              decoration: eBoxDecoration(),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform.scale(
                    scale: 2,
                    child: Radio(
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    child: Image(
                      image: AssetImage("assets/images/truck.png"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 27),
                          child: Text(
                            "Transporter",
                            style: profileTextStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Loren ipsum dolor sit amet,",
                            style:
                                TextStyle(fontSize: 14, color: Colors.blueGrey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "consectetur adipiscing",
                            style:
                                TextStyle(fontSize: 14, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePageScreen()));
                },
                style: ElevatedButton.styleFrom(primary: Color(0xff03032E)),
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
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
  }
}
