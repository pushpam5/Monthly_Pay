import 'package:flutter/material.dart';

import 'package:monthly_pay_admin/Common_Widgets/bottomNavigationBar.dart';
import 'package:monthly_pay_admin/Common_Widgets/curve_painter.dart';
import 'package:monthly_pay_admin/Common_Widgets/date_select.dart';
import 'package:monthly_pay_admin/Customer_Dashboard/CustomerDashboard.dart';
import 'package:monthly_pay_admin/Ledger_Details/widgets/ledger_list.dart';
import 'package:monthly_pay_admin/Ledger_Details/widgets/search_bar_ledger/search_bar_widget.dart';
import 'package:monthly_pay_admin/Profile/models/request_class.dart';
import 'package:monthly_pay_admin/Profile/widgets/request.dart';

class LedgerDetails extends StatefulWidget {
  @override
  _LedgerDetailsState createState() => _LedgerDetailsState();
}

class _LedgerDetailsState extends State<LedgerDetails>
    with SingleTickerProviderStateMixin {
  Animation animationForLedgerList;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animationForLedgerList = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  int _currentTab = 2;

  List<RequestClass> newRequest = [
    RequestClass(
        name: 'N.D.P.S',
        mobile: 1234567890,
        description: 'Description',
        date: DateTime.now(),
        status: 'Accepted'),
    RequestClass(
        name: 'Shivani Jaiswal',
        mobile: 9876944585,
        description: 'Description',
        date: DateTime.now(),
        status: 'Accepted'),
    RequestClass(
        name: 'Shivani Jaiswal',
        mobile: 9876944585,
        description: 'Description',
        date: DateTime.now(),
        status: 'Rejected')
  ];

  Future<bool> _backPressed() {
    return Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => CustomerDashboard()));
  }

  @override
  Widget build(BuildContext context) {
    void _fadeTransitionWithPush(BuildContext context, Widget widget) {
      Navigator.of(context).push(
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

    AppBar _appBar = AppBar(
      elevation: 0.0,
      title: Text('Ledger Details'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {
              _fadeTransitionWithPush(context, request(newRequest));
            })
      ],
    );

    final _heightOfScreen = MediaQuery.of(context).size.height * 0.93 -
        _appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final _widthOfScreen = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return WillPopScope(
            onWillPop: _backPressed,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_downward,
                  color: Theme.of(context).accentColor,
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              appBar: _appBar,
              bottomNavigationBar: NavigationBar(
                currentTab: _currentTab,
              ),
              body: CustomPaint(
                painter: CurvePainter(),
                child: Container(
                  height: _heightOfScreen,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: _heightOfScreen * 0.20,
                        child: DateSelect(),
                      ),
                      Card(
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          height: _heightOfScreen * 0.05,
                          width: _widthOfScreen * 0.9,
                          child: SearchBarLeger(),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                          _widthOfScreen * animationForLedgerList.value,
                          0,
                          0,
                        ),
                        child: Container(
                          height: _heightOfScreen * 0.73,
                          width: _widthOfScreen * 0.96,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0,15.0,8.0,15.0),
                            child: LedgerList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
