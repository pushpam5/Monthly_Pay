import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/CustomerDashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        accentColor: Colors.white,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          headline6: TextStyle(
            color: Colors.blue[900],
            fontSize: 30,
          ),
          subtitle1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          subtitle2: TextStyle(
            color: Colors.grey[700],
            fontSize: 17,
          )
        ),
      ),
      home: CustomerDashboard(),
    );
  }
}
