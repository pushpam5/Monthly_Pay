import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/CustomerDashboard.dart';
import 'package:monthly_pay_admin/Ledger_Details/ledger_details.dart';
import 'package:monthly_pay_admin/Profile/profile.dart';
import 'package:monthly_pay_admin/Transaction_Details/models/TransactionModel.dart';
import 'package:monthly_pay_admin/Transaction_Details/transaction_details.dart';

class NavigationBar extends StatefulWidget {

  final int currentTab;
  NavigationBar({this.currentTab});
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {


  void _fadeTransition(BuildContext context, Widget widget) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: Duration(
          milliseconds: 600,
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  List<Widget> bottomBarWidgets = [
    CustomerDashboard(),
    TransactionDetails(transactionModel: TransactionModel(name: 'N.D.P.S'),),
    LedgerDetails(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    int _currentTab = widget.currentTab;
    return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.07,
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  if (_currentTab != index) {
                    _fadeTransition(context, bottomBarWidgets[index]);
                  }

                  _currentTab = index;
                });
              },
              currentIndex: _currentTab,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: SizedBox.shrink(),
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    title: SizedBox.shrink()),
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.bookOpen,
                      size: 25,
                    ),
                    title: SizedBox.shrink()),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), title: SizedBox.shrink()),
              ],
              iconSize: 29,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
            ),
          );
  }
}