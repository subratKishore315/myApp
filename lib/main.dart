import 'package:flutter/material.dart';
import 'package:login/CommonClasses/service_locator.dart';
import 'package:login/Screens/logInScreen.dart';
import 'package:login/Screens/signUpScreen.dart';
import 'package:login/testing/blanknote.dart';
import 'package:login/testing/monaPage.dart';
import 'package:login/testing/historyApp.dart';
//import 'package:login/testing/blanknote.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  setUpLocator();

  tz.initializeTimeZones();
  tz.getLocation("America/Detroit"); // Asia/Kolkata
  runApp(
    MaterialApp(
    home: Scaffold(body: History234(),),
    debugShowCheckedModeBanner: false,
  )
       // MyApp()
      //ReadContacts()
      //wpMsgSend()
      //localDataShow()
    //  myLogInApp()  
    
      );
  // blanknote
  
}

// ignore: camel_case_types
class myLogInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreenPage(),
        theme: ThemeData.dark(),
        initialRoute: '/myLoginPage',
        routes: <String, WidgetBuilder>{
          '/myLoginPage': (BuildContext context) => LoginScreenPage(),
          '/signUpScreen': (BuildContext context) => signUpScreen(),
        },
      ),
    );
  }
}
