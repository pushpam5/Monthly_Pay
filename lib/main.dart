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
        primaryColor: Colors.lightBlue[600],
        accentColor: Colors.white,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'BenchNine'
          ),
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 30,
              fontFamily: 'SIMPLIFICA'

          ),
          subtitle1: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontFamily: 'BenchNine',

            fontSize: 20,
          ),
          subtitle2: TextStyle(
            color: Colors.grey,
            fontSize: 17,
            fontFamily: 'BenchNine',
          )
        ),
      ),
      home: CustomerDashboard(),
    );
  }
}
