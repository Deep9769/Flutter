import 'package:liveasy_intern/views/moblie_number.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_intern/tools/widget.dart';
import 'package:language_pickers/languages.dart';
import 'package:language_pickers/language_pickers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Liveasy());
}

class Liveasy extends StatefulWidget {
  @override
  _LiveasyState createState() => _LiveasyState();
}

class _LiveasyState extends State<Liveasy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        backgroundColor: Colors.deepPurpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          

        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Language _selectedDropdownLanguage =
      LanguagePickerUtils.getLanguageByIsoCode('en');

  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 4,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: TextStyle(
        backgroundColor: Colors.pinkAccent,
        color: Colors.indigo,
        decorationColor: Colors.green,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontStyle: FontStyle.italic),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: eAppBar(),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                width: 50,
                height: 50,
                child: Image(
                  image: AssetImage("assets/images/languagescreen.png"),
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              "Please Select Your Language",
              style: bigTextStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            Text("You can change your language",
                style: selectLanguageTextStyle()),
            SizedBox(
              height: 10,
            ),
            Text("At any time", style: selectLanguageTextStyle()),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: 300,
              decoration: eBoxDecoration(),
              child: LanguagePickerDropdown(
                initialValue: 'en',
                itemBuilder: _buildDropdownItem,
                onValuePicked: (Language language) {
                  _selectedDropdownLanguage = language;
                  // print(_selectedDropdownLanguage.name);
                  // print(_selectedDropdownLanguage.isoCode);
                },
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MobileNumber()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff03032E),
                ),
                child: Text(
                  "Next",
                  style: elevatedButtonTextStyle(),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Image(
                image: AssetImage("assets/images/wave.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
